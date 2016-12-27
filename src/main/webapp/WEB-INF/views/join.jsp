<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<html>
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>메인 페이지</title>
	
	<script src="https://code.jquery.com/jquery-3.1.0.min.js"></script>
	<script src="resources/bootstrap/js/bootstrap.js"></script>
	<link rel="stylesheet" type="text/css" href="resources/bootstrap/css/bootstrap.css" />
	<style>
	table{
		width: 100%;
	}
	th{
          text-align: right;
          padding-bottom: 10px;
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
			<form class="form-horizontal" name="mainForm" id="mainForm" method="post">
			  <fieldset>
			  	<legend>회원가입</legend>
			  		<table class="cen">
			  			<tr>
			  			<td colspan="5" style="text-align: center;">회원정보를 입력해 주세요. 모두 입력하셔야 가입이 가능합니다.
			  				</td>
			  			</tr>
			  			<tr>
			  				<th>아이디
			  				</th>
			  					<td colspan="3">
			  						<input type="text" name="u_id" class="form-control" placeholder="아이디" >
			  					</td>
			  					<td style="padding-left: 10px;">
			  						<button type="button" class="btn btn-default" id="chk">중복체크</button>
			  					</td>	
			  				<th>
			  				</th>
			  			</tr>
			  			<tr>
			  				<th>비밀번호
			  					</th>
			  						<td colspan="3">
			  							<input type="password" name="u_pass"  id="pw1" class="form-control" placeholder="비밀번호">
			  						</td>
			  					<th>
			  				</th>
			  			</tr>
			  			<tr>
			  				<th>비밀번호 
			  				</th>
			  				<td colspan="3">
			  					<input type="password" name="u_pass2" id="pw2" class="form-control" placeholder="비밀번호 확인">
								<span id="pwchk">
									같은 비밀번호를 입력하시오.
								</span>
			  						</td>
			  				<th>
			  				</th>
			  			</tr>
			  			<tr>
			  				<th>성명
			  				</th>
			  				<td colspan="3">
			  				<input type="text" name="u_name" class="form-control" placeholder="성명" >
			  				</td>
			  				<th>
			  				</th>
			  			</tr>
			  			<tr>
			  				<th>생년월일
			  				</th>
			  				<td colspan="3">
			  					<select name="dateYear" onChange="setDay()"></select>년&nbsp;
    							<select name="dateMonth" onChange="setDay()"></select>월&nbsp;
    							<select name="dateDay"></select>
			  				</td>
			  				
			  				<th>
			  				</th>
			  			</tr>
			  			<tr>
			  				<th>성별
			  				</th>
			  				<td>
			  				<input type="radio" name="u_gender" /> 남자
			  				</td>
			  				<td>
			  				<input type="radio" name="u_gender" /> 여자
			  				</td>
			  				<td>
			  				</td>
			  				<th>
			  				</th>
			  			</tr>
			  			<tr>
			  				<th>email
			  				</th>
			  				<td colspan="3">
			  				<input type="email" name="u_mail" class="form-control" placeholder="email" >
			  				</td>
			  				<td style="padding-left: 10px;">
			  					<button class="btn btn-default">보내기</button>
			  				</td>
			  			</tr>
			  			<tr>
			  				<th>인증번호
			  				</th>
			  				<td colspan="3">
			  				<input type="text" class="form-control" placeholder="인증번호" >
			  				</td>
			  				<td style="padding-left: 10px;">
			  					<button class="btn btn-default">확인</button>
			  				</td>
			  			</tr>
			  			<tr>
			  				<th>
			  				</th>
			  				<td colspan="3" style="text-align: center;">
			  				<button type="button" id="userJoin" class="btn btn-primary">회원가입</button>
			  				<button type="reset" class="btn btn-default">취소</button>
			  				</td>
			  				<th>
			  				</th>
			  			</tr>
			  		</table>
			  		
			  </fieldset>
			</form>
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
$(document).ready(function(){
    var frm = document.getElementById('mainForm');
    
    var nowDate        = new Date();
    var nowYear        = nowDate.getFullYear();
    var nowMonth    = eval(nowDate.getMonth()) +1;
    var nowDay        = eval(nowDate.getDate());
    
    /***************
     * 년 세팅
     ***************/
    var startYear    = nowYear;
    for( var i=0; i<60; i++) {
        frm['dateYear'].options[i] = new Option(startYear-i, startYear-i);
    }

    /***************
     * 월 세팅
     **************/
    for (var i=0; i<12; i++) {
        frm['dateMonth'].options[i] = new Option(i+1, i+1);
    }
    
    
    /***************************************
     * 먼저 현재 년과 월을 셋팅
     * 윤년계산과 월의 마지막 일자를 구하기 위해
     ***************************************/
    frm['dateYear'].value        = nowYear;
    frm['dateMonth'].value    = nowMonth;
    setDay();
    /********************************************
     * 일(day)의 select를 생성하고 현재 일자로 초기화
     ********************************************/
    frm['dateDay'].value        = nowDay;
});

/******************
 * 일(day) 셋팅
 ******************/
function setDay() {
    var frm = document.getElementById("mainForm");
    
    var year            = frm['dateYear'].value;
    var month            = frm['dateMonth'].value;
    var day                = frm['dateDay'].value;    
    var dateDay        = frm['dateDay'];
    
    var arrayMonth    = [31,28,31,30,31,30,31,31,30,31,30,31];
    /*******************************************
     * 윤달 체크 부분
     * 윤달이면 2월 마지막 일자를 29일로 변경
     *******************************************/
    if ((year % 4 == 0 && year % 100 != 0) || year % 400 == 0) {
        arrayMonth[1] = 29;
    }
    /**************************************
     * 기존 일(day) select를 모두 삭제한다.
     **************************************/
    for( var i=dateDay.length; i>0; i--) {
        dateDay.remove(dateDay.selectedIndex);
    }       
    /*********************************
     * 일(day) select 옵션 생성
     *********************************/
    for (var i=1; i<=arrayMonth[month-1]; i++) {
        dateDay.options[i-1] = new Option(i, i);
    }
    /*********************************************
     * 기존에 선택된 일값 유지
     * 기존 일값보다 현재 최대일값이 작을 경우
     * 현재 선택 최대일값으로 세팅
     ********************************************/
    if( day != null || day != "" ) {
        if( day > arrayMonth[month-1] ) {
            dateDay.options.selectedIndex = arrayMonth[month-1]-1;
        } else {
            dateDay.options.selectedIndex = day-1;
        }
    }
}
var data;
var overChk = false;
var url;
//중복체크
$("#chk").click(function(){		
	url="./rest/overlay";
	data={};
	data.u_id=$("input[name='u_id']").val();
	console.log(data);
	ajaxCall(url, data);
});
//비밀번호 일치 확인
$(function(){
	  $('#pw1').keyup(function(){
	   $('span[name=pwchk]').text('');
	  }); //#pw.keyup
	  $('#pw2').keyup(function(){
	   if($('#pw2').val()!=$('#pw1').val()){
	    $('span[name=pwchk]').text('');
	    $('span[name=pwchk]').html('<b style="color:red"> 일치하지않습니다.</b>');
	   }else{
	    $('span[name=pwchk]').text('');
	    $('span[name=pwchk]').html('<b style="color:blue"> 일치합니다.</b>');
	   }
	  }); //#pw2.keyup
	 });
	 
//회원가입
$("#userJoin").click(function(){
	url="./rest/userJoin";
	data={};
	data.u_id = $("input[name='u_id']").val();
	data.u_pass = $("input[name='u_pass']").val();
	data.u_name = $("input[name='u_name']").val();
	data.u_age = $("input[name='age']").val();
	data.u_gender = $("input[name='u_gender']").val();
	data.u_phnum = $("input[name='u_phnum']").val();
	data.u_email = $("input[name='u_mail']").val();
	console.log(data);
	
	if(validation()){
		ajaxCall(url, data);
	}
});

//유효성 검사
function validation(){
	
	if(overChk == false){
		alert("중복 체크를 해 주세요!!");
		return false;
	}else if(data.u_id == null || data.u_id == ""){
		alert("아이디는 필수 입력 사항 입니다.");
		return false;
	}else if(data.u_pass == null || data.u_pass == ""){
		alert("비밀번호는 필수 입력 사항 입니다.");
		return false;
	}else if(data.u_name == null || data.u_name == ""){
		alert("이름은 필수 입력 사항 입니다.");
		return false;
	}else if(data.u_age == null || data.u_age == ""){
		alert("생년월일은 필수 입력 사항 입니다.");
		return false;
	}else if(data.u_gender == null || data.u_gender == ""){
		alert("성별은 필수 입력 사항 입니다.");
		return false;
	}else if(data.u_phnum == null || data.u_phnum == ""){
		alert("핸드폰번호는 필수 입력 사항 입니다.");
		return false;
	}else if(data.u_mail == null || data.u_mail == ""){
		alert("이메일은 필수 입력 사항 입니다.");
		return false;	
	}else{
		return true;
	}		
	
}	

//요청 전송
function ajaxCall(reqUrl, reqData){
	$.ajax({
		url:reqUrl,
		type:'get',
		data:reqData,
		dataType:'json',
		success:function(d){
			result(reqUrl, d);
		},error:function(e){
			console.log(e);
		}
	});
}

function result(url, data){
	console.log(url);
	if(url=="./rest/overlay"){
		if(data.use=="Y"){
			overChk = true;
			alert("사용 가능한 아이디 입니다.");
		}else{
			alert("이미 사용중인 아이디 입니다.");
			$("input[name='u_id']").val("");
		}
	}
	
}
</script>
</html>