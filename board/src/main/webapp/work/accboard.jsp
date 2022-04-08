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
  .container{
  	margin-top: 20px;
  }
  h1{
  	margin-left: 20px;
  }
</style>
<script type="text/javascript">
currentPage = 1

$(function() {
	$.ajax({
		url : '<%=request.getContextPath()%>/List.do',
		type : 'post',
		data : {"page" : currentPage},
		success : function(res) {
			code = '<div id="accordion">';
			
			$.each(res, function(i,v) {
			code += '<div class="card">'
			code += '   <div class="card-header">'
			code += '     <a class="card-link" data-toggle="collapse" href="#collapse'+ v.num +'">'
			code += v.subject + '</a>'
			code += '   </div>'
			code += '   <div id="collapse'+ v.num +'" class="collapse" data-parent="#accordion">'
			code += '     <div class="card-body">'
			code += '		<p class="p1">'
			code += '		  작성자 : '+ v.writer +'&nbsp;&nbsp;&nbsp;'
			code += '		  이메일 : '+ v.mail +'&nbsp;&nbsp;&nbsp;'
			code += '		  날짜 : '+ v.wdate +' &nbsp;&nbsp;&nbsp;'
			code += '		  조회수 : '+ v.hit +'&nbsp;&nbsp;&nbsp;'
			code += '		 </p>'
			code += '		<p class="p2">'
			code += '			<input type="button" class="action" name="modify" value="수정">'
			code += '			<input type="button" class="action" name="delete" value="삭제">'
			code += '		</p>'
			code += '		<hr>'
			code += '		<p class="p3">'
			code += v.content;
			code += '		</p>'
			code += '		<p class="p4">'
			code += '		  <textarea rows="" cols="80"></textarea>'
			code += '		  <input type="button" class="action" name="reply" value="등록">'
			code += '		</p>'
			code += '     </div>'
			code += '   </div>'
			code += ' </div>'
			})
			code += '</div>'
			
			$('.container').html(code);
		},
		error : function(xhr) {
			alert("상태 : " + xhr.status)
		},
		dataType : 'json'
	})
})
</script>
</head>
<body>
<h1>accordian 게시판</h1><br>
<div class="container">
  
</div>


</body>
</html>