package kr.or.ddit.calender.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.calender.service.CalendarService;
import kr.or.ddit.vo.CalendarVO;

/**
 * RESTful URI /member (GET) /member/a001 (GET) /member/a001 (PUT) /member/a001
 * (DELETE)
 * 
 * non-RESTful URI /member/memberList.do (GET) /member/memberView.do?who=a001
 * (GET) /member/memberInsert.do (GET) /member/memberInsert.do (POST)
 * /member/memberUpdate.do?who=a001 (GET) /member/memberUpdate.do?who=a001
 * (POST) /member/memberDelete.do?who=a001 (POST)
 *
 */

@Controller
public class CalendarListServlet {
	@Inject
	private CalendarService service;

	@RequestMapping(value = "/calendar/calendarList2.do", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public List<HashMap<String, Object>> calendarList(Model model) {

		List<HashMap<String, Object>> list = new ArrayList<>();
		List<CalendarVO> calendarList = service.retrieveCalendarList();

		for (CalendarVO calendar : calendarList) {
			HashMap<String, Object> hash = new HashMap<>();
			hash.put("title", calendar.getTestTitle());
			hash.put("start", calendar.getTestStart());
			hash.put("end", calendar.getTestEnd());
			hash.put("_id", calendar.getTestId());

			hash.put("allDay", calendar.getTestAllday());
			hash.put("backgroundColor", calendar.getTestBackgroundcolor());
			hash.put("description", calendar.getTestDescription());
			hash.put("type", calendar.getTestType());
			hash.put("username", calendar.getTestUsername());
			hash.put("textColor", calendar.getTestTextcolor());
			list.add(hash);

		}

		return list;

	}

	@GetMapping("/calendar/calendarList.do")
	public String processHTML() {

		String logicalViewName = "/calendar/calendarTest";
		return logicalViewName;
	}

}
