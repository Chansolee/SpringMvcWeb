package kr.or.ddit.prod.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServlet;

import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.prod.service.ProdService;
import kr.or.ddit.vo.PagingVO;
import kr.or.ddit.vo.ProdVO;

/**
 * /prod/prodList.do(GET)
 * /prod/prodView.do?what=P101000001(GET)
 * /prod/prodInsert.do(GET)
 * /prod/prodInsert.do(POST)
 * /prod/prodUpdate.do?what=P101000001(GET)
 * /prod/prodUpdate.do(POST)
 *
 */

@Controller
@RequestMapping(value="/prod/prodList.do")
public class ProdListServlet extends HttpServlet{
	@Inject
	private ProdService service;

	
	@GetMapping
	public String processHTML(@RequestHeader("Accept") String accept) {
	
		
		String logicalViewName = "prod/prodList";
		return logicalViewName;
	}
	

	
	@RequestMapping(produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public PagingVO processJsonData(
			@RequestParam(name="page", required=false, defaultValue="1") int currentPage
			, PagingVO<ProdVO> pagingVO 
			, Model model
			, ProdVO detailCondition
			) {
	
		pagingVO = new PagingVO<>(3, 3);
		pagingVO.setCurrentPage(currentPage);
		pagingVO.setDetailCondition(detailCondition);
		
		int totalRecord = service.retrieveProdCount(pagingVO);
		pagingVO.setTotalRecord(totalRecord);
		
		List<ProdVO> prodList = service.retrieveProdList(pagingVO);
		pagingVO.setDataList(prodList);
		model.addAttribute("pagingVO", pagingVO);

		
		return pagingVO;
	}
}























