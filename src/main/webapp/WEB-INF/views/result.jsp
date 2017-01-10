<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<html>
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>회원가입</title>
	
	<script src="https://code.jquery.com/jquery-3.1.0.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
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
			  	<legend><h2>${result.mch_name} VS ${result.mch_state} </h2></legend>
			  		<table>
			  			<tr>
				  			<td>
				  				수고하셨습니다. 상대팀에 대한 평가와 함께 경기 결과를 입력해 주세요.
				  			</td>
			  			</tr>
			  			<tr>
			  				<th>${result.mch_name}  : ${result.mch_state} </th>
			  			</tr>
			  			<tr>
			  				<th>
			  				<span>
			  				<input type="text" name="lteam" size="1" style="text-align: center;"/>  
			  				: <input type="text" name="rteam" size="1" style="text-align: center;"/>
			  				</span>
			  				<c:if test="${result.mch_idx}==${t_idx.t_idx}">
			  				<input type="hidden" name="ev_name" value="${result.mch_name}"/>
			  				</c:if>
			  				<c:if test="${result.mch_idx}!=${t_idx.t_idx}">
			  				<input type="hidden" name="ev_name" value="${result.mch_state}"/>
			  				</c:if>
			  				<input type="hidden" name="eva" value="${t_idx.e_mail}"/>
			  				</th>
			  			</tr>
			  			<tbody id="evalue">
			  			<tr>
			  				<th>매너</th>
			  			</tr>
			  			<tr>
			  				<td>
			  					<input type="radio" name="ev_manner" value="2"/> 매우나쁨&nbsp;
			  					<input type="radio" name="ev_manner" value="4"/> 나쁨&nbsp;
			  					<input type="radio" name="ev_manner" value="6" checked/> 보통&nbsp;
			  					<input type="radio" name="ev_manner" value="8"/> 좋음&nbsp;
			  					<input type="radio" name="ev_manner" value="10"/> 매우좋음&nbsp;
			  				</td>
			  			</tr>
			  			<tr>
			  				<th>실력</th>
			  			</tr>
			  			<tr>
			  				<td>
			  					<input type="radio" name="ev_level" value="2"/> 매우나쁨&nbsp;
			  					<input type="radio" name="ev_level" value="4"/> 나쁨&nbsp;
			  					<input type="radio" name="ev_level" value="6" checked/> 보통&nbsp;
			  					<input type="radio" name="ev_level" value="8"/> 좋음&nbsp;
			  					<input type="radio" name="ev_level" value="10"/> 매우좋음&nbsp;
			  				</td>
			  			</tr>
			  			<tr>
			  				<th>공격력</th>
			  			</tr>
			  			<tr>
			  				<td>
			  					<input type="radio" name="ev_attk" value="2"/> 매우나쁨&nbsp;
			  					<input type="radio" name="ev_attk" value="4"/> 나쁨&nbsp;
			  					<input type="radio" name="ev_attk" value="6" checked/> 보통&nbsp;
			  					<input type="radio" name="ev_attk" value="8"/> 좋음&nbsp;
			  					<input type="radio" name="ev_attk" value="10"/> 매우좋음&nbsp;
			  				</td>
			  			</tr>
			  			<tr>
			  				<th>수비력</th>
			  			</tr>
			  			<tr>
			  				<td>
			  					<input type="radio" name="ev_defe" value="2"/> 매우나쁨&nbsp;
			  					<input type="radio" name="ev_defe" value="4"/> 나쁨&nbsp;
			  					<input type="radio" name="ev_defe" value="6" checked/> 보통&nbsp;
			  					<input type="radio" name="ev_defe" value="8"/> 좋음&nbsp;
			  					<input type="radio" name="ev_defe" value="10"/> 매우좋음&nbsp;
			  				</td>
			  			</tr>
			  			<tr>
			  				<th colspan="5" style="text-align: center;">
			  				<button type="reset" class="btn btn-default">취소</button>
			        		<button type="submit" class="btn btn-primary">등록</button>
			  				</th>
			  			</tr>
			  			</tbody>
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
	if("${t_idx.e_mail}"!=0){
		$("#evalue").empty();
	}
});
</script>
</html>