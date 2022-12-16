package kr.or.ddit.buyer.service;

import java.util.List;

import javax.inject.Inject;

import kr.or.ddit.buyer.dao.BuyerDAO;
import kr.or.ddit.commons.exception.UserNotFoundException;
import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.vo.BuyerVO;
import kr.or.ddit.vo.PagingVO;

public class BuyerServiceImpl implements BuyerService {

	@Inject
	private BuyerDAO dao ;
	
	@Override
	public ServiceResult createBuyer(BuyerVO buyer) {

			int rowcnt = dao.insertBuyer(buyer);
			ServiceResult result = rowcnt > 0 ? ServiceResult.OK : ServiceResult.FAIL;
	
		return result;
	}


	@Override
	public BuyerVO retrieveBuyer(String buyerId) {
		BuyerVO buyer = dao.selectBuyer(buyerId);
		if(buyer==null)
			throw new UserNotFoundException(buyerId);
	
		return buyer;
	}

	@Override
	public List<BuyerVO> retrieveBuyerList(PagingVO pagingVO) {
		return dao.selectBuyerList(pagingVO);
	}

	@Override
	public ServiceResult modifyBuyer(BuyerVO buyer) {
		retrieveBuyer(buyer.getBuyerId());
		int rowcnt = dao.updateBuyer(buyer);
		return rowcnt > 0 ? ServiceResult.OK : ServiceResult.FAIL;
	}

	@Override
	public ServiceResult removeBuyer(BuyerVO buyer) {
		// TODO Auto-generated method stub
		return null;
	}
	
	public int retrieveBuyerCount(PagingVO pagingVO) {
		return dao.selectTotalRecord(pagingVO);

	}

}
