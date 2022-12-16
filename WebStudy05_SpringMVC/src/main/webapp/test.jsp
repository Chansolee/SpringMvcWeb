<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<table>
  <tr>
    <td colspan="2">
      <tiles:insertAttribute name="header" />
    </td>
  </tr>
  <tr>
    <td>
      <tiles:insertAttribute name="menu" />
    </td>
    <td>
      <tiles:insertAttribute name="body" />
    </td>
  </tr>
  <tr>
    <td colspan="2">
      <tiles:insertAttribute name="footer" />
    </td>
  </tr>
</table>
</body>
</html>