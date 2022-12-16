<%@page import="java.util.Arrays"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.yellow {
	background-color: yellow;
}

.red {
	background-color: red;
}

.blue {
	background-color: blue;
}
</style>
</head>
<body>
	<pre>
	: 커스텀 태그 라이브러리
	** taglib 지시자로 해당 커스템 태그 로딩.
	** Core(C) 태그
	1. EL 변수 지원
	2. 조건문
		<c:if test="${not empty sessionScope.sample }">
			샘플있음
		</c:if>
		<c:if test="${empty sessionScope.sample }">
			샘플없음
		</c:if>
		
		<c:set var="sample" value="샘플" />
		<c:choose>
		<c:when test="${not empty pageScope.sample}">
			샘플있음 ${pageScope.sample }
		</c:when>
		<c:otherwise> 
			샘플없음
		</c:otherwise>
	</c:choose>
	3. 반복문
		<c:forEach begin="0" end="10" var="i" step="1" varStatus="vs">
			${i * vs.count} 
		</c:forEach>
		
		<c:set var="elList" value='<%=Arrays.asList("value1", "value2")%>' />
			${elList }	
		<c:forEach items="${elList}" var="element" varStatus="vs">
			${element} ${not vs.last ?  "," : ""}
		</c:forEach>
		
		<c:forTokens items="1,2,3" delims="," var="token">
			${token * 1000 }
		
		</c:forTokens>
	4. URL 재작성 : url
		<c:url value="/prod/prodView.do" var="prodviewURL">
			<c:param name="what" value="P101000001"></c:param>
		</c:url>
		${prodviewURL }
		<a href="${prodviewURL }">P101000001번 상품 상세조회</a>
	5. 기타 : redirect, out
<%-- 		<c:redirect url="/"></c:redirect> --%>
			<c:set var="crawlingData" value="<table>" />
			<c:out value="${crawlingData }" escapeXml="true" ></c:out>
	
</pre>



	<table border=1 class="tb">

		<tr>
			<c:forEach begin="2" end="9" var="i" step="1" varStatus="vs1">
				<c:if test="${vs1.count eq 3}">
					<c:set var="trClass" value="yellow" />
				</c:if>
				<c:if test="${vs1.count ne 3}">
					<c:set var="trClass" value="normal" />
				</c:if>
				<tr class="${trClass }">

					<c:forEach begin="1" end="9" var="j" step="1" varStatus="vs2">
						<c:choose>
							<c:when test="${vs2.first}">
								<c:set var="tdClass" value="red" />
							</c:when>
							<c:when test="${vs2.last}">
								<c:set var="tdClass" value="blue" />
							</c:when>
							<c:otherwise>
								<c:set var="tdClass" value="normal" />
							</c:otherwise>
						</c:choose>
						<td class="${tdClass }">${i}X ${j} = ${i*j}</td>

					</c:forEach>
				</tr>

			</c:forEach>



			<c:set var="tb3" value='<%=Arrays.asList("value1", "value2")%>' />
			<c:if test="${i}">
			샘플없음
</c:if>
	</table>


</body>
<script type="text/javascript">
	
</script>
</html>