package kr.or.ddit.prod.controller;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.prod.dao.OthersDAO;
import kr.or.ddit.vo.BuyerVO;


@Controller
public class OthersListServlet{
	@Inject
	private OthersDAO othersDAO ;
		


	@RequestMapping(value="/prod/getLprodList.do"
			,produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public List<Map<String, Object>> lprodList(Model model) {
		List<Map<String, Object>> lprodList = othersDAO.selectLprodList();
		model.addAttribute("model", lprodList);
		return lprodList;
	}
	
	@RequestMapping(value="/prod/getBuyerList.do"
				,produces=MediaType.APPLICATION_JSON_UTF8_VALUE
				)
	@ResponseBody
	public List<BuyerVO> buyerList(@RequestParam(name="lprodGu") String lprodGu
			,Model model) {
		List<BuyerVO> buyerList = othersDAO.selectBuyerList(lprodGu);
		model.addAttribute("model", buyerList);
		return buyerList;
	}
	
	
}













