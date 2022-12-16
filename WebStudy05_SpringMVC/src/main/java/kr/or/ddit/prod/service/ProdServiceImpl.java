package kr.or.ddit.prod.service;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.annotation.PostConstruct;
import javax.inject.Inject;
import javax.management.RuntimeErrorException;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import kr.or.ddit.commons.exception.UserNotFoundException;
import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.prod.dao.ProdDAO;
import kr.or.ddit.vo.PagingVO;
import kr.or.ddit.vo.ProdVO;

@Service
public class ProdServiceImpl implements ProdService {
	@Inject
	private ProdDAO dao;
	
	@Value("#{appInfo.prodImageURL}")
	private File saveFolder;

	@PostConstruct
	public void init() {
		if(!saveFolder.exists()) saveFolder.mkdirs();
	}
	
	@Override
	public ServiceResult createProd(ProdVO prod) {

		int rowcnt = dao.insertProd(prod);
		try {
			if(rowcnt>0)
				prod.saveTo(saveFolder);
			ServiceResult result = rowcnt > 0 ? ServiceResult.OK : ServiceResult.FAIL;
			return result;
			} catch (IOException e) {
				throw new RuntimeException(e);
			}
	}

	@Override
	public ProdVO retrieveProd(String prodId) {
		ProdVO prod = dao.selectProd(prodId);
		if (prod == null)
			throw new UserNotFoundException(prodId);
		return prod;
	}

	@Override
	public List<ProdVO> retrieveProdList(PagingVO pagingVO) {
		return dao.selectProdList(pagingVO);
	}

	@Override
	public ServiceResult modifyProd(ProdVO prod) {
		retrieveProd(prod.getProdId());
		int rowcnt = dao.updateProd(prod);
		try {
		if(rowcnt>0)
			prod.saveTo(saveFolder);
		return rowcnt > 0 ? ServiceResult.OK : ServiceResult.FAIL;
		}catch (IOException e) {
			throw new RuntimeException(e);
		}
	}

	@Override
	public ServiceResult removeProd(ProdVO prod) {
		// TODO Auto-generated method stub
		return null;
	}

	public int retrieveProdCount(PagingVO pagingVO) {
		return dao.selectTotalRecord(pagingVO);

	}

}
