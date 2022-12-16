package kr.or.ddit.calender.service;

import java.util.List;

import kr.or.ddit.commons.exception.UserNotFoundException;
import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.vo.CalendarVO;

/**
 * 회원 관리(Business Logic Layer), CRUD
 *
 */


public interface CalendarService {
	/**
	 * 회원 신규 등록
	 * @param member
	 * @return {@link ServiceResult.PKDUPLICATED}, {@link ServiceResult.OK}, {@link ServiceResult.FAIL}
	 */
	public ServiceResult createCalendar(CalendarVO calender);
	/**
	 * 회원 정보 상세조회
	 * @param memId 조회할 회원아이디
	 * @return 존재하지 않는 경우, {@link UserNotFoundException} 발생.
	 */
	public CalendarVO retrieveCalendar(Integer testId);
	


	public List<CalendarVO> retrieveCalendarList();

	
	public ServiceResult modifyCalendar(CalendarVO calendar);
	/**
	 * 회원 정보 제거
	 * @param member
	 * @return 존재하지 않는 경우, {@link UserNotFoundException} 발생.
	 * 			{@link ServiceResult.INVALIDPASSWORD}, 
	 * 			{@link ServiceResult.OK}, {@link ServiceResult.FAIL}
	 */
	public ServiceResult removeCalendar(CalendarVO calendar);
}















