package kr.or.ddit.member.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.ddit.member.service.MemberService;
import kr.or.ddit.vo.MemberVO;
import kr.or.ddit.vo.PagingVO;
import kr.or.ddit.vo.SearchVO;

/**
 * RESTful URI
 * /member (GET)
 * /member/a001 (GET)
 * /member/a001 (PUT)
 * /member/a001 (DELETE)
 * 
 * non-RESTful URI
 * /member/memberList.do (GET)
 * /member/memberView.do?who=a001 (GET)
 * /member/memberInsert.do (GET)
 * /member/memberInsert.do (POST)
 * /member/memberUpdate.do?who=a001 (GET)
 * /member/memberUpdate.do?who=a001 (POST)
 * /member/memberDelete.do?who=a001 (POST)
 *
 */

@Controller
public class MemberListServlet {
	@Inject
	private MemberService service;
	
	@RequestMapping("/member/memberList.do")
	public String memberList(
			@RequestParam(name="page", required=false, defaultValue="1") int currentPage
			, SearchVO simpleCondition
			, Model model
			){
		
		System.out.println(simpleCondition.toString());
	
		
		PagingVO<MemberVO> pagingVO = new PagingVO<MemberVO>(3,2);
		pagingVO.setCurrentPage(currentPage);
		pagingVO.setSimpleContition(simpleCondition);
		
		int totalRecord=service.retrieveMemberCount(pagingVO);
		pagingVO.setTotalRecord(totalRecord);
		
		List<MemberVO> memberList = service.retrieveMemberList(pagingVO);
		pagingVO.setDataList(memberList);
		
//		req.setAttribute("memberList", memberList);
		model.addAttribute("pagingVO", pagingVO);
		

		String viewName = "member/memberList";
		return viewName;
	}
}



















