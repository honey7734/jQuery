/**
 * 
 */
	  
  function datapro() {
	f = document.ff;
	  
	//입력한 값을 가져온다
	namevalue = f.name.value.trim();
	  
	//공백검증
	if(namevalue.length < 1){
		alert("이름을 입력하세요");
		return false;
	}
	 
	//길이검증
	if(namevalue.length < 2 || namevalue.length > 5){
		alert("이름은 2~5사이입니다");
		return false;
	}
	  
	//정규식
	namereg = /^[가-힣]{2,5}$/
	
	if(!(namereg.test(namevalue))){
		alert("이름 형식오류입니다");
		return false
	}
	  
	// 아이디 검증
	idvalue = f.userid.value.trim();
	  
	if(idvalue.length < 1){
		alert('아이디 입력하세요')
		return false;
	}
	
	
	if(idvalue.length < 4 || idvalue.length > 10){
		alert('아이디4~10사이입니다')
		return false;
	}
	
	idreg = /^[a-z,A-Z][a-zA-Z0-9]{3,9}$/
	
	if(!(idreg.test(idvalue))){
		alert('아이디 형식 오류입니다');
	}
	
	//----------------------------------
	// 비밀번호
	
	passvalue =f.pass.value.trim();
	//공백
	if(passvalue.length < 1){
		alert('비밀번호를 입력하세요')
		return false;
	}	
	
	//길이
	if(passvalue.length < 4 || passvalue.length > 12){
		alert('비밀번호의 길이는 4~12사이입니다')
		return false;
	}
	
	//정규식
	passreg = /^(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9])(?=.*[!@#$%^&*]).{4,12}$/
	
	if(!(passreg.test(passvalue))){
		alert('비밀번호 형식 오류')
		return false;
	}
	
	alert('비밀번호 성공')
	
	
	
	
	//---------------------------
	// 이메일 123@kk12.com PasS1234@w3.org
	emailvalue = f.email.value.trim();
	
	
	// 공백
	if(emailvalue.length < 1){
		alert('이메일을 입력하세요');
		return false;
	}
	
	// 정규식 - 첫글자는 영문자1글자 그 뒤로는 영문자나 숫자가 올 수 있다
	
	emailreg = /^[a-zA-Z][0-9a-zA-Z]{1,9}@[0-9a-zA-Z]+(\.[0-9a-zA-Z]+){1,2}$/;
	
	if(!(emailreg.test(emailvalue))){
		alert('이메일 형식 오류..');
		return false;
	}
	// ---------------------------------
	// 휴대폰 번호 
	
	phvalue = f.phone.value.trim()
	
	//공백
	if(phvalue.length < 1){
		alert('휴대폰 번호를 입력하세요')
		return false;
	}
	
	//길이 = 11일지
	if(phvalue.length != 11){
		alert('휴대폰 번호는 11자리입니다')
		return false;
	}
	
	
	//정규식
	phreg = /^\d{3}\d{4}\d{4}$/
	
	if(!(phreg.test(phvalue))){
		alert('휴대폰 번호 형식 오류..');
		return false;
	}
	
	
	
	return true;
}
	
	
	  