package kr.or.ddit.buyer.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.buyer.service.BuyerService;
import kr.or.ddit.buyer.service.BuyerServiceImpl;
import kr.or.ddit.vo.BuyerVO;

@WebServlet("/buyer/buyerView.do")

public class BuyerViewServlet extends HttpServlet{
	private BuyerService service = new BuyerServiceImpl();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		
		String buyerId = req.getParameter("what");
		if(buyerId==null || buyerId.isEmpty()) {
			resp.sendError(HttpServletResponse.SC_BAD_REQUEST);
			return;
		}
		System.out.println(buyerId);
		BuyerVO buyer = service.retrieveBuyer(buyerId);
		
		req.setAttribute("buyer", buyer);
		
		String viewName = "/WEB-INF/views/buyer/buyerView.jsp";
		req.getRequestDispatcher(viewName).forward(req, resp);
	}
	
	
}














