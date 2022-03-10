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

proc4 = () =>{
	var str = "";
	for(i=1; i<=10; i++){
		for(k=1; k<=10; k++){
			if((i+k)%3 != 0) continue;
			str += `${i} ${k} <br>`;
		}
	}
	
	document.querySelector('#result4').innerHTML = str;
}

proc5 = () =>{
	var str = "";
	for(i=1; i<=100; i++){
		if(i % 2 == 0 && i % 3 == 0) str += `${i},`;
	}
	
	document.querySelector('#result5').innerHTML = str;
}

proc6 =() =>{
	
	grth = "합이 100이상인 값들 <br>";  // 두 수의 합이 100보다 큰 값들 저장
	leth = "합이 100미만인 값들 <br>";  // 두 수의 합이 100미만인  값들 저장
	
	while(true){
		//입력
		su1 =  parseInt(prompt('첫번째 수를 입력하세요'));
		su2 =  parseInt(prompt('두번째 수를 입력하세요'));
		
		if(su1 == 0 && su2 == 0) break;
		
		// 두 수의 합 구하기
		hap = su1 + su2;
		
		if(hap >=100) grth += `${su1} ${su2} <br>`;
		if(hap < 100)  leth += `${su1} ${su2} <br>`;
		
		//출력
		str = grth + "<br>" + leth;
		document.querySelector('#result6').innerHTML = str;
		
	}
}