<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<html>
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>팀만들기</title>
	
	<script src="https://code.jquery.com/jquery-3.1.0.min.js"></script>
	<script src="resources/bootstrap/js/bootstrap.js"></script>
	<link rel="stylesheet" type="text/css" href="resources/bootstrap/css/bootstrap.css" />
	<style>
		.well{
			min-height: 510px;
		}
		#emblem{
            border: 1px solid; 
			width: 170px;
			height: 220px;
            margin-left: 10px;
            margin-bottom: 10px; 
		}
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
			width: 60%;
			/*  border: 1px solid; */
		}
	</style>
</head>
<body>
	<jsp:include page="../../resources/include/logo.jsp" />
	<jsp:include page="../../resources/include/nav.jsp" />
	<div class=" layer">
	<div class="page">
		<form class="form-horizontal"name="mainForm" id="mainForm" method="post">
		<div class="col2 content">
			<div id="emblem">
				사진		
			</div>
			<input type="file" name="t_picture">
		</div>
		<div class="col5 content"> 
            <div class="well bs-component">
			  <fieldset>
			  	<legend>팀만들기</legend>
			  		<table>
			  			<tr>
				  			<td colspan="3" style="text-align: center;">
				  				팀정보를 입력해 주세요. 모두 입력하셔야 가입이 가능합니다.
				  			</td>
			  			</tr>
			  			<tr>
			  				<th>팀명</th>
			  				<td>
			  					<input type="text" class="form-control" placeholder="팀명">
			  				</td>
			  				<td style="padding-left: 10px;">
			  					<button class="btn btn-default">중복체크</button>
			  				</td>
			  			</tr>
			  			<tr>
			  				<th>지역</th>
			  				<td>
			  					<select name="gu"></select>
			  				</td>
			  				<th></th>
			  			</tr>
			  			<tr>
			  				<th>모임요일</th>
			  				<td>
				  				<input type="checkbox" name="t_day" /> 월&nbsp;
				  				<input type="checkbox" name="t_day" /> 화&nbsp;
				  				<input type="checkbox" name="t_day" /> 수&nbsp;
				  				<input type="checkbox" name="t_day" /> 목&nbsp;
				  				<input type="checkbox" name="t_day" /> 금&nbsp;
				  				<input type="checkbox" name="t_day" /> 토&nbsp;
				  				<input type="checkbox" name="t_day" /> 일&nbsp;
			  				</td>
			  				<th></th>
			  			</tr>
			  			<tr>
			  				<th>모임시간</th>
			  				<td>
			  					<input type="time" class="form-control" placeholder="모임시간" >
			  				</td>
			  				<th></th>
			  			</tr>
			  			<tr>
							<th>유형</th>
							<td><select name="mch_type"></select></td>
						</tr>
			  			<tr>
							<th>연령대</th>
							<td><select name="mch_age"></select></td>
						</tr>
			  			<tr>
			  				<th>유니폼색</th>
			  				<td>
			  					<input type="text" class="form-control" placeholder="유니폼색">
			  				</td>
			  				<th></th>
			  			</tr>
			  			<tr>
			  				<td colspan="3" style="text-align: center;">
			  				<button type="reset" class="btn btn-default">취소</button>
			        		<button type="submit" class="btn btn-primary">등록</button>
			  				</td>
			  			</tr>
			  		</table>
			  </fieldset>
			</div>
		</div>
		</form>
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
		for (var i=0; i<10; i++) {
			frm['gu'].options[i] = new Option(i+1, i+1);
		}
		
		frm['mch_type'].options[0] = new Option('축구', '축구');
		frm['mch_type'].options[1] = new Option('풋살', '풋살');
		
		var no=0;
		for(var i=1; i<7; i++){
			for(var j=0; j<2; j++){
				var l = i+1;
				if(j<1){
					frm['mch_age'].options[no] = new Option(i+'0대', i+'0대');
				}else{
					frm['mch_age'].options[no] = new Option(i+'0대~'+l+'0대', i+'0대~'+l+'0대');
				}
				no++;
			}
		}
	});
	</script>
</html>