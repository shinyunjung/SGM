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
			  	<legend>비밀번호 찾기</legend>
			  	<div id="popup">
				<!-- 아이디 -->	
				</div>
			  		<table>
			  			<tr>
			  				<th></th>
			  				<td>
			  				<input type="text" id="id" class="form-control" placeholder="아이디" >
			  				</td>
			  				<th></th>
			  			</tr>
			  			<tr>
			  				<th>email</th>
			  				<td>
			  				<input type="email" id="mail" class="form-control" placeholder="email" >
			  				</td>
			  				<td style="padding-left: 10px;">
			  					<input type="button" class="btn btn-default" id="Certification" onclick="mailFind()" value="보내기" />
			  				</td>
			  			</tr>
			  			<tr>
			  				<th>인증번호</th>
			  				<td>
			  				<input type="text" class="form-control" name="Certification" placeholder="인증번호" >
			  				</td>
			  				<td style="padding-left: 10px;">
			  					<button class="btn btn-primary" onclick="numberCheck()">확인</button>
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
	
	 /*비밀번호*/
	 var userPass="";
	 
	 
	 
	 var userMail="";
	 /***********************
	  * 인증 번호 보내기
	  ***********************/
	 function mailFind(){
	 	var email=$("input[type='email']").val();
	 	var id=$("#id").val();
	 	var url="./mailFind";
	 	var data={};
	 	if(id==""){
	 		alert("ID를 입력해주세요");
	 	}else{
	 		data.find=id;
	 		if(email==""){
		 		alert("이메일을 입력해주세요");
		 	}else{
		 		data.mail=email;
		 		data.type="id";
		 		reqServer(url, data);
		 	}
	 	}
	 	
	 }
	 
	 function send(mail){
			var url="./certification";
			var data={};
			data.mail=mail;
			reqServer(url, data);
	 }
	 


	 /**********
	  * 인증번호 확인
	  **********/

	  function numberCheck(){
	 	var num=$("input[name='Certification']").val();
	 	var url="./certificationCheck";
		var data={};
		data.num=num;
		console.log(num);
		reqServer(url, data);
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
	 			if(url=="./mailFind"){
	 				if(data.msg=="Y"){
	 					send(data.mail);
	 					userPass=data.userPass;
	 				}else{
	 					alert("이름과 메일이 알맞지 않습니다.");
	 				}
	 			}else if(url=="./certification"){
	 				alert(data.msg);
	 			}else if(url=="./certificationCheck"){
					if(data.result=="Y"){
						alert("인증번호를 확인했습니다.");
						Certification=true;
					}else{
						alert("번호가 올바르지 않습니다.");
						Certification=false;
					}
	 			}
	 		},
	 		error:function(error){
	 			console.log(error);
	 		}
	 	});
	 }
	 
	 
	 function printAnswer(){
		 var content="";
		 content+="<h5>당신의 비밀번호는 <b>"+userPass+"</b> 입니다.</h5><br/>";
		 content+="<a href='idFind'>아이디 찾기</a>/"+
			"<a href='loginPage'>로그인하러 가기</a>";
		$("#popup").empty();
		$("#popup").append(content);
		$("#popup").css("display", "block");
	 }
	
	</script>
</html>