/**
 * 
 */

/*
각자 해보시오
var boardWrite = function(){
	data : $('#ff').serializeJson(),
	success : function(){
		성공하면
		listServer(1);
	}	
}*/

/*var boardUpdate = function(){
	$.ajax({
		url : "/board/BoardUpdate.do",
		type : "post",
		data : board, //content, mail, subject, num
		success : function(res){
			//화면을 바꾼다
			if(res.sw){
				cont = cont.replace(/\r/g, "").replace(/\n/g, "<br>");
			
				$(bcard).find('a').text(sub);
				$(bcard).find('.bwr').text(wr);
				$(bcard).find('.bma').text(mail);
				$(bcard).find('.p3').html(cont);
			
				//창닫기
				$('#modiModal').modal('hide');
			}
			
		},
		error : function(xhr){
			alert("상태 : " + xhr.status);
		},
		dataType:'json'
	})
} */
 
var readHit = function(target){
	$.ajax({
		url : "/board/HitUpdate.do",
		type : "get",
		data : {
			"num" : actionIdx
		},
		success : function(res){
			//DB에서 성공하면 화면 수정
			if(res.sw == "성공"){
				hit = $(target).parents('.card').find('.bhit');
				
				vhit = parseInt($(hit).text()) + 1
				
				$(hit).text(vhit);
			}
		},
		error : function(xhr){
			alert("상태 : " + xhr.status);
		},
		dataType:'json'
	})
}
 
var replyUpdate = function(){
	$.ajax({
		url : '/board/ReplyUpdate.do',
		type : 'post',
		data : reply,	//cont, renum
		success : function(res){
			alert(res.sw);
			if(res.sw == "성공"){
				//성공 했으면 화면에서 삭제
				vp3.html(modiShow);			
			}
			
		},
		error : function(xhr){
			alert("상태 : " + xhr.status);
		},
		dataType:'json'
	})	
}

var replyDelete = function(target){
	$.ajax({
		url : '/board/ReplyDelete.do',
		type : 'get',
		data : {
			"renum" : actionIdx
		},
		success : function(res){
			//alert(res.sw);
			//화면에서 지우기
			$(target).parents('.rcode').remove();
		},
		error : function(xhr){
			alert("상태 : " + xhr.status);
		},
		dataType:'json'
	})
} 
 
 
var replyList = function(target){
	// target변수는 등록버튼 또는 제목의 a태그
	
	$.ajax({
		url :'/board/ReplyList.do',
		type : 'get',
		data : { 
			"bonum" : actionIdx
		},
		success : function(res){
		  rcode= "";
		  
		  $.each(res, function(i,v){
		   	  rcode += '     <div class="rcode">';
		   	  rcode += '       <p class="p1">';
		   	  rcode += '         작성자 : ' + v.name + '&nbsp;&nbsp;&nbsp;';
		   	  rcode += '         날짜 : ' + v.redate + '&nbsp;&nbsp;&nbsp;';
		   	  rcode += '       </p>';
		   	  rcode += '       <p class="p2">';
		   	  rcode += '         <input idx="' + v.renum + '" type="button" class="action" name="r_modify" value="댓글수정">';
		   	  rcode += '         <input idx="' + v.renum + '" type="button" class="action" name="r_delete" value="댓글삭제">';
		   	  rcode += '       </p>';
		   	  rcode += '       <hr>';
		   	  rcode += '       <p class="p3">';
		   	  rcode += v.cont.replace(/\r/g,"").replace(/\n/g,"<br>");
		   	  	// //g는 global 즉 모든을 의미한다 
		   	  rcode += '       </p>';
		   	  rcode += '     </div>';
		   	  
		   	  
		   	  
		   	  //parents는 조상 parent는 부모 find는 자식을 찾을 때
		   	  cardbody = $(target).parents('.card').find('.card-body');
		   	  
		   	  cardbody.find('.rcode').remove();
		   	  cardbody.append(rcode);
		   	  
		  })
			
	   	
	    
	    	
		},
		error : function(xhr){
			
		},
		dataType : 'json'
		
	})
	
	
	
	   
		
			
}
 var replyInsert = function(target){
	$.ajax({
		url : '/board/ReplyInsert.do',
		type : 'post',
		data : reply, //reply객체 - bonum, name, cont
		success : function(res){
			alert(res.sw);
			//댓글 출력
			replyList(target); 
			
		},
		error : function(xhr){
			alert("상태 : " + xhr.status);
		},
		dataType : 'json'
	})
	
}
 
 
 
 
 var boardDelete = function(){
	typevalue= $('#stype option:selected').val().trim();
	wordvalue =$('#sword').val().trim();
	
	$.ajax({
		url : '/board/BoardDelete.do',
		type :'post',
		data : {
			"page" : currentPage,
			"num"  : actionIdx,
			"type" : typevalue,
			"word" : wordvalue
		},
		success : function(res){
			 if(res.sw == "ok"){
				
				 if(res.totalp < currentPage){
				 		   currentPage = res.totalp;
				 
				 }
				 listServer();
				 
			 }else{
				alert("삭제 실패");
			 }
		},
		error : function(xhr){
			alert("상태 : " + xhr.status); // 200, 404, 500
		},
		dataType : 'json'
	})
		
}
 
 
 
 var listServer = function(){
	$.ajax({
	   url : '/board/List.do',
	   type : 'post',
	   data :{
		   'page'  :  currentPage,
		   'stype' : typevalue, //writer, content
		   'sword' : wordvalue
	   },
	   success : function(res){
		  
		   code = '<div id="accordion">';
		   
		   
		   $.each(res.datas, function(i, v){ 
		   code += '<div class="card">';
		   code += '   <div class="card-header action" name="title" idx="'+ v.num +'">';
		   code += '     <a class="card-link" data-toggle="collapse" href="#collapse' + v.num + '">';
		   code += v.subject +'</a>';
		   code += '   </div>';
		   code += '   <div id="collapse' + v.num + '" class="collapse" data-parent="#accordion">';
		   code += '     <div class="card-body">';
		   code += '       <p class="p1">';
		   code += '         작성자 : <span class="bwr">' + v.writer + '</span>&nbsp;&nbsp;&nbsp;';
		   code += '         이메일 : <span class="bma">' + v.mail + '</span>&nbsp;&nbsp;&nbsp;';
		   code += '         날짜 : <span class="bda">' + v.wdate + '</span>&nbsp;&nbsp;&nbsp;';
		   code += '         조회수 : <span class="bhit">' + v.hit + '</span>&nbsp;&nbsp;&nbsp;';
		   code += '       </p>';
		   code += '       <p class="p2">';
		   code += '         <input idx="' + v.num + '" type="button" class="action" name="modify" value="수정"  data-toggle="modal" data-target="#modiModal" >';
		   code += '         <input idx="' + v.num + '" type="button" class="action" name="delete" value="삭제">';
		   code += '       </p>';
		   code += '       <hr>';
		   code += '       <p class="p3">';
		   code += v.content;
		   code += '       </p>';
		   code += '       <p class="p4">';
		   code += '          <textarea rows="" cols="80"></textarea>';
		   code += '          <input idx="' + v.num + '" type="button" class="action" name="reply" value="등록">';
		   code += '       </p>';
		   code += '     </div>';
		   code += '   </div>';
		   code += ' </div>';  
		   })//반복문
		   
		   code += '</div>';
		   
		   
		   $('.container').html(code);
		   
		   pcode = "";
		   
		   //이전버튼 출력
		   if(res.startp > 1) {
			pcode = '<ul class="pagination">';
			pcode +='<li class="page-item">';
			pcode +='<a class="page-link prev" href="#">Previous</a>';
			pcode += '</li>';
			pcode += '</ul>';
		  }
		   
		   
		   pcode += '<ul  class="pagination pager">'
		   //페이지 목록 출력 
		   for(i= res.startp ; i<= res.endp; i++){
			  if(currentPage == i){
				pcode +='<li class="page-item active">';
		     	pcode +='<a class="page-link pnum" href="#">' + i + '</a>'
		     	pcode += '</li>';
			  }else{
				pcode +='<li class="page-item">';
		     	pcode +='<a class="page-link pnum" href="#">' + i + '</a>'
		     	pcode += '</li>';
			  }
		   }
		   pcode += '</ul>'
		   
		   
		   //다음 버튼 출력 
		   if(res.endp < res.totalp){
			pcode += '<ul class="pagination">';
			pcode +='<li class="page-item">';
			pcode +='<a class="page-link next" href="#">Next</a>';
			pcode += '</li>';
			pcode += '</ul>';
		   }
		   
		   
		   $('#pagelist').html(pcode);
		   
	   }, //success
	   error : function(xhr){
		   alert("상태 : " + xhr.status);
	   },
	   dataType : 'json'
	})//ajax
	
}//listServer




