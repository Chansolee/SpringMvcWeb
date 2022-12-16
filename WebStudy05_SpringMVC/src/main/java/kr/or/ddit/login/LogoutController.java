package kr.or.ddit.login;

import java.io.IOException;

import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.ddit.member.service.MemberService;

/**
 * Servlet implementation class LogoutController
 */

@Controller
public class LogoutController {

	@Inject
	MemberService service;

	@PostMapping("/login/logout.do")
	public String logout(@RequestParam("memId") String memId, HttpServletRequest req, HttpServletResponse resp)
			throws IOException, ServletException {
		System.out.println("logout " +memId);
		HttpSession session = req.getSession();
		if (session.isNew()) {
			resp.sendError(400);

		}
		session.invalidate();
		
		service.logOutMember(memId);
		System.out.println("여기 온거임?");
		String viewName = "redirect:/";

		return viewName;
	}

}
