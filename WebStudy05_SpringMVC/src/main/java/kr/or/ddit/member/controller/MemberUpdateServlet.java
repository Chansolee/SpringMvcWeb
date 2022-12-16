package kr.or.ddit.member.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.member.service.MemberService;
import kr.or.ddit.validate.UpdateGroup;
import kr.or.ddit.vo.MemberVO;


@Controller
@RequestMapping("/member/memberUpdate.do")
public class MemberUpdateServlet {
	
	@Inject
	private MemberService service;
	

	
	@GetMapping
	public String updateForm(
		@RequestParam(name="who", required=true) String memId
		, Model model
	) {
		MemberVO member = service.retrieveMember(memId);
		model.addAttribute("member", member);
		return "member/memberForm";
	}
	
	@PostMapping
	public String memberUpdate(
		@Validated(UpdateGroup.class) @ModelAttribute("member") MemberVO member
		, BindingResult errors
		, Model model
	) {
		
		String viewName = null;
		if(!errors.hasErrors()) {
			ServiceResult result = service.modifyMember(member);
			
			String message = null;
			switch (result) {
				case INVALIDPASSWORD:
					message = "비밀번호 오류";
					viewName = "member/memberForm";
					break;
				case OK:
					viewName = "redirect:/member/memberView.do?who="+member.getMemId();
					break;
				default:
					message = "서버 오류";
					viewName = "member/memberForm";
					break;
			}
			model.addAttribute("message", message);
		}else {
			viewName = "member/memberForm";
		}
		return viewName;
	}
}

	
		
	






















