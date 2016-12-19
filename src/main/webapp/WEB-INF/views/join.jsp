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
			<form class="form-horizontal"name="mainForm" id="mainForm" method="post">
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
			  				<input type="text" class="form-control" placeholder="아이디">
			  				</td>
			  				<td style="padding-left: 10px;">
			  					<button class="btn btn-default">중복체크</button>
			  				</td>
			  			</tr>
			  			<tr>
			  				<th>비밀번호</th>
			  				<td colspan="3">
			  				<input type="password" class="form-control" placeholder="비밀번호">
			  				</td>
			  				<th></th>
			  			</tr>
			  			<tr>
			  				<th>비밀번호</th>
			  				<td colspan="3">
			  				<input type="password" class="form-control" placeholder="비밀번호">
			  				</td>
			  				<th></th>
			  			</tr>
			  			<tr>
			  				<th>성명</th>
			  				<td colspan="3">
			  				<input type="text" class="form-control" placeholder="성명" >
			  				</td>
			  				<th></th>
			  			</tr>
			  			<tr>
			  				<th>생년월일</th>
			  				<td colspan="3">
			  					<select name="dateYear" onChange="setDay()"></select>년&nbsp;
    							<select name="dateMonth" onChange="setDay()"></select>월&nbsp;
    							<select name="dateDay"></select>
			  				</td>
			  				<th></th>
			  			</tr>
			  			<tr>
			  				<th>성별</th>
			  				<td>
			  					<input type="radio" name="" /> 남자
			  				</td>
			  				<td>
			  					<input type="radio" name="" /> 여자
			  				</td>
			  				<td></td>
			  				<th></th>
			  			</tr>
			  			<tr>
			  				<th>핸드폰</th>
			  				<td colspan="3">
			  					<input type="text" class="form-control" placeholder="핸드폰" >
			  				</td>
			  				<td></td>
			  			</tr>
			  			<tr>
			  				<th>email</th>
			  				<td colspan="3">
			  					<input type="email" class="form-control" placeholder="이메일" >
			  				</td>
			  				<td style="padding-left: 10px;">
			  					<button class="btn btn-default">보내기</button>
			  				</td>
			  			</tr>
			  			<tr>
			  				<th>인증번호</th>
			  				<td colspan="3">
			  				<input type="text" class="form-control" placeholder="인증번호" >
			  				</td>
			  				<td style="padding-left: 10px;">
			  					<button class="btn btn-default">확인</button>
			  				</td>
			  			</tr>
			  			<tr>
			  				<td colspan="5" style="text-align: center;">
			  				<button type="reset" class="btn btn-default">취소</button>
			        		<button type="submit" class="btn btn-primary">등록</button>
			  				</td>
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
</script>
</html>