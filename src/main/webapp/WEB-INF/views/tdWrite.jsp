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
			.title{
				font-size:20px;
			}
			div.wri{
				position:absolute;
				left:270px;
				top:180px;	
				width:80%;
				
			}
			.td{
				text-align: center;
			}
			.writ{
				width:80%;
				
			}
			input[type='text']{
				width: 100%;
				height:100%;
			}
			#content{
				height:300px;
			}			
			
			table, td{
				border:2px solid black;
			}
			
			.btn{
				position: absolute;
				left: 350px;
			}
		
		</style>
	</head>
	<body>
		<jsp:include page="../../resources/include/logo.jsp" />
		<jsp:include page="../../resources/include/nav.jsp" />
		<jsp:include page="../../resources/include/team.jsp" />
		<div class="wri">
		<form action="write" method="post" enctype="multipart/form-data">
		<h2 class="title">팀일지</h2>
		<br/>
			<table class="writ">
				<tr>
					<td class="td">제목</td>
					<td>
						<input type="text"/>
					</td>
				</tr>
				<tr>
					<td class="td">작성자</td>
					<td>
						 작성자
					</td>
				</tr>
				<tr>
					<td class="td">내용</td>
					<td id="content">
						<input type="text"/>
					</td>	
				</tr>
				<tr>
					<td class="td">파일</td>
					<td>
						<input type="button" value="파일첨부"/>
					</td>
				</tr>
			</table>
				<br/>
				<div class="btn">
						<input type="submit" name="join" value="등록"/>
						<input type="button" onclick="location.href='./'" value="취소"/>
				</div>
			</form>
		</div>
	</body>
	<script></script>
</html>