<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
  <h1>이메일 전송화면</h1>
  <%
  request.setCharacterEncoding("UTF-8");
  String name = request.getParameter("name");
  String mail = request.getParameter("mail");
  String area = request.getParameter("area");
  
  area = area.replaceAll("\r", "").replaceAll("\n", "<br>");
  %>
  
  <table border="1">
    <tr>
      <td>이름</td>
      <td><%= name %></td>
    </tr>
    
    <tr>
      <td>이메일</td>
      <td><%= mail %></td>
    </tr>
    
    <tr>
      <td>내용</td>
      <td><%= area %></td>
    </tr>
  </table>
</body>
</html>