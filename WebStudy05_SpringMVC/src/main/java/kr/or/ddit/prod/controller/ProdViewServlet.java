package kr.or.ddit.prod.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServlet;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.ddit.prod.service.ProdService;
import kr.or.ddit.vo.ProdVO;

@Controller
public class ProdViewServlet extends HttpServlet{
	@Inject
	private ProdService service;
	
	@RequestMapping("/prod/prodView.do")
	public String prodView(@RequestParam("what") String prodId
			,Model model) {
		
		
		
		
		ProdVO prod = service.retrieveProd(prodId);
		
		model.addAttribute("prod", prod);
		
		String viewName = "prod/prodView";
		return viewName;
	}
	
	
}














