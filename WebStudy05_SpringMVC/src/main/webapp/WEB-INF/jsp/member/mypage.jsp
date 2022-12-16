
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<table>






	<tr>
		<th>회원아이디</th>
		<td>${member['memId'] }</td>
	</tr>
	<tr>
		<th>MEM_PASS</th>
		<td>${member['memPass'] }</td>
	</tr>
	<tr>
		<th>MEM_NAME</th>
		<td>${member['memName'] }</td>
	</tr>
	<tr>
		<th>MEM_REGNO1</th>
		<td>${member['memRegno1'] }</td>
	</tr>
	<tr>
		<th>MEM_REGNO2</th>
		<td>${member['memRegno2'] }</td>
	</tr>
	<tr>
		<th>MEM_BIR</th>
		<td>${member['memBir'] }</td>
	</tr>
	<tr>
		<th>MEM_ZIP</th>
		<td>${member['memZip'] }</td>
	</tr>
	<tr>
		<th>MEM_ADD1</th>
		<td>${member['memAdd1'] }</td>
	</tr>
	<tr>
		<th>MEM_ADD2</th>
		<td>${member['memAdd2'] }</td>
	</tr>
	<tr>
		<th>MEM_HOMETEL</th>
		<td>${member['memHometel'] }</td>
	</tr>
	<tr>
		<th>MEM_COMTEL</th>
		<td>${member['memComtel'] }</td>
	</tr>
	<tr>
		<th>MEM_HP</th>
		<td>${member['memHp'] }</td>
	</tr>
	<tr>
		<th>MEM_MAIL</th>
		<td>${member['memMail'] }</td>
	</tr>
	<tr>
		<th>MEM_JOB</th>
		<td>${member['memJob'] }</td>
	</tr>
	<tr>
		<th>MEM_LIKE</th>
		<td>${member['memLike'] }</td>
	</tr>
	<tr>
		<th>MEM_MEMORIAL</th>
		<td>${member['memMemorial'] }</td>
	</tr>
	<tr>
		<th>MEM_MEMORIALDAY</th>
		<td>${member['memMemorialday'] }</td>
	</tr>
	<tr>
		<th>MEM_MILEAGE</th>
		<td>${member['memMileage'] }</td>
	</tr>
	<tr>
		<th>MEM_DELETE</th>
		<td>${member['memDelete'] }</td>
	</tr>
	
	<tr>
		<th>MEM_IMG</th>
		<img src="data:${member['memImg'] }"/>
		<td>${member['memImg'] }</td>
	</tr>


	
		<tr>
			<th>구매목록</th>
	<c:forEach items="${member['prodList']}" var="prod">

			<td>${prod['prodName'] }</td>

	</c:forEach>
		</tr>
	
</table>















