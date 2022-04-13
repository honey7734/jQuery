<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
  //서블릿에서 공유 데이타 꺼내기 
  int num = (Integer)request.getAttribute("qeasweqwa");
  int totalp = (Integer)request.getAttribute("skjdhskfh");

  if(num > 0){
%>
	  {
	     "sw"      : "ok",
	     "totalp"  : "<%=  totalp %>"
	  }  
	  
	  
<%  }else { %>
	  
       {
          "sw" : "no"
       }
<%
  }
%>