<%@page import="kr.or.ddit.vo.MemberVO"%>
<%@page import="java.util.Iterator"%>
<%@page import="kr.or.ddit.vo.ProdVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
ProdVO prod = (ProdVO) request.getAttribute("prod");
%>
<table class="table table-bordered">
	<tr>
	<th>거래처</th>
	<td>
		<table class="table table-bordered">
			<thead>
				<tr>
					<th>거래처명</th>
					<td><%=prod.getBuyer().getBuyerName() %></td>
				</tr>	
				<tr>
					<th>소재지</th>
					<td><%=prod.getBuyer().getBuyerAdd1() %></td>
				</tr>
				<tr>
					<th>담당자명</th>
					<td><%=prod.getBuyer().getBuyerBankname() %></td>
				</tr>
				<tr>
					<th>연락처</th>
					<td><%=prod.getBuyer().getBuyerComtel() %></td>
				</tr>
				<tr>
					<th>거래은행명</th>
					<td><%=prod.getBuyer().getBuyerBankname() %></td>
				</tr>
				<tr>
					<th>은행계좌</th>
					<td><%=prod.getBuyer().getBuyerBankno() %></td>
				</tr>

				</tr>
			</thead>
		</table>
	</td>
	</tr>
	<tr>
	<th>상품 구매자목록</th>
	<td>
		<table class="table table-bordered">
		 <thead>
		<% 
		
		
	
		
 		Iterator<MemberVO> iter = prod.getMemberList().iterator(); // set을 Iterator 안에 담기 -->
 		while(iter.hasNext()) {
 			MemberVO a  = iter.next();
 		%> 
 		 
 		
				<tr>
					<th>아이디</th>
					<td><%=a.getMemId() %></td>
				</tr>	
				<tr>
					<th>구매자명</th>
					<td><%=a.getMemName() %></td>
				</tr>
				<tr>
					<th>지역</th>
					<td><%=a.getMemAdd1() %></td>
				</tr>
				<tr>
					<th>이메일</th>
					<td><%=a.getMemMail() %></td>
				</tr>
		
			
 		<%}
			
		%> 
<!-- 			<thead> -->
<!-- 				<tr> -->
<!-- 					<th>아이디</th> -->
<%-- 					<td><%=prod.getMemberList() %></td> --%>
<!-- 				</tr>	 -->
<!-- 				<tr> -->
<!-- 					<th>구매자명</th> -->
<%-- 					<td><%=prod.getBuyer().getBuyerAdd1() %></td> --%>
<!-- 				</tr> -->
<!-- 				<tr> -->
<!-- 					<th>지역</th> -->
<%-- 					<td><%=prod.getBuyer().getBuyerBankname() %></td> --%>
<!-- 				</tr> -->
<!-- 				<tr> -->
<!-- 					<th>이메일</th> -->
<%-- 					<td><%=prod.getBuyer().getBuyerBankname() %></td> --%>
<!-- 				</tr> -->
		
				
<!-- 			</thead> -->
			</thead>
		</table>
	</td>
		</tr>
	
	<tr>
		<th>상품코드</th>
		<td><%=prod.getProdId()%></td>
	</tr>
	<tr>
		<th>상품명</th>
		<td><%=prod.getProdName()%></td>
	</tr>
	<tr>
		<th>상품분류코드</th>
		<td><%=prod.getProdLgu()%></td>
	</tr>
	<tr>
		<th>거래처코드</th>
		<td><%=prod.getProdBuyer()%></td>
	</tr>
	<tr>
		<th>매입가</th>
		<td><%=prod.getProdCost()%></td>
	</tr>
	<tr>
		<th>소비자가</th>
		<td><%=prod.getProdPrice()%></td>
	</tr>
	<tr>
		<th>판매가</th>
		<td><%=prod.getProdSale()%></td>
	</tr>
	<tr>
		<th>상품개락설명</th>
		<td><%=prod.getProdOutline()%></td>
	</tr>
	<tr>
		<th>상품상세설명</th>
		<td><%=prod.getProdDetail()%></td>
	</tr>
	<tr>
		<th>이미지(소)</th>
		<td><%=prod.getProdImg()%></td>
	</tr>
	<tr>
		<th>재고수량</th>
		<td><%=prod.getProdTotalstock()%></td>
	</tr>
	<tr>
		<th>신규일자(등록일)</th>
		<td><%=prod.getProdInsdate()%></td>
	</tr>
	<tr>
		<th>안전재고수량</th>
		<td><%=prod.getProdProperstock()%></td>
	</tr>
	<tr>
		<th>크기</th>
		<td><%=prod.getProdSize()%></td>
	</tr>
	<tr>
		<th>색상</th>
		<td><%=prod.getProdColor()%></td>
	</tr>
	<tr>
		<th>배달특기사항</th>
		<td><%=prod.getProdDelivery()%></td>
	</tr>
	<tr>
		<th>단위(수량)</th>
		<td><%=prod.getProdUnit()%></td>
	</tr>
	<tr>
		<th>총입고수량</th>
		<td><%=prod.getProdQtyin()%></td>
	</tr>
	<tr>
		<th>총판매수량</th>
		<td><%=prod.getProdQtysale()%></td>
	</tr>
	<tr>
		<th>개당 마일리지 점수</th>
		<td><%=prod.getProdMileage()%></td>
	</tr>

</table>















