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
  String userId = request.getParameter("id");
  String userPass = request.getParameter("pass");
  String area = request.getParameter("area");
  
  // area에는 enter기호가-\r\n- 삽입되어 있다.
  // 브라우저에 출력할때는 <br>태그로 변경되어야한다.
  area = area.replaceAll("\r", "").replaceAll("\n", "<br>");
  
//   out.print("<p>이름: " + userId + "</p>");
//   out.print("<p>비밀번호: " + userPass + "</p>");
//   out.print("<p>소개<br>" + area + "</p>");

  out.print("<table border='1'>");
  out.print("<tr><td>아이디</td>");
  out.print("<td>" + userId + "</td></tr>");
  
  out.print("<tr><td>비밀번호</td>");
  out.print("<td>" + userPass + "</td></tr>");
  
  out.print("<tr><td>소개</td>");
  out.print("<td>" + area + "</td></tr>");
  out.print("</table>");
  
%>
</body>
</html>