<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<html>
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>회원정보 수정</title>
	
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
          height: 36px;
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
			  	<legend>회원정보 수정</legend>
			  		<table>
			  			<tr>
				  			<td colspan="5" style="text-align: center;">
				  				이메일 변경시에는 인증을 하셔야 등록이 가능합니다.
				  			</td>
			  			</tr>
			  			<tr>
			  				<th>아이디</th>
			  				<td colspan="3">
			  				000
			  				</td>
			  				<th></th>
			  			</tr>
			  			<tr>
			  				<th>비밀번호</th>
			  				<td colspan="3">
			  				<input type="password" class="form-control" value="">
			  				</td>
			  				<th></th>
			  			</tr>
			  			<tr>
			  				<th>비밀번호</th>
			  				<td colspan="3">
			  				<input type="password" class="form-control" value="">
			  				</td>
			  				<th></th>
			  			</tr>
			  			<tr>
			  				<th>성명</th>
			  				<td colspan="3">
			  				000
			  				</td>
			  				<th></th>
			  			</tr>
			  			<tr>
			  				<th>생년월일</th>
			  				<td colspan="3">
			  					0000년00월00일
			  				</td>
			  				<th></th>
			  			</tr>
			  			<tr>
			  				<th>성별</th>
			  				<td>남자</td>
			  				<td></td>
			  				<td></td>
			  				<th></th>
			  			</tr>
			  			<tr>
			  				<th>핸드폰</th>
			  				<td colspan="3">
			  					<input type="text" class="form-control" value="" >
			  				</td>
			  				<td></td>
			  			</tr>
			  			<tr>
			  				<th>이메일</th>
			  				<td colspan="3">
			  					<input type="email" class="form-control" value="" >
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
				  				<button class="btn btn-default">취소</button><!-- 마이페이지로 돌아가기 -->
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

</script>
</html>