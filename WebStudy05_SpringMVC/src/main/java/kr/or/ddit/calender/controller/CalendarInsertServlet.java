package kr.or.ddit.calender.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.context.WebApplicationContext;

import kr.or.ddit.calender.event.NewCalendarEvent;
import kr.or.ddit.calender.service.CalendarService;
import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.noti.event.NewNotiEvent;
import kr.or.ddit.noti.service.NotiService;
import kr.or.ddit.validate.InsertGroup;
import kr.or.ddit.vo.CalendarVO;
import kr.or.ddit.vo.NotiVO;
import lombok.extern.slf4j.Slf4j;


@Slf4j
@Controller
@RequestMapping("/calendar/calendarInsert.do")
public class CalendarInsertServlet {
	@Inject
	private CalendarService service;

	@Inject
	private WebApplicationContext context;
	
	@Inject
	private NotiService notiService;


//	@GetMapping
//	public String calendarForm(@ModelAttribute("calendar") CalendarVO calendar){
//		
//		return "/calendar/calendarTest";
//		
//	}

	@PostMapping
	public String calendarInsert(
			@Validated(InsertGroup.class) @ModelAttribute("calendar") CalendarVO calendar
			, Errors errors
			, Model model
			) {

		log.info("Post메소드 핸들러 calendarInsert 실행.");
		String viewName = null;
		
		
		if(!errors.hasErrors()) {
			ServiceResult result = service.createCalendar(calendar);
			if(ServiceResult.OK.equals(result)) {
				viewName = "redirect:/calendar/calendarList.do";
				NewCalendarEvent event = new NewCalendarEvent(calendar);
				context.publishEvent(event);
				
				NotiVO noti = new NotiVO();
				noti.setMemId("a001");
//				noti.setNotResult(0);
				noti.setNotCon("알림테스트");
				noti.setSendmemId("b001");
				notiService.createNoti(noti);
				NewNotiEvent event2 = new NewNotiEvent(noti);
				context.publishEvent(event2);
			
			}else {
				System.out.println("errors" + errors);
				String message = "등록 실패";
				model.addAttribute("message", message);
				viewName = "/calendar/calendarTest";
			}
		}else {
//			model.addAttribute("errors", errors);
			System.out.println("errors" + errors.toString());
			viewName = "/calendar/calendarTest";
		}
		
		
		return viewName;
	}
}

