<%@page import="kr.or.ddit.buyer.vo.BuyerVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//서블릿에서 실행결과를 공유하여 꺼내기
BuyerVO vo = (BuyerVO)request.getAttribute("vovalue");
%>

{
	"id"   : "<%=vo.getBuyer_id() %>"      ,
	"name" : "<%=vo.getBuyer_name() %>"    ,
	"bank" : "<%=vo.getBuyer_bank() %>"    ,
	"bname": "<%=vo.getBuyer_bankname() %>",
	"bno"  : "<%=vo.getBuyer_bankno() %>"  ,
	"lgu"  : "<%=vo.getBuyer_lgu() %>"     ,
	"mail" : "<%=vo.getBuyer_mail() %>"    ,
	"zip"  : "<%=vo.getBuyer_zip() %>"     ,
	"add1" : "<%=vo.getBuyer_add1() %>"    ,
	"add2" : "<%=vo.getBuyer_add2()%>"
}
