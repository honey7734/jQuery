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
  .rcode{
  	background: pink;
  	margin: 2px;
  	padding: 3px;
  	border: 1px solid lightgray;
  }
  #modifyForm{
  	display: none;
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
	//댓글삭제, 댓글 수정 , 제목 
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
			
			replyInsert(this);
			$(this).prev().val("");
			
		}else if(actionName == "title"){
			alert(actionIdx + "번의 댓글을 출력합니다");
		
			replyList(this);
		}else if(actionName == "r_delete"){
			alert(actionIdx + "번 댓글을 삭제합니다")
		
			replyDelete(this);

		}else if(actionName == "r_modify"){
			alert(actionIdx + "번 댓글을 수정합니다")
			
			//댓긇 수정폼의 css속성값을 가져온다
			if($('#modifyForm').css('display') != "none"){
				//다른곳에 수정폼이 이미 열려 있다
				//수정폼을 body로 다시 append
				//원래 내용을 원래 위치로 환원
				replyReset();	
			}
			
			//원래 내용(수정할 내용) 가져오기 - <br>태그가 포함
			p3cont = $(this).parents('.rcode').find('.p3').html();
			
			//\n으로 변경
			p3temp = p3cont.replace(/<br>/g, "\n");
			
			$('#modifyForm textarea').val(p3temp);
			
			$(this).parents('.rcode').find('.p3').empty().append($('#modifyForm'))
			$('#modifyForm').show();
		}
	})
	
	function replyReset() {
		//p3찾기
		vp3 = $('#modifyForm').parent();
		
		//수정폼을 다시 body로 이등 후 감추기
		$('body').append($('#modifyForm'));
		$('#modifyForm').hide();
		
		//원래 데이터 환원
		vp3 = $(vp3).html(p3cont);
	}
	
	//댓글 수정창에서 취소버튼 클릭 이벤트
	$('#btnreset').on('click', function() {
		replyReset();
	})
	
	
	//댓글 수정창에서 확인버튼 클릭 이벤트
	$('#btnok').on('click', function() {
		//수정입력 내용 가져오기 - \r\n이 포함되어있다.
		modiCont = $('#modifyForm textarea').val();
		
		//환원할 위치 = p3
		vp3 = $('#modifyForm').parent();
		
		//수정폼을 body로 이동, 감추기
		$('body').append($('#modifyForm'))
		$('#modifyForm').hide();
		
		//modiCont내용을 <br>태그로 바뀌서 p3위치에 출력표시
		modiShow = modiCont.replace(/\r/g,"").replace(/\n/g, "<br>");
		
		//vp3.html(modiShow);
		
		//db에서 수정 - 
		reply.renum = actionIdx;
		reply.cont = modiCont;
		replyUpdate();
	})
	
})
</script>


</head>
<body>
	
	<!-- 기존에 있는 것을 옮기는 것? => append 
		append는 짤라서 붙여넣기를 해준다 -->
	
  <div id="modifyForm">
  	<textarea rows="3" cols="30"></textarea>
  	<input type="button" value="확인" id="btnok">
  	<input type="button" value="취소" id="btnreset">
  </div>
  
  
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





