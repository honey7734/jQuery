<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String id = (String) request.getAttribute("idresult");
	if(id == null){
		//사용가능한 아이디	
%>
	{
		"flag" : "사용가능합니다"	
	}
<% 
	}else{
		//사용불가능한 아이디
%>
	{
		"flag" :"사용 불가능합니다"
	}
<%
	}
%>
