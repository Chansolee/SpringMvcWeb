<%@page import="kr.or.ddit.vo.BuyerVO"%>
<%@page import="java.util.List"%>
<%@page import="kr.or.ddit.vo.ProdVO"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	ProdVO prod = (ProdVO) request.getAttribute("prod");

	if(prod==null)
		prod = new ProdVO();
	Map<String,String> errors = (Map) request.getAttribute("errors");
	if(errors==null)
			errors = new HashMap<>();
	String message = (String) request.getAttribute("message");
	if(message!=null && !message.isEmpty()){
		%>
		<div class="error"><%=message %></div>
		<%
	}
%>    

<h4 id="d">가입양식</h4>
<form method="post">
	<table class="table table-bordered">

	<tr>
		<th>상품명</th>
		<td><input type="text" name="prodName" class="form-control"
			required value="${prod.prodName }" /> <span class="error">${errors.prodName }</span></td>
	</tr>
	<tr>
		<th>상품분류코드</th>
		<td><input type="text" name="prodLgu" class="form-control"
			required value="${prod.prodLgu }" /> 
			
			<select name="prodLgu" required class="form-control">
				<%--
					List<Map<String,Object>> lprodList = (List) request.getAttribute("lprodList");
					for(Map<String,Object> lprod : lprodList){
						pageContext.setAttribute("lprod", lprod);
						--%>
						<c:forEach items="${lprodList}" var="lprod">
<%-- 						<option value="<%=lprod.get("lprodGu")%>"><%=lprod.get("lprodNm") %></option> --%>
						<option value="${lprod['lprodGu'] }">${lprod['lprodNm'] }</option>
						</c:forEach>
						<%--	--			
						
					}
				--%>
				</select>
			<span class="error">${errors.prodLgu }</span></td>
	</tr>
	<tr>
		<th>거래처코드</th>
		<td><input type="text" name="prodBuyer" class="form-control"
			required value="${prod.prodBuyer }" />
			
			<select name="prodBuyer" required class="form-control">
				<%--
					List<BuyerVO> buyerList = (List) request.getAttribute("buyerList");
					for(BuyerVO buyer : buyerList){
						pageContext.setAttribute("buyer", buyer);
						--%>
						<c:forEach items="${buyerList}" var="buyer">
<%-- 						<option value="<%=buyer.getBuyerId() %>" class="<%=buyer.getBuyerLgu()%>"><%=buyer.getBuyerName() %></option> --%>
						<option value="${buyer['buyerId'] }" class="${buyer['buyerLgu'] }">
							${buyer['buyerName'] }
						</option>
						</c:forEach>
						<%--						
					}
				--%>
				</select>
			 <span class="error">${errors.prodBuyer }</span></td>
	</tr>
	<tr>
		<th>매입가</th>
		<td><input type="number" name="prodCost" class="form-control"
			required value="${prod.prodCost }" /> <span class="error">${errors.prodCost }</span></td>
	</tr>
	<tr>
		<th>소비자가</th>
		<td><input type="number" name="prodPrice" class="form-control"
			required value="${prod.prodPrice }" /> <span class="error">${errors.prodPrice }</span></td>
	</tr>
	<tr>
		<th>판매가</th>
		<td><input type="number" name="prodSale" class="form-control"
			required value="${prod.prodSale }" /> <span class="error">${errors.prodSale }</span></td>
	</tr>
	<tr>
		<th>상품개락설명</th>
		<td><input type="text" name="prodOutline" class="form-control"
			required value="${prod.prodOutline }" /> <span class="error">${errors.prodOutline }</span></td>
	</tr>
	<tr>
		<th>상품상세설명</th>
		<td><input type="text" name="prodDetail" class="form-control"
			required value="${prod.prodDetail }" /> <span class="error">${errors.prodDetail }</span></td>
	</tr>
	<tr>
		<th>이미지(소)</th>
		<td><input type="text" name="prodImg" class="form-control"
			required value="${prod.prodImg }" /> <span class="error">${errors.prodImg }</span></td>
	</tr>
	<tr>
		<th>재고수량</th>
		<td><input type="number" name="prodTotalstock" class="form-control"
			required value="${prod.prodTotalstock }" /> <span class="error">${errors.prodTotalstock }</span></td>
	</tr>
	<tr>
		<th>신규일자(등록일)</th>
		<td><input type="date" name="prodInsdate" class="form-control"
			required value="${prod.prodInsdate }" /> <span class="error">${errors.prodInsdate }</span></td>
	</tr>
	<tr>
		<th>안전재고수량</th>
		<td><input type="number" name="prodProperstock"
			class="form-control" required value="${prod.prodProperstock }" /> <span
			class="error">${errors.prodProperstock }</span></td>
	</tr>
<!-- 	<tr> -->
<!-- 		<th>크기</th> -->
<!-- 		<td><input type="text" name="prodSize" class="form-control" -->
<%-- 			required value="${prod.prodSize }" /> <span class="error">${errors.prodSize }</span></td> --%>
<!-- 	</tr> -->
<!-- 	<tr> -->
<!-- 		<th>색상</th> -->
<!-- 		<td><input type="text" name="prodColor" class="form-control" -->
<%-- 			required value="${prod.prodColor }" /> <span class="error">${errors.prodColor }</span></td> --%>
<!-- 	</tr> -->
<!-- 	<tr> -->
<!-- 		<th>배달특기사항</th> -->
<!-- 		<td><input type="text" name="prodDelivery" class="form-control" -->
<%-- 			required value="${prod.prodDelivery }" /> <span class="error">${errors.prodDelivery }</span></td> --%>
<!-- 	</tr> -->
<!-- 	<tr> -->
<!-- 		<th>단위(수량)</th> -->
<!-- 		<td><input type="text" name="prodUnit" class="form-control" -->
<%-- 			required value="${prod.prodUnit }" /> <span class="error">${errors.prodUnit }</span></td> --%>
<!-- 	</tr> -->
<!-- 	<tr> -->
<!-- 		<th>총입고수량</th> -->
<!-- 		<td><input type="text" name="prodQtyin" class="form-control" -->
<%-- 			required value="${prod.prodQtyin }" /> <span class="error">${errors.prodQtyin }</span></td> --%>
<!-- 	</tr> -->
<!-- 	<tr> -->
<!-- 		<th>총판매수량</th> -->
<!-- 		<td><input type="text" name="prodQtysale" class="form-control" -->
<%-- 			required value="${prod.prodQtysale }" /> <span class="error">${errors.prodQtysale }</span></td> --%>
<!-- 	</tr> -->
<!-- 	<tr> -->
<!-- 		<th>개당 마일리지 점수</th> -->
<!-- 		<td><input type="text" name="prodMileage" class="form-control" -->
<%-- 			required value="${prod.prodMileage }" /> <span class="error">${errors.prodMileage }</span></td> --%>
<!-- 	</tr> -->
	
		<tr>
			<td colspan="2">
				<input type="reset" value="취소" class="btn btn-warning" />
				<input type="submit" value="저장" class="btn btn-primary"/>
			</td>
		</tr>

	</table>
</form>

<script type="text/javascript">
let prodBuyerTag = $("[name=prodBuyer]");
$("[name=prodLgu]").on("change", function(event){
	let lgu = $(this).val();
	prodBuyerTag.find("option."+lgu).show();
	prodBuyerTag.find("option:first").show();
	
	
	prodBuyerTag.find("option:not(."+lgu+")").hide();
})



$(":input:not(.editable)").prop("readonly", true);
$("#d").html("수정");

</script>






















