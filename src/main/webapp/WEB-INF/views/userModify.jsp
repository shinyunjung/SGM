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
			<form action="modify" class="form-horizontal"name="mainForm" id="mainForm" method="post" onSubmit="modifyCheck();return false">
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
			  					${user.u_id}
			  					<input type="hidden" name="u_id" value="${user.u_id}" />
			  				</td>
			  				<th></th>
			  			</tr>
			  			<tr>
			  				<th>비밀번호</th>
			  				<td colspan="3">
			  				<input type="password" name="u_pass" class="form-control" value="" placeholder="비밀번호 변경">
			  				</td>
			  				<th></th>
			  			</tr>
			  			<tr>
			  				<th>비밀번호</th>
			  				<td colspan="3">
			  				<input type="password" name="re_pass" class="form-control" value="" placeholder="변경된 비밀번호 입력">
			  				</td>
			  				<td style="padding-left: 10px;">
			  					<input type="button" class="btn btn-default" id="passCheck" value="확인" />
			  				</td>
			  			</tr>
			  			<tr>
			  				<th>성명</th>
			  				<td colspan="3">
			  				${user.u_name}
			  				</td>
			  				<th></th>
			  			</tr>
			  			<tr>
			  				<th>생년월일</th>
			  				<td colspan="3">
			  					${user.u_age}
			  				</td>
			  				<th></th>
			  			</tr>
			  			<tr>
			  				<th>성별</th>
			  				<td>${user.u_gender}</td>
			  				<th></th>
			  			</tr>
			  			<tr>
			  				<th>핸드폰</th>
			  				<td colspan="3">
			  					<input type="text" name="u_phonNum" class="form-control" value="${user.u_phnum}" >
			  				</td>
			  				<td></td>
			  			</tr>
			  			<tr>
			  				<th>이메일</th>
			  				<td colspan="3">
			  					<input type="email" name="u_email" class="form-control" value="${user.u_mail}" >
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
	var defaultEmail=$("input[type='email']").val();
	console.log(defaultEmail);
	
	/*메일 인증 유무*/
	 var Certification=false;
	 
	 /*인증번호*/
	 var number="";
	 
	 /*비밀번호와 비밀번호재입력 부분의 확인을 위한 변수*/
	 var passCheck=false;
	
	$("#passCheck").click(function(){
		 var pass=$("input[name='u_pass']").val();
		 var rePass=$("input[name='re_pass']").val();
		 if(pass==""){
			 alert("변경하실 비밀번호를 입력해주세요");
			$("input[name='u_pass']").focus();
		 }else{
				 if(pass.length<5){
				alert("비밀번호는 5자 이상입력해야 합니다.");
				$("input[name='u_pass']").focus();
			 }else if(rePass==""){
				 alert("비밀번호 재입력을 입력해주세요");
				 $("input[name='re_pass']").focus();
			 }else if(pass!=rePass){
				 alert("비밀번호가 서로 다릅니다.");
				 $("input[name='re_pass']").focus();
			 }else{
				 alert("비밀번호 확인!");
				 passCheck=true;
			 }
		 }
	 });
	
	
	
	/*******************
	 *비밀번호 입력후 변경됬을 경우
	 ********************/
	 $("input[name='u_pass']").change(function(){
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
	 	
	 	if(email==defaultEmail){
	 		alert("이메일이 변경되지 않았습니다.");
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
	 
	 
	 $("input[name='Certification']").change(function(){
		if(Certification){
			console.log("메일변경");
			Certification=false;
		} 
	 })
	 
	 
	 
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
	  			if(url=="./certification"){
	  				alert(data.msg);
	  				number=data.num;
	  			}
	  		},
	  		error:function(error){
	  			console.log(error);
	  		}
	  	});
	  }


	
	
	
	
	function modifyCheck(){
		console.log(passCheck);
		console.log(document.mainForm.u_pass.value);
		console.log(document.mainForm.u_email.value);
		var con=false;
		if(document.mainForm.u_pass.value!=""){
			if(!passCheck){
				alert("비밀번호 변경확인을 실행해주세요");
				con=false;
			}else{
				con=true;
			}
		}
		
		if(defaultEmail!=$("input[type='email']").val()){
			if(!Certification){
				alert("메일인증을 실행해주세요");
				con=false;
			}else{
				con=true;
			}
		}
		console.log(con);
		if(document.mainForm.u_pass.value=="" && document.mainForm.u_email.value==defaultEmail){
			console.log("성공");
			document.mainForm.submit(); 
			return true;
		}else if(con){
			document.mainForm.submit(); 
			return true;
		}
	}
</script>
</html>