<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<style type="text/css">
 
   p{
   	margin: 2px;
   	padding: 2px;
   }
  .p1{
  	width : 70%;
  	float: left;
  }
  .p2{
  	width: 25%;
  	float : right;
  	text-align: right;
  }

  hr{
  	clear: both;
  }
  
  input[name=reply]{
  	height: 55px;
  	vertical-align: top;
  }
</style>
<script type="text/javascript">
$(function() {
	$.ajax({
		url : '<%=request.getContextPath()%>/List.do',
		type : 'get',
		success : function(res) {
			
		},
		error : function(xhr) {
			
		},
		dataType : 'json'
	})
})
</script>
</head>
<body>
<div class="container">
  <h2>게시판</h2>
  <div id="accordion">
  <!-- card삽입 위치 -->
  </div>
</div>


</body>
</html>