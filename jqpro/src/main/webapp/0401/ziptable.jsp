<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>

<title>Insert title here</title>
<script type="text/javascript">
$(function() {
	//sido 데이터가 시작하자 마자 입력된다
	$.ajax({
		url : '/jqpro/ZipController.do',
		data : {'flag' : 0},
		type : 'get',
		success : function(res) {
			str = "";
			$.each(res, function(i,v) {
				str += "<option value='"+v+"'>" + v + "</option>"
			})
				
			$('#sido').html(str);
			$('#sido').trigger('change');
		},
		error : function(xhr) {
			alert('상태 : ' + xhr.status)
		},
		dataType : 'json'
	})		
	
	//sido를 선택했을때
	$('#sido').on('change', function() {
		var sido = $('option:selected', this).val();
		
		//gugun 불러오기
		$.ajax({
			url : '/jqpro/ZipController.do',
			data : {
				'flag' : 1 ,
				'sido' : sido	
			},
			type : 'get',
			success : function(res) {
				str = "";
				$.each(res, function(i,v) {
					str += "<option value='"+v+"'>" + v + "</option>"
				})
					
				$('#gugun').html(str);
				$('#gugun').trigger('change');
				
			},
			error : function(xhr) {
				alert('상태 : ' + xhr.status)
			},
			dataType : 'json'
		})
		
	})
	
	$('#gugun').on('change', function() {
		var sido = $('#sido option:selected').val();
		var gugun = $('option:selected', this).val();
		
		//dong 불러오기
		$.ajax({
			url : '/jqpro/ZipController.do',
			data : {
				'flag' : 2 ,
				'sido' : sido,
				'gugun': gugun
			},
			type : 'get',
			success : function(res) {
				str = "";
				$.each(res, function(i,v) {
					str += "<option value='"+v+"'>" + v + "</option>"
				})
					
				$('#dong').html(str);
				$('#dong').trigger('change');
				
			},
			error : function(xhr) {
				alert('상태 : ' + xhr.status)
			},
			dataType : 'json'
		})
	})
	
	$("#dong").on('change', function() {
		var sido = $('#sido option:selected').val();
		var gugun = $('#gugun option:selected').val();
		var dong = $('option:selected', this).val();
		
		//Detail불러와 result에 출력하기
		$.ajax({
			url : '/jqpro/ZipController.do',
			data : {
				'flag' : 3 ,
				'sido' : sido,
				'gugun': gugun,
				'dong' : dong
			},
			type : 'get',
			success : function(res) {
				str = "";
				$.each(res, function(i,v) {
					if(v.bunji == undefined) v.bunji =""
					str += "<p>" + v.zipcode + " " + v.sido + " " + v.gugun + " " + v.dong + " " + v.bunji + "</p>"
				})
					
				$('#result').html(str);
				
			},
			error : function(xhr) {
				alert('상태 : ' + xhr.status)
			},
			dataType : 'json'
		})
	})
	
	
	
})
</script>
<style type="text/css">
p:hover{
	background: lime;
}
</style>

</head>
<body>
	
	<form class="form-inline d-flex justify-content-around" >
	<select class="form-control" id="sido"></select>
	
	<select class="form-control" id="gugun"></select>
	
	<select class="form-control" id="dong"></select>
	</form>
	
	
	<div id="result"></div>
	
</body>
</html>