/**
 * 람다 함수 => 를 이용하는 함수
 * proc3 = (매개변수) => { }
 */
 function proc1(){
	//1~10합
	sum = 0;
	for(i=1; i<=10;i++){
		sum+=i;
	}
	document.querySelector('#result1').innerHTML = sum;
}

//proc1 = function(){}

function proc2(){
	//1~100짝수 합
	hap = 0;
	
	for(i=1;i<=100;i++){
		//if(i%2==0) hap += i;
		if(i%2!=0) continue;
		hap += i;
		
	}
	
	document.querySelector('#result2').innerHTML = hap;
}

//function proc3(a){}
//proc3 = function(a){}
proc3 = () =>{
	var hap = 0;
	var str = "";
	while(true){
		//입력
		su = parseInt(prompt('숫자를 입력하세요'));
		
		//비교
		if(su == 0) break;
		
		//더하기
		hap += su;
		str += su + " ";
	}
	res = "입력한 값들 : " + str + "<br>";
	res += "더한 값 : " + hap;
	
	document.querySelector('#result3').innerHTML = res;
}