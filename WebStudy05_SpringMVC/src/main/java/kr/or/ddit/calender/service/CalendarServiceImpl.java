package kr.or.ddit.calender.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.calender.dao.CalendarDAO;
import kr.or.ddit.commons.exception.UserNotFoundException;
import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.vo.CalendarVO;

@Service
public class CalendarServiceImpl implements CalendarService {
	@Inject
	private CalendarDAO dao;

	@Override
	public ServiceResult createCalendar(CalendarVO calendar) {
		ServiceResult result = null;
		

			int rowcnt = dao.insertCalendar(calendar);
			result = rowcnt > 0 ? ServiceResult.OK : ServiceResult.FAIL;
		
		return result;
	}

	@Override
	public CalendarVO retrieveCalendar(Integer testId) {
		CalendarVO calendar = dao.selectCalendar(testId);
		if (calendar == null)
			throw new RuntimeException("없는 정보임");
		return calendar;
	}



	@Override
	public List<CalendarVO> retrieveCalendarList() {
		return dao.selectCalendarList();
	}

	@Override
	public ServiceResult modifyCalendar(CalendarVO calendar) {
//		retrieveCalendar(calendar.getTestId());
		System.out.println("서비스 임플임 " +calendar);
		int rowcnt = dao.updateCalendar(calendar);
		return rowcnt > 0 ? ServiceResult.OK : ServiceResult.FAIL;
	}

	@Override
	public ServiceResult removeCalendar(CalendarVO calendar) {
		retrieveCalendar(calendar.getTestId());
		int rowcnt = dao.deleteCalendar(calendar.getTestId());
		return rowcnt > 0 ? ServiceResult.OK : ServiceResult.FAIL;
	}

	


}
