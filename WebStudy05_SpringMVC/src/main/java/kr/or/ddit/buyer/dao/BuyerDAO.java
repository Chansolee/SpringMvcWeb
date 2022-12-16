package kr.or.ddit.buyer.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import kr.or.ddit.vo.BuyerVO;
import kr.or.ddit.vo.PagingVO;

/**
 * 상품관리 Persistence Layer
 *
 */
@Mapper
public interface BuyerDAO {
	
	public int insertBuyer(BuyerVO buyer);
	
	/**
	 * 상품 상세 조회
	 * @param prodId 조회할 상품의 아이디
	 * @return 존재하지 않는다면, null 반환
	 */
	public BuyerVO selectBuyer(@Param("buyerId") String buyerId);
	/**
	 * 상품 목록 조회
	 * @param pagingVO TODO
	 * @return size==0 테이블 empty
	 */
	public List<BuyerVO> selectBuyerList(PagingVO pagingVO);
	
	/**
	 * 상품 정보 수정
	 * @param prod
	 * @return 성공 : 1 실패 : 0
	 */
	public int updateBuyer(BuyerVO buyer);

	
	
	/**
	 * 페이징 처리를 위한 totalRecord 조회
	 * @param pagingVO
	 * @return
	 */
	public int selectTotalRecord(PagingVO pagingVO);
}
