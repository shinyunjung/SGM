<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>회원관리 페이지</title>
		<script src="https://code.jquery.com/jquery-3.1.0.min.js"></script>
		<script src="resources/bootstrap/js/bootstrap.js"></script>
		<link rel="stylesheet" type="text/css" href="resources/bootstrap/css/bootstrap.css" />
		<style>
			#usManager{
				position: absolute;
				left: 270px;
				top: 300px;
			}
			#managerCategori{
				position:absolute;
				left: 100px;
				top: 280px;
			}
			#title{
				text-align: center;
				
			}
			#search{
				width: 970px;
				text-align: right;
			}
			.usTable{
				width: 700px;
				text-align: center;
				border-bottom: 1px solid silver;
			}
			th{
				text-align: center;
			}
		</style>
	</head>
	<body>
		<jsp:include page="../../resources/include/logo.jsp" />
		<jsp:include page="../../resources/include/nav.jsp" />
		<div id="title">
			<h1><b>회원관리</b></h1>
		</div>
		<div id="search">
			<button>검색</button>
			<input type="text" />
		</div>
		<div id="managerCategori">
			<jsp:include page="../../resources/include/manager.jsp" />
		</div>
		<div id="usManager">
			<table class="table table-hover usTable">
				<thead>
					<tr>
						<th>NO</th>
						<th>아이디</th>
						<th>성명</th>
						<th>생년월일</th>
						<th>성별</th>
						<th>번호</th>
						<th>이메일</th>
						<th>탈퇴</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>0</td>
						<td>OOO</td>
						<td>OOOOO</td>
						<td>0</td>
						<td>0</td>
						<td>OOO</td>
						<td>OOOOO</td>
						<td>0</td>
					</tr>
				</tbody>
			</table>
		</div>
	</body>
	<script></script>
</html>