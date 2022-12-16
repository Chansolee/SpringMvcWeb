package kr.or.ddit.calender.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServlet;

import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.ddit.calender.service.CalendarService;
import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.validate.InsertGroup;
import kr.or.ddit.vo.CalendarVO;

@Controller
@RequestMapping("/calendar/calendarDelete.do")
public class CalendarDeleteServlet extends HttpServlet {
	@Inject
	private CalendarService service;

	@PostMapping
	public String doPost(@Validated(InsertGroup.class) @ModelAttribute("testId") int testId
			, BindingResult errors
			) {

		CalendarVO calendar = new CalendarVO();
		calendar.setTestId(testId);
		ServiceResult result = service.removeCalendar(calendar);
		String viewName = null;
		if(ServiceResult.OK.equals(result)) {
			viewName = "redirect:/calendar/calendarList.do";
		}else {
			
			viewName = "redirect:/calendar/calendarList.do";
		}
		
		return viewName;
	}

}
