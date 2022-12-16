<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="${pageContext.request.contextPath }/file/upload.do" method="post" enctype="multipart/form-data" >
		<input type="text" name="uploader" />
		<input type="number" name="uploadCount" />
		<input type="file" name="uploadFile" />
		<input type="submit" value="업로드" />
	</form>
</body>
<c:if test="${not empty model }">
	<pre>
	<c:forEach items="${model }" var="entry">
		${entry.key } : ${entry.value }
	</c:forEach>
	<c:remove var="model" scope="session"/>
	</pre>
	
</c:if>
</html>