package kr.or.ddit.chat.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.or.ddit.vo.ChatRoomVO;
import kr.or.ddit.vo.MessageVO;
import kr.or.ddit.vo.PagingVO;

public interface MessageDAO {

	/**
	 * 회원 정보 등록
	 * @param member
	 * @return 성공 : 1 실패 : 0
	 */
	public int insertMessage(MessageVO message);
	/**
	 * 회원 상세 조회
	 * @param memId 조회할 회원의 아이디
	 * @return 존재하지 않는다면, null 반환
	 */
	public MessageVO selectMessage(Integer roomId);
	
	
	
	/**
	 * 페이징 처리를 위한 totalRecord 조회
	 * @param pagingVO
	 * @return
	 */
	public int selectTotalRecord(PagingVO pagingVO);
	/**
	 * 회원 목록 조회
	 * @param pagingVO TODO
	 * @return size==0 테이블 empty
	 */
	public List<MessageVO> selectMessageList(PagingVO pagingVO);
	
	/**
	 * 회원 정보 삭제(???)
	 * @param memId
	 * @return 성공 : 1 실패 : 0
	 */
	public int deleteMessage(@Param("roomId") Integer roomId);

}
