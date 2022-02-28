<%@page import="javax.swing.text.Document"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
  <h1>회원가입 결과</h1>
  <%
    request.setCharacterEncoding("UTF-8");
    String name = request.getParameter("name");
    String addr = request.getParameter("addr");
    String mail = request.getParameter("mail");
    String gender = request.getParameter("gender");
  %>
  
  <table border="1">
    <tr>
      <td>이름</td>
      <td><%= name %></td>
    </tr>

    <tr>
      <td>주소</td>
      <td><%= addr %></td>
    </tr>
    
    <tr>
      <td>이메일</td>
      <td><%= mail %></td>
    </tr>
    
    <tr>
      <td>성별</td>
      <td><%= gender %></td>
    </tr>
    
  </table>
</body>
</html>