<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h4>차단 메세지</h4>
<h4>당신은 ${reason } 사유로 차단되었습니다.</h4>
<c:remove var="reason" scope="session"/>
</body>
</html>