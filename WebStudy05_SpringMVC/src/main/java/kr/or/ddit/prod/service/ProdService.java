package kr.or.ddit.prod.service;

import java.util.List;

import kr.or.ddit.commons.exception.UserNotFoundException;
import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.vo.PagingVO;
import kr.or.ddit.vo.ProdVO;

/**
 * 상품관리 Business Logic Layer
 *
 */
public interface ProdService {
	/**
	 * 상품 신규 등록
	 * @param member
	 * @return  {@link ServiceResult.OK}, {@link ServiceResult.FAIL}
	 */
	public ServiceResult createProd(ProdVO prod);
	/**
	 * 상품 정보 상세조회
	 * @param prodId 조회할 상품아이디
	 * @return 존재하지 않는 경우, {@link UserNotFoundException} 발생.
	 */
	public ProdVO retrieveProd(String prodId);
	/**
	 * 상품 목록 조회, 차후 페이징과 검색 기능 추가함.
	 * @param pagingVO TODO
	 * @return
	 */
	public List<ProdVO> retrieveProdList(PagingVO pagingVO);
	/**
	 * 상품 정보 수정.
	 * @param ProdVO prod
	 * @return 존재하지 않는 경우, {@link UserNotFoundException} 발생.
	 * 			{@link ServiceResult.INVALIDPASSWORD}, 
	 * 			{@link ServiceResult.OK}, {@link ServiceResult.FAIL}
	 */
	public ServiceResult modifyProd(ProdVO prod);
	/**
	 * 상품 정보 제거
	 * @param prod
	 * @return 존재하지 않는 경우, {@link UserNotFoundException} 발생.
	 * 			{@link ServiceResult.INVALIDPASSWORD}, 
	 * 			{@link ServiceResult.OK}, {@link ServiceResult.FAIL}
	 */
	public ServiceResult removeProd(ProdVO prod);
	
	/**
	 * 페이징 처리를 위한 회원수 조회.
	 * @return pagingVO
	 */
	public int retrieveProdCount(PagingVO pagingVO);
}
