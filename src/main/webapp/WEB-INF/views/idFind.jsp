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
		.well{
			display: inline-block;
			margin: 140px auto;
		}
		table{
			width: 100%;
		}
		th{
          text-align: right;
          padding-bottom: 10px;
          padding-right: 10px;
          width: 20%;
		}
		td{
		  padding-bottom: 10px;
		   width: 60%;
		}
	    #popup{
	     	position:absolute;
			z-index:2;
			width: 400px;
			height: 150px;
			background-color:#f5f5f5;
			display:none;
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
			  	<legend>아이디 찾기</legend>
			  	<div id="popup">
				<!-- 아이디 -->	
					<br>
					<h5>님의 아이디는 입니다.</h5><br>
					<a href="pwFind">비밀번호 찾기</a><br>
					<a href="login">로그인하러 가기</a>
				</div>
			  		<table>
			  			<tr>
			  				<th>성명</th>
			  				<td>
			  				<input type="text" class="form-control" placeholder="성명" >
			  				</td>
			  				<th></th>
			  			</tr>
			  			<tr>
			  				<th>email</th>
			  				<td>
			  				<input type="email" class="form-control" placeholder="email" >
			  				</td>
			  				<td style="padding-left: 10px;">
			  					<button class="btn btn-default">보내기</button>
			  				</td>
			  			</tr>
			  			<tr>
			  				<th>인증번호</th>
			  				<td>
			  				<input type="text" class="form-control" placeholder="인증번호" >
			  				</td>
			  				<td style="padding-left: 10px;">
			  					<button class="btn btn-primary">확인</button>
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
		$(".btn-primary").click(function(){
			$("#popup").css("display","block");
		});
	</script>
</html>