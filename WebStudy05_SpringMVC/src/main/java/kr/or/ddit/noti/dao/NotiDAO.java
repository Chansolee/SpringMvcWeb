package kr.or.ddit.noti.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import kr.or.ddit.vo.CalendarVO;
import kr.or.ddit.vo.ChatRoomVO;
import kr.or.ddit.vo.NotiVO;
import kr.or.ddit.vo.PagingVO;


@Mapper
public interface NotiDAO {

	
	public int insertNoti(NotiVO noti);
	/**
	 * 회원 상세 조회
	 * @param memId 조회할 회원의 아이디
	 * @return 존재하지 않는다면, null 반환
	 */
	public NotiVO selectNoti(Integer notNo);
	
	
	
	public List<NotiVO> selectNotiList(String memId);

	
	/**
	 * 회원 정보 수정
	 * @param member
	 * @return 성공 : 1 실패 : 0
	 */
	public int updateNoti(NotiVO noti);
	/**
	 * 회원 정보 삭제(???)
	 * @param memId
	 * @return 성공 : 1 실패 : 0
	 */
	public int deleteNoti(@Param("notNo") Integer notNo);
}
