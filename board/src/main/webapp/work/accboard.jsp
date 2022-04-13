<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<title>Bootstrap Example</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>

 <script src="../js/board.js"></script>



 <style>
  p{
    
      margin : 2px;
      padding : 2px;
  }
  .p1{
     width : 70%;
     float : left;
  }
  .p2{
     width : 25%;
     float : right;
     text-align: right;
  }
  hr{
    clear : both;
  }
  input[name=reply]{
    height : 55px;
    vertical-align: top;
  }
  
  .container{
    margin-top : 20px;
  }
  h1{
    margin-left : 50px;
  }
  #stype{
    width : 100px;
  }
  .navbar{
    margin : 5px 25px;
  }
  #pagelist{
     margin-left : 20%;
     height : 50px;
  }
  .pagination{
     
     float : left;
     width : 100px;
  }
  
 </style>

<script>
currentPage = 1;
reply = { } ;  //객체 생성 , 

$(function(){
	typevalue = "";
	wordvalue = "";
	
	listServer();
	
	//search검색  이벤트
	$('#search').on('click', function(){
		typevalue= $('#stype option:selected').val().trim();
		wordvalue =$('#sword').val().trim();
		
		currentPage = 1;
		listServer();
		
	})
	
	//page번호 클릭하는 이벤트
	$('#pagelist').on('click','.pnum',  function(){
		//alert( $(this).text());
		
		currentPage = $(this).text();
		listServer();
	})
	
	//이전버튼 클릭하는 이벤트
	$('#pagelist').on('click', '.prev', function(){
		currentPage = 
			parseInt($('.pager a').first().text()) - 1;
		
		alert(currentPage);
		
		listServer();
	})
	//다음버튼 클릭하는 이벤트
	$('#pagelist').on('click', '.next', function(){
		currentPage =
			parseInt( $('.pager a').last().text()) + 1;
		
		alert(currentPage)
		
		listServer();
	})
	
	
	//수정, 삭제 , 등록 버튼 이벤트 
	//댓글삭제, 댓글 수정 
	$('.container').on('click', '.action', function(){
		actionName =  $(this).attr('name');
		actionIdx  = $(this).attr('idx');
		
		if(actionName == "modify"){
			alert(actionIdx + "번 글을 수정합니다");
		
		}else if(actionName == "delete"){
			alert(actionIdx + "번 글을 삭제합니다");
			
			boardDelete();
			
		}else if(actionName == "reply"){
			alert(actionIdx + "번 글에 댓글을 답니다 ");
			
			//입력한 내용 - cont
			//글번호 - bonum - actionIdx
			//이름 - name  - random 
			//객체로 저장 - reply = {  }
			//객체에 동적으로 속성들을 추가 
			//reply.cont = "";
			//reply.name= "";
			//reply.bonum = actionIdx
			
			cont = $(this).prev().val();
			name = String.fromCharCode(Math.random() * 26 + 65);
			name += String.fromCharCode(Math.random() * 26 + 97);
			name += parseInt(Math.random() * 100 + 1);
			
			reply.cont = cont;
			reply.name= name;
			reply.bonum = actionIdx;
			
			replyInsert();
			
			
		}
	})
	
})
</script>


</head>
<body>
  <h1>accordian 게시판</h1>
  <br>
  <br>
  <nav class="navbar navbar-expand-sm bg-info navbar-info">
	 
	 <select class="form-control" id="stype">
	   <option value="">전체</option>
	   <option value="subject">제목</option>
	   <option value="writer">작성자</option>
	   <option value="content">내용</option>
	 </select>
	 
	  <form class="form-inline" >
	     <input id="sword" class="form-control mr-sm-2" type="text" placeholder="Search">
	     <button id="search" class="btn btn-primary" type="button">Search</button>
	  </form>
  </nav>
  <br><br>
  <!--list출력   -->
 <div class="container">
 </div>
 
 <br><br>
 <div id="pagelist"></div>
</body>
</html>





