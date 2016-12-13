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
                position: absolute;
                left: 35%;
                top: 23%;
			}
			.pass{
                width: 400px;
				border: 1px solid;
				padding: 10px;
                position: absolute;
                left: 35%;
                top: 30%;
			}
			.login{
                width: 400px;
				border: 1px solid;
                text-align: center;
                background-color: orange;
                color: white;
				padding: 10px;
                position: absolute;
                left: 35%;
                top: 37%;
                font-size: 12pt;
			}
			
			.option{
				width:400px;
				border-top: 1px solid silver;
				text-align: center;
				padding: 10px;
				position: absolute;
				left: 35%;
				top: 42%;
			}
			#logo{
				position:absolute;
				top: 10%;
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
		<div id="logo">
			<jsp:include page="../../resources/include/logo.jsp" />
		</div>
		<div id="loginBox">
			<div class="id">
				<input type="text" size="40" style="border:none" placeholder="아이디"/>
			</div>
			<div class="pass">
				<input type="password" size="40" placeholder="비밀번호"/>
			</div>
			<div class="login">
				로그인
			</div>
		</div>
		<div class="option">
			<a>아이디 찾기</a> | <a>비밀번호 찾기</a> | <a>회원가입</a>
		</div>
	</body>
	<script></script>
</html>