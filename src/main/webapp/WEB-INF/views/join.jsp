<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<html>
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>회원가입</title>
	
	<script src="https://code.jquery.com/jquery-3.1.0.min.js"></script>
	<script src="resources/bootstrap/js/bootstrap.js"></script>
	<link rel="stylesheet" type="text/css" href="resources/bootstrap/css/bootstrap.css" />
	<style>
		table{
			width: 100%;
		}
		th{
			text-align: right;
			padding-bottom: 5px;
			padding-right: 10px;
			width: 20%;
			/* border: 1px solid; */
		}
		td{
			padding-bottom: 10px;
			width: 20%;
			/*  border: 1px solid; */
		}
	</style>
</head>
<body>
	<jsp:include page="../../resources/include/logo.jsp" />
	<jsp:include page="../../resources/include/nav.jsp" />
	<div class=" layer">
	<div class="page">
		<div class="col2 content">
		<!-- 배너 -->
		</div>
		<div class="col5 content"> 
            <div class="well bs-component">
		
			  <fieldset>
			  	<legend>회원가입</legend>
			  		<table>
			  			<tr>
				  			<td colspan="5" style="text-align: center;">
				  				회원정보를 입력해 주세요. 모두 입력하셔야 가입이 가능합니다.
				  			</td>
			  			</tr>
			  			<tr>
			  				<th>아이디</th>
			  				<td colspan="3">
			  				<input type="text" id="u_id" class="form-control" placeholder="아이디(영문, 숫자만으로 5~12문자 사용)" onKeyPress="idLimited()">
			  				</td>
			  				<td style="padding-left: 10px;">
			  					<input type="button" class="btn btn-default" id="overlay" value="중복체크" />
			  				</td>
			  			</tr>
			  			<tr>
			  				<th>비밀번호</th>
			  				<td colspan="3">
			  				<input type="password" id="u_pass" class="form-control" placeholder="비밀번호(5문자 이상 사용)" onKeyPress>
			  				</td>
			  				<th></th>
			  			</tr>
			  			<tr>
			  				<th>비밀번호</th>
			  				<td colspan="3">
			  					<input type="password" id="re_pass" class="form-control" placeholder="비밀번호 재입력" onKeyPress>
			  				</td>
			  				<td style="padding-left: 10px;">
			  					<input type="button" class="btn btn-default" id="passCheck" value="확인" />
			  				</td>
			  				<th></th>
			  			</tr>
			  			<tr>
			  				<th>성명</th>
			  				<td colspan="3">
			  				<input type="text" id="u_name" class="form-control" placeholder="성명" onKeyPress>
			  				</td>
			  				<th></th>
			  			</tr>
			  			<tr>
			  				<th>생년월일</th>
			  				<td colspan="3">
			  					<select id="dateYear" onChange="setDay()"></select>년&nbsp;
    							<select id="dateMonth" onChange="setDay()"></select>월&nbsp;
    							<select id="dateDay"></select>
			  				</td>
			  				<th></th>
			  			</tr>
			  			<tr>
			  				<th>성별</th>
			  				<td>
			  					<input type="radio" name="gender" value="male" /> 남자
			  				</td>
			  				<td>
			  					<input type="radio" name="gender" value="female" /> 여자
			  				</td>
			  				<td></td>
			  				<th></th>
			  			</tr>
			  			<tr>
			  				<th>핸드폰</th>
			  				<td colspan="3">
			  					<input type="text" id="phonNum" class="form-control" placeholder="핸드폰번호" onKeyPress="">
			  				</td>
			  				<td></td>
			  			</tr>
			  			<tr>
			  				<th>email</th>
			  				<td colspan="3">
			  					<input type="email" id="mail" class="form-control" placeholder="이메일" >
			  				</td>
			  				<td style="padding-left: 10px;">
			  					<input type="button" class="btn btn-default" id="Certification" onclick="send()" value="보내기" />
			  				</td>
			  			</tr>
			  			<tr>
			  				<th>인증번호</th>
			  				<td colspan="3">
			  				<input type="text" name="Certification" class="form-control" placeholder="인증번호" >
			  				</td>
			  				<td style="padding-left: 10px;">
			  					<input type="button" class="btn btn-default" onclick="numberCheck()" value="확인" />
			  				</td>
			  			</tr>
			  			<tr>
			  				<td colspan="5" style="text-align: center;">
			  				<input type="reset" class="btn btn-default" value="취소" />
			        		<input type="button" class="btn btn-primary" onclick="joinCheck()" value="등록" />
			  				</td>
			  			</tr>
			  		</table>
			  </fieldset>
			</div>
		</div>
		<div class="col3 content">      
		<!-- 배너 -->
		</div>
		</div>
	</div>
	<jsp:include page="../../resources/include/footer.jsp" />
</body>
<script>
/*중복체크 변수*/
var overlay=false;

/*비밀번호와 비밀번호재입력 부분의 확인을 위한 변수*/
var passCheck=false;

/*생년월일 선택을 했는지 유무*/
 var year="";
 var month="";
 var day="";
 var dayCheck=false;

 /*메일 인증 유무*/
 var Certification=false;
 
 /*인증번호*/
 var number="";
 
$(document).ready(function(){
    
    
    var nowDate        = new Date();
    var nowYear        = nowDate.getFullYear();
    var nowMonth    = eval(nowDate.getMonth()) +1;
    var nowDay        = eval(nowDate.getDate());
    
    /***************
     * 년 세팅
     ***************/
    var startYear    = nowYear;
    for( var i=0; i<60; i++) {
        $("#dateYear").append("<option value='"+(startYear-i)+"'>"+(startYear-i)+"</option>");
    }
    /***************
     * 월 세팅
     **************/
    for (var i=0; i<12; i++) {
        $("#dateMonth").append("<option value='"+(i+1)+"'>"+(i+1)+"</option>");
    }
    
    
    /***************************************
     * 먼저 현재 년과 월을 셋팅
     * 윤년계산과 월의 마지막 일자를 구하기 위해
     ***************************************/
    $("#dateYear").val(nowYear);
    $("#dateMonth").val(nowMonth);
    setDay();
    /********************************************
     * 일(day)의 select를 생성하고 현재 일자로 초기화
     ********************************************/
   	$("#dateDay").val(nowDay);
    
    /*************************
    *오늘 날짜와 선택 날짜 비교를 위한 준비
    *************************/
    year=nowYear;
    month=nowMonth;
    day=nowDay;
});

/******************
 * 일(day) 셋팅
 ******************/
function setDay(){
    
    var setYear            = $("#dateYear").val();
    var setMonth            = $("#dateMonth").val();
    var setDay                = $("#dateDay").val();
    var dateDay        = $("#dateDay");
    
    var arrayMonth    = [31,28,31,30,31,30,31,31,30,31,30,31];
    /*******************************************
     * 윤달 체크 부분
     * 윤달이면 2월 마지막 일자를 29일로 변경
     *******************************************/
    if ((setYear % 4 == 0 && setYear % 100 != 0) || setYear % 400 == 0) {
        arrayMonth[1] = 29;
    }
    /**************************************
     * 기존 일(day) select를 모두 삭제한다.
     **************************************/
    for( var i=dateDay.length; i>0; i--) {
        $("#dateDay option:eq("+i+")").remove();
    }
        
    /*********************************
     * 일(day) select 옵션 생성
     *********************************/
     $("#dateDay").empty();
    for (var i=1; i<=arrayMonth[setMonth-1]; i++) {
        $("#dateDay").append("<option value='"+i+"'>"+i+"</option>");
    }
    /*********************************************
     * 기존에 선택된 일값 유지
     * 기존 일값보다 현재 최대일값이 작을 경우
     * 현재 선택 최대일값으로 세팅
     ********************************************/
    if( setDay != null || setDay != "" ) {
        if( setDay > arrayMonth[setMonth-1] ) {
             $("#dateDay option:eq("+(arrayMonth[setMonth-1]-1)+")").attr("selected", "selected");
        } else {
        	$("#dateDay option:eq("+(setDay-1)+")").attr("selected", "selected");
        }
    }
}

/****** 
 *중복체크
 ******/
$("#overlay").click(function(){
	var url="./overlay";
	var id = $("#u_id").val();
	var data={};
	if(overlay){
		alert("이미 중복확인 되었습니다.");
	}else{
		if(id==""){
			alert("아이디를 입력해주세요");
			$("#u_id").focus();
		}else if(id.length<5||id.length>12){
			alert("아이디는 5~12문자만 사용됩니다.");
		}else{
			console.log(id);
			data.id=id;
			reqServer(url, data);
		}	
	}
});


/*****************************
 *중복체크 후 아이디 변환시 중복체크 재기동
 *****************************/
 $("#u_id").change(function(){
	if(overlay){
		console.log("아이디 변환");
		overlay=false;	
	}
}); 

/**********
 * 비밀번호 확인
 **********/
 $("#passCheck").click(function(){
	 var pass=$("#u_pass").val();
	 var rePass=$("#re_pass").val();
	 if(pass==""){
		 alert("비밀번호를 입력해주세요");
		$("#u_pass").focus();
	 }else if(pass.length<5){
		alert("비밀번호는 5자 이상입력해야 합니다.");
		$("#u_pass").focus();
	 }else if(rePass==""){
		 alert("비밀번호 재입력을 입력해주세요");
		 $("#re_pass").focus();
	 }else if(pass!=rePass){
		 alert("비밀번호가 서로 다릅니다.");
		 $("#re_pass").focus();
	 }else{
		 alert("비밀번호 확인!");
		 passCheck=true;
	 }
 });
 
 /*******************
 *비밀번호 입력후 변경됬을 경우
 ********************/
 $("#u_pass").change(function(){
	if(passCheck){
		console.log("비밀번호 변환");
		passCheck=false;	
	}
}); 

/***********************
 * 인증 번호 보내기
 ***********************/
function send(){
	var email=$("input[type='email']").val();
	var url="./certification";
	var data={};
	
	if(email==""){
		alert("이메일을 입력해주세요");
	}else{
		data.mail=email;
		reqServer(url, data);
	}
	
}


/**********
 * 인증번호 확인
 **********/

 function numberCheck(){
	var num=$("input[name='Certification']").val();
	console.log(num);
	console.log(number);
	if(num==number){
		alert("인증번호를 확인했습니다.");
		Certification=true;
	}else{
		alert("번호가 올바르지 않습니다.");
		Certification=false;
	}
}

$("#mail").change(function(){
	if(Certification){
		console.log("메일 변경");
		Certification=false;
	}
});
 
/******
 * ajax폼
 *****/
function reqServer(url, data){
	console.log("ajax전송");
	$.ajax({
		url:url,
		type:"post",
		data:data,
		dataType:"JSON",
		success:function(data){
			console.log(data);
			if(url=="./overlay"){
				var yn=data.use;
				console.log(yn);
				if(yn=="Y"){
					alert("중복체크 확인");
					overlay=true;
				}else{
					alert("중복되는 아이디가 있습니다.");
				}
			}else if(url=="./certification"){
				alert(data.msg);
				number=data.num;
			}else if(url=="./join"){
				alert(data.msg);
				if(data.msg=="회원가입에 성공했습니다."){
					location.href="./index";
				}
			}
		},
		error:function(error){
			console.log(error);
		}
	});
}



/***********************
 * 회원가입 정보기입 체크
 ***********************/
function joinCheck(){
	var url="./join";
	var data={};
	
	console.log(overlay);
	console.log(passCheck);
	if($("#dateYear").val()==year&&$("#dateMonth").val()==month&&$("#dateDay").val()==day){
		dayCheck=false;
	}else{
		dayCheck=true;
	}
	console.log($("input[name='gender']:radio[value='male']").is(":checked")||$("input[name='gender']:radio[value='female']").is(":checked"));
	
	if($("#u_id").val()==""){
		alert("아이디를 입력해주세요");
		$("#u_id").focus();
	}else if(!overlay){
		alert("중복체크를 해주세요");
		$("#overlay").focus();
	}else if($("#u_pass").val()==""){
		alert("비밀번호를 입력해주세요");
		$("#u_pass").focus();
	}else if(!passCheck){
		alert("비밀번호확인을 실행해주세요");
		$("#passCheck").focus();
	}else if($("#u_name").val()==""){
		alert("성명을 입력해주세요");
		$("#u_name").focus();
	}else if(!dayCheck){
		alert("생년월일을 입력해주세요");
		$("#dateYear").focus();
	}else if(!($("input[name='gender']:radio[value='male']").is(":checked")||$("input[name='gender']:radio[value='female']").is(":checked"))){
		alert("성별을 선택해주세요");
	}else if($("#phonNum").val()==""){
		alert("핸드폰 번호를 입력해주세요");
		$("#phonNum").focus();
	}else if(!Certification){
		alert("메일인증을 해주세요");
	}else{
		data.id=$("#u_id").val();
		data.pass=$("#u_pass").val();
		data.name=$("#u_name").val();
		data.age=$("#dateYear").val()+"/"+$("#dateMonth").val()+"/"+$("#dateDay").val();
		data.gender=$("input[name='gender']:checked").val();
		data.phonNum=$("#phonNum").val();
		data.mail=$("#mail").val();
		reqServer(url, data);
	}
}


 
</script>
</html>