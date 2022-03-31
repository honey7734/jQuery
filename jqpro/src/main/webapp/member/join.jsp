<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="kr">
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
  <script type="text/javascript">
  	$(function() {
  		
  		//아이디 중복체크
		$('#idchk').on('click', function() {
			event.preventDefault();
			//입력한 값을 가져온다
			idvalue = $('#uid').val();
			
			//서버로 전송
			$.ajax({
				url : '<%=request.getContextPath()%>/IdCheck.do',
				type : 'get',
				data : {'id' : idvalue},
				success : function(res) {
					//alert(res.flag);
					$('#idspan').html(res.flag).css('color', 'red');
				},
				error : function(xhr) {
					alert("상태 : " + xhr.status);
				},
				dataType : 'json'
			})
		})
		
		//우편번호 검색
		$('#zipsearch').on('click', function() {
			event.preventDefault();
			window.open('zipsearch.html', '우편번호', 'width=500 height=400');
		})
		
		
		
	
	//우편번호 찾기 - modal로 수행
	$('#btn1').on('click', function() {
		//입력한 값 가져온다
		dongvalue = $('#dong').val().trim();
		
		//서버로 전송
		$.ajax({
			url : '/jqpro/ZipSearch.do',
			type : 'get',
			data : {"dong" : dongvalue},
			success : function(res) {
				str = "<table >";
				str += "<tr><td>우편번호</td>"
				str += "<td>주소</td>"
				str += "<td>번지</td></tr>"
				$.each(res, function(i,v) {
					var bunji = v.bunji
					if(typeof bunji == 'undefined'){
						bunji = '';
					}
					
					str += "<tr class='ziptr'><td>"+ v.zipcode+"</td>";
					str += "<td>"+ v.sido +" "+ v.gugun + " " + v.dong +"</td>";
					str += "<td>"+bunji+"</td></tr>"; 
					
				})
				str += "</table>";
				$('#result1').html(str);
			},
			error : function(xhr) {
				alert("상태 : " + xhr.status)
			},
			dataType : 'json'
		})
	})
	
	//검색 결과에서 선택하여 부모창으로 값을 넘기기 
	$('#result1').on('click', '.ziptr' , function() {
		zipcode = $('td:eq(0)', this).text();
		addr = $('td:eq(1)', this).text();
		
		$('#zip').val(zipcode);
		$('#add1').val(addr);
		
		$('#dong').val('');
		$('#result1').empty();
		$('#myModal').modal('hide');
	})
		
		
		
		
		
	})
  </script>
<style type="text/css">
#dong{
	margin-left	: 20px; 
}
.ziptr:hover{
	background : lime;
}
</style>
</head>
<body>

<div class="container">
  <h2>회원가입</h2><br>
  <form class="needs-validation" novalidate>
    <div class="form-group">
      <label for="uid">아이디</label>
        <button  type="button" id="idchk" class="btn btn-info mb-2 mr-sm-2">중복검사</button>
      <input type="text" class="form-control col-sm-3" id="uid" placeholder="Enter username" name="mem_id" required>
      <span id="idspan"></span>
      <div class="valid-feedback">Valid.</div>
      <div class="invalid-feedback">Please fill out this field.</div>
    </div>
    
    <div class="form-group">
      <label for="uname">이름</label>
      <input type="text" class="form-control col-sm-3" id="uname" placeholder="Enter username" name="mem_name" required>
      <div class="valid-feedback">Valid.</div>
      <div class="invalid-feedback">Please fill out this field.</div>
    </div>
    
    <div class="form-group">
      <label for="udate">생년월일</label>
      <input type="date" class="form-control col-sm-3" id="udate" placeholder="1999 04 15" name="mem_date" required>
      <div class="valid-feedback">Valid.</div>
      <div class="invalid-feedback">Please fill out this field.</div>
    </div>
    
    <div class="form-group">
      <label for="pwd">비밀번호</label>
      <input type="password" class="form-control col-sm-3" id="pwd" placeholder="Enter password" name="mem_pass" required>
      <div class="valid-feedback">Valid.</div>
      <div class="invalid-feedback">Please fill out this field.</div>
    </div>

    <div class="form-group">
      <label for="utel">휴대폰번호</label>
      <input type="tel" class="form-control col-sm-3" id="utel" placeholder="010-1234-5678" name="mem_tel" required>
      <div class="valid-feedback">Valid.</div>
      <div class="invalid-feedback">Please fill out this field.</div>
    </div>
    
    <div class="form-group">
      <label for="email">이메일</label>
      <input type="email" class="form-control col-sm-3" id="email" placeholder="abcd123@email.com" name="mem_email" required>
      <div class="valid-feedback">Valid.</div>
      <div class="invalid-feedback">Please fill out this field.</div>
    </div>
    
    <div class="form-group">
      <label for="zip">우편번호</label>
      
      
      
      <button type="button" id="zipsearch" class="btn btn-info mb-2 mr-sm-2">번호검색</button>
      
      <button type="button" class="btn btn-info mb-2 mr-sm-2" data-toggle="modal" data-target="#myModal">번호검색modal</button>
      <!-- The Modal -->
	  <div class="modal" id="myModal">
	    <div class="modal-dialog">
	      <div class="modal-content">
	
	        <!-- Modal Header -->
	        <div class="modal-header">
	          <h4 class="modal-title">우편번호 찾기</h4>
	          <button type="button" class="close" data-dismiss="modal">&times;</button>
	        </div>
	
	        <!-- Modal body -->
	        <div class="modal-body">
	          
	          <input type="text"  id="dong">
  
 			  <input id="btn1" type="button" value="확인">
  
 	 		  <div id="result1"></div>
	          
	        </div>
	
	        <!-- Modal footer -->
	        <div class="modal-footer">
	          <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
	        </div>
	
	      </div>
	    </div>
	  </div>
      
      
      
      
      <input type="text" class="form-control col-sm-3" id="zip" placeholder="" name="mem_post" required >
      <div class="valid-feedback">Valid.</div>
      <div class="invalid-feedback">Please fill out this field.</div>
    </div>
    
    <div class="form-group">
      <label for="add1">주소</label>
      <input type="text" class="form-control col-sm-5" id="add1" placeholder="" name="mem_addr" required >
      <div class="valid-feedback">Valid.</div>
      <div class="invalid-feedback">Please fill out this field.</div>
    </div>
    
    <div class="form-group">
      <label for="add2">상세주소</label>
      <input type="text" class="form-control col-sm-5" id="add2" placeholder="" name="mem_addr2" required>
      <div class="valid-feedback">Valid.</div>
      <div class="invalid-feedback">Please fill out this field.</div>
    </div>
    
    <button type="submit" class="btn btn-primary btn-lg">Submit</button>
  </form>
</div>

<script>
// Disable form submissions if there are invalid fields
(function() {
  'use strict';
  window.addEventListener('load', function() {
    // Get the forms we want to add validation styles to
    var forms = document.getElementsByClassName('needs-validation');
    // Loop over them and prevent submission
    var validation = Array.prototype.filter.call(forms, function(form) {
      form.addEventListener('submit', function(event) {
        if (form.checkValidity() === false) {
          event.preventDefault();
          event.stopPropagation();
        }
        form.classList.add('was-validated');
      }, false);
    });
  }, false);
})();
</script>

</body>
</html>
    