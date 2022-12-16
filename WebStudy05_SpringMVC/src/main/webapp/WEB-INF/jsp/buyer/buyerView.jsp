
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<table>


	<tr>
		<th>회원아이디</th>
		<td>${buyer['buyerId'] }</td>
	</tr>
	<tr>
		<th>MEM_PASS</th>
		<td>${buyer['buyerName'] }</td>
	</tr>
	<tr>
		<th>MEM_NAME</th>
		<td>${buyer['buyerLgu'] }</td>
	</tr>
	<tr>
		<th>MEM_REGNO1</th>
		<td>${buyer['buyerBank'] }</td>
	</tr>
<!-- 	<tr> -->
<!-- 		<th>MEM_REGNO2</th> -->
<%-- 		<td>${buyer['buyerId'] }</td> --%>
<!-- 	</tr> -->
<!-- 	<tr> -->
<!-- 		<th>MEM_BIR</th> -->
<%-- 		<td>${buyer['buyerId'] }</td> --%>
<!-- 	</tr> -->
<!-- 	<tr> -->
<!-- 		<th>MEM_ZIP</th> -->
<%-- 		<td>${buyer['buyerId'] }</td> --%>
<!-- 	</tr> -->
<!-- 	<tr> -->
<!-- 		<th>MEM_ADD1</th> -->
<%-- 		<td>${buyer['buyerId'] }</td> --%>
<!-- 	</tr> -->
<!-- 	<tr> -->
<!-- 		<th>MEM_ADD2</th> -->
<%-- 		<td>${buyer['buyerId'] }</td> --%>
<!-- 	</tr> -->
	
	

<!-- 		<tr> -->
<!-- 			<th>상품정보목록</th> -->
<%-- 	<c:forEach items="${member['prodList']}" var="prod"> --%>

<%-- 			<td>${prod['prodName'] }</td> --%>

<%-- 	</c:forEach> --%>
<!-- 		</tr> -->

<th>상품 구매자목록</th>
	
		<table class="table table-bordered">
	
	 
		
		
	
		
 		<c:forEach items="${buyer['prodList']}" var="prod"> 
 		
				<tr>
					<th>아이디</th>
					<td>${prod['prodId'] }</td>
				</tr>	
				<tr>
					<th>구매자명</th>
					<td>${prod['prodName'] }</td>
				</tr>
				
		
			</c:forEach>
	</table>
</table>















