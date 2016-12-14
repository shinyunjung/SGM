<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Insert title here</title>
		<script src="https://code.jquery.com/jquery-3.1.0.min.js"></script>
		<style>
			#Category{
				width: 150px;
				height: 220px;
                margin-top: 20px;
			}
			.categoriTable{
				background-color: greenyellow;
				color: blue;
				text-align: center;
			}
		</style>
	</head>
	<body>
		<div id="Category">
				<table class="table categoriTable">
					<tr>
						<td><a>회원관리</a></td>
					</tr>
					<tr>
						<td><a>팀관리</a></td>
					</tr>
					<tr>
						<td><a>장소목록</a></td>
					</tr>
					<tr>
						<td><a>광고</a></td>
					</tr>
				</table>
			</div>
	</body>
	<script></script>
</html>