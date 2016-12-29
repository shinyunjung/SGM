<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>로그인 페이지</title>
		<script src="https://code.jquery.com/jquery-3.1.0.min.js"></script>
		<script src="resources/bootstrap/js/bootstrap.js"></script>
		<link rel="stylesheet" type="text/css" href="resources/bootstrap/css/bootstrap.css" />
		<style>
			.id{
                width: 400px;
				border: 1px solid;
				padding: 10px;
               	/* margin-top: 10%; */
			}
			.pass{
                width: 400px;
				border: 1px solid;
				padding: 10px;
              	margin-top: 5%;
			}
			.login{
                width: 400px;
				border: 1px solid;
                text-align: center;
                background-color: orange;
                color: white;
				padding: 10px;
                font-size: 12pt;
                margin-top: 5%;
			}
			
			.loginBox{
				display: inline-block;
				margin: 0 auto;
			}
			
			.option{
				width:400px;
				border-top: 1px solid silver;
				text-align: center;
				margin-top: 5%;
			}
			.logo{
				 margin-top: 5%; 
			}
			input{
				border: none;
				font-size: 12pt;
			}
			a{
				cursor: pointer;
				font-size: 9pt;
			}
		</style>
	</head>
	<body>
		<div class="logo">
			<jsp:include page="../../resources/include/logo.jsp" />
		</div>
		<div class="layer">
			<div class="page">
				<!-- 첫 번째 구역 -->	
				<div class="col2 content">
				</div>
				
				<!-- 두 번째 구역 -->
				<div class="col5 content">
					<div class="loginBox">
						<form action="login" method="post" name="login">
							<div class="id">
								<input type="text" name="u_id" size="40" style="border:none" placeholder="아이디"/>
							</div>
							<div class="pass">
								<input type="password" name="u_pass" size="40" placeholder="비밀번호"/>
							</div>
							<div class="login" onclick="loginCheck()">
								로그인
							</div>
						</form>	
						<div class="option">
							<a href="./idFind">아이디 찾기</a> | <a href="./passFind">비밀번호 찾기</a> | <a href="./joinForm">회원가입</a>
						</div>
					</div>
				</div>	
			</div>
		</div>	
	</body>
	<script>
	function loginCheck(){
		if(document.login.u_id.value==""){
			alert("아이디를 입력해주세요");
			return false;
		}else if(document.login.u_pass.value==""){
			alert("비밀번호를 입력해주세요");
			return false;
		}else{
			document.login.submit(); 
			return true; 
		}
	}
	
	
	</script>
</html>