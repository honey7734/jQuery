<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
  <h1>JSP : Java Server Page</h1>
  <p>클라이언트 전송 시 form에서 입력 또는 선택한 값을 가져온다.</p>
  
  <%
    //get방식일때는 한글이 안깨지지만 post방식일 때는 한글이 깨진다
    //해결 방법 : request.setCharacterEncoding("utf-8")를 사용해서 utf-8을 지정해준다
    request.setCharacterEncoding("utf-8");
	String user = request.getParameter("gender");
  
  	out.print("<strong>선택한 값 : " + user + "</strong>");
  %>
</body>
</html>