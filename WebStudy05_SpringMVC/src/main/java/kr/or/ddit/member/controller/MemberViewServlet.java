package kr.or.ddit.member.controller;

import javax.inject.Inject;

import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.member.service.MemberService;
import kr.or.ddit.vo.MemberVO;


@Controller
@RequestMapping(value="/member/memberView.do")
public class MemberViewServlet {
	@Inject
	private MemberService service; 
	
	
	@GetMapping
	public String getView(@RequestParam(name="who", required=true) String memId
			,Model model) {
		
		MemberVO member = service.retrieveMember(memId);
		model.addAttribute("member", member);
		String viewName = "member/memberView";
		return viewName;
	}
	
	
	@PostMapping(produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public MemberVO memberView(@RequestParam(name="who", required=true) String memId
			,Model model) {
		
		
		
		MemberVO member = service.retrieveMember(memId);
		System.out.println("memberVO" + member);
		model.addAttribute("member", member);
	 
		
//		String viewName = "member/memberView";
		
		return member;
	}
}














