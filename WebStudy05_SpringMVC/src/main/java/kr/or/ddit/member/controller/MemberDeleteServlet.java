
package kr.or.ddit.member.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.member.service.MemberService;
import kr.or.ddit.vo.MemberVO;


@Controller
@RequestMapping("/member/memberDelete.do")
public class MemberDeleteServlet extends HttpServlet{
	@Inject
	private MemberService service;
	
	@PostMapping
	public String doPost(@RequestParam("who") String memId, HttpSession session) {
		
	
		
		MemberVO member = new MemberVO();
		member.setMemId(memId);
		ServiceResult result = service.removeMember(member);
		String commandPage = null;
		if(ServiceResult.OK.equals(result)) {
			commandPage = "redirect:/member/memberList.do";
		}else {
			session.setAttribute("message", memId + "삭제 처리 실패");
			commandPage = "redirect:/member/memberList.do";
		}
		
		return commandPage;
	}
	

}



















