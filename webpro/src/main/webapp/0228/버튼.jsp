<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
  request.setCharacterEncoding("UTF-8");
  String userName = request.getParameter("name");
  String userId = request.getParameter("id");
	
  out.print("<p>이름" + userName + "</p>");
  out.print("<p>아이디" + userId + "</p>");
%>
</body>
</html>