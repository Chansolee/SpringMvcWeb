package kr.or.ddit.calender.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import kr.or.ddit.vo.CalendarVO;


@Mapper
public interface CalendarDAO {

	
	public int insertCalendar(CalendarVO calendar);
	/**
	 * 회원 상세 조회
	 * @param memId 조회할 회원의 아이디
	 * @return 존재하지 않는다면, null 반환
	 */
	public CalendarVO selectCalendar(Integer testId);
	
	
	

	 
	public List<CalendarVO> selectCalendarList();
	
	/**
	 * 회원 정보 수정
	 * @param member
	 * @return 성공 : 1 실패 : 0
	 */
	public int updateCalendar(CalendarVO calendar);
	/**
	 * 회원 정보 삭제(???)
	 * @param memId
	 * @return 성공 : 1 실패 : 0
	 */
	public int deleteCalendar(@Param("testId") Integer testId);
}
