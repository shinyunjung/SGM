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
		td,th{
			text-align: right;
			padding-bottom: 10px;
			text-align: center;
			/* border: 1px solid; */
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
			<form action="evaUp" class="form-horizontal" method="post">
			  <fieldset>
			  	<legend><h2>00 VS 00</h2></legend>
			  		<table>
			  			<tr>
				  			<td>
				  				수고하셨습니다. 상대팀에 대한 평가와 함께 경기 결과를 입력해 주세요.
				  			</td>
			  			</tr>
			  			<tr>
			  				<th>00 : 00</th>
			  			</tr>
			  			<tr>
			  				<th>
			  				<span>
			  				<input type="text" name="lteam" size="1" style="text-align: center;"/>  
			  				: <input type="text" name="rteam" size="1" style="text-align: center;"/>
			  				</span>
			  				</th>
			  			</tr>
			  			<tr>
			  				<th>매너</th>
			  			</tr>
			  			<tr>
			  				<td>
			  					<input type="radio" name="ev_manner" value="1"/> 매우나쁨&nbsp;
			  					<input type="radio" name="ev_manner" value="2"/> 나쁨&nbsp;
			  					<input type="radio" name="ev_manner" value="3" checked/> 보통&nbsp;
			  					<input type="radio" name="ev_manner" value="4"/> 좋음&nbsp;
			  					<input type="radio" name="ev_manner" value="5"/> 매우좋음&nbsp;
			  				</td>
			  			</tr>
			  			<tr>
			  				<th>실력</th>
			  			</tr>
			  			<tr>
			  				<td>
			  					<input type="radio" name="ev_level" value="1"/> 매우나쁨&nbsp;
			  					<input type="radio" name="ev_level" value="2"/> 나쁨&nbsp;
			  					<input type="radio" name="ev_level" value="3" checked/> 보통&nbsp;
			  					<input type="radio" name="ev_level" value="4"/> 좋음&nbsp;
			  					<input type="radio" name="ev_level" value="5"/> 매우좋음&nbsp;
			  				</td>
			  			</tr>
			  			<tr>
			  				<th>공격력</th>
			  			</tr>
			  			<tr>
			  				<td>
			  					<input type="radio" name="ev_attk" value="1"/> 매우나쁨&nbsp;
			  					<input type="radio" name="ev_attk" value="2"/> 나쁨&nbsp;
			  					<input type="radio" name="ev_attk" value="3" checked/> 보통&nbsp;
			  					<input type="radio" name="ev_attk" value="4"/> 좋음&nbsp;
			  					<input type="radio" name="ev_attk" value="5"/> 매우좋음&nbsp;
			  				</td>
			  			</tr>
			  			<tr>
			  				<th>수비력</th>
			  			</tr>
			  			<tr>
			  				<td>
			  					<input type="radio" name="ev_defe" value="1"/> 매우나쁨&nbsp;
			  					<input type="radio" name="ev_defe" value="2"/> 나쁨&nbsp;
			  					<input type="radio" name="ev_defe" value="3" checked/> 보통&nbsp;
			  					<input type="radio" name="ev_defe" value="4"/> 좋음&nbsp;
			  					<input type="radio" name="ev_defe" value="5"/> 매우좋음&nbsp;
			  				</td>
			  			</tr>
			  			<tr>
			  				<th>상대팀에게 남기고 싶은 말</th>
			  			</tr>
			  			<tr>
			  				<td>
			  					<input type="text" class="form-control" name="ev_review" />
			  				</td>
			  			</tr>
			  			<tr>
			  				<th colspan="5" style="text-align: center;">
			  				<button type="reset" class="btn btn-default">취소</button>
			        		<button type="submit" class="btn btn-primary">등록</button>
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
</script>
</html>