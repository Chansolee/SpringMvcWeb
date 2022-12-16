package kr.or.ddit.member.controller;

import java.io.File;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.member.service.MemberService;
import kr.or.ddit.validate.InsertGroup;
import kr.or.ddit.vo.MemberVO;
import lombok.extern.slf4j.Slf4j;


@Slf4j
@Controller
@RequestMapping("/member/memberInsert.do")
public class MemberInsertServlet {
	@Inject
	private MemberService service;

	String saveFolderURL = "/resources/prodImages";
	File saveFolder;


	@GetMapping
	public String memberForm(@ModelAttribute("member") MemberVO member){
		
		return "member/memberForm";
		
	}

	@PostMapping
	public String memberInsert(
			@Validated(InsertGroup.class) @ModelAttribute("member") MemberVO member
			, Errors errors
			, Model model
			) {

		log.info("Post메소드 핸들러 memberInsert 실행.");
		String viewName = null;
	
		
		if(!errors.hasErrors()) {
			ServiceResult result = service.createMember(member);
			if(ServiceResult.OK.equals(result)) {
				viewName = "redirect:/member/memberView.do?who="+member.getMemId();
				
				System.out.println("errors" + errors);
			}else {
				System.out.println("errors" + errors);
				String message = "등록 실패";
				model.addAttribute("message", message);
				viewName = "member/memberForm";
			}
		}else {
//			model.addAttribute("errors", errors);
			System.out.println("errors" + errors.toString());
			viewName = "member/memberForm";
		}
		
		
		return viewName;
	}
}

