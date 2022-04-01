<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String res = (String) request.getAttribute("insertvalue");
	//String input = (String) request.getAttribute("id");
	//if(res.equals(input))
	// input이 없을 수도있기 때문에 공통파일에는 쓰지 않는것이 좋을거같음
	
	if(res != null){
%>
	{
		"flag" : "<%=res%>님 가입 성공"
		
	}
<%
	}else{
%>
	{
		"flag" : "Sorry, 가입 실패"	
	}	
<%
	}
%>