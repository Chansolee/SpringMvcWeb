package kr.or.ddit.buyer.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;

import kr.or.ddit.buyer.service.BuyerService;
import kr.or.ddit.buyer.service.BuyerServiceImpl;
import kr.or.ddit.vo.BuyerVO;
import kr.or.ddit.vo.MemberVO;
import kr.or.ddit.vo.PagingVO;
import kr.or.ddit.vo.SearchVO;

/**

 */
@WebServlet("/buyer/buyerList.do")
public class BuyerListServlet extends HttpServlet {
private BuyerService service = new BuyerServiceImpl();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		String searchType = req.getParameter("searchType");
		String searchWord = req.getParameter("searchWord");
		SearchVO simpleCondition = new SearchVO(searchType,searchWord);
		
		String pageParam = req.getParameter("page");
		
		int currentPage = 1;
		if(StringUtils.isNumeric(pageParam)) {
			currentPage = Integer.parseInt(pageParam);
		}
		
		PagingVO<BuyerVO> pagingVO = new PagingVO<BuyerVO>(3,2);
		pagingVO.setCurrentPage(currentPage);
		pagingVO.setSimpleContition(simpleCondition);
		
		int totalRecord=service.retrieveBuyerCount(pagingVO);
		pagingVO.setTotalRecord(totalRecord);
		
		List<BuyerVO> buyerList = service.retrieveBuyerList(pagingVO);
		pagingVO.setDataList(buyerList);
		
//		req.setAttribute("memberList", memberList);
		req.setAttribute("pagingVO", pagingVO);
		

		String viewName = "/buyer/buyerList.tiles";
		req.getRequestDispatcher(viewName).forward(req, resp);
	}
}
