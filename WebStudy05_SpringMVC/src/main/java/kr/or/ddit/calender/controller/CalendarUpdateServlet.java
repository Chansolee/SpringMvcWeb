package kr.or.ddit.calender.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.calender.service.CalendarService;
import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.validate.InsertGroup;
import kr.or.ddit.vo.CalendarVO;


@Controller
@RequestMapping("/calendar/calendarUpdate.do")
public class CalendarUpdateServlet {
	
	@Inject
	private CalendarService service;
	


	
	@PostMapping
	public String calendarUpdate(
	    @Validated(InsertGroup.class) @ModelAttribute("calendar") CalendarVO calendar
		, BindingResult errors
		, Model model
	) {
		System.out.println("calendar" + calendar);
		String viewName = null;
		if(!errors.hasErrors()) {
			ServiceResult result = service.modifyCalendar(calendar);
			
			String message = null;
			switch (result) {
				case INVALIDPASSWORD:
					message = "비밀번호 오류";
					viewName = "/calendar/calendarTest";
					break;
				case OK:
					viewName = "redirect:/calendar/calendarList.do";
					break;
				default:
					message = "서버 오류";
					viewName = "/calendar/calendarTest";
					break;
			}
			model.addAttribute("message", message);
		}else {
			viewName = "/calendar/calendarTest";
		}
		return viewName;
	}
}

	
		
	






















