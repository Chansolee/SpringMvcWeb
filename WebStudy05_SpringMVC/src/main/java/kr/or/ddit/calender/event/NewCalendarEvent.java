package kr.or.ddit.calender.event;

import kr.or.ddit.vo.CalendarVO;

public class NewCalendarEvent {
	private CalendarVO source;

	public NewCalendarEvent(CalendarVO source){
		this.source = source;
	}

	public CalendarVO getSource() {
		return source;
	}
}
