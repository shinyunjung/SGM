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
			#row{
				padding-bottom: 50px;
			}
			 #emblem{
                border: 1px solid;
				width: 170px;
				height: 220px;
                 margin-bottom: 20px;
			}
			#teamCategory{
				
				width: 170px;
				height: 120px;
                margin-top: 20px;
			}
			.categoryTable{
				width: 100%;
				height: 90%;
				background-color: greenyellow;
				color: blue;
			}
			.fire{
				width: 170px;
				text-align: center;
			}
			td{
				border-bottom: 1px solid silver;
				padding: 3px;
			}
		</style>
	</head>
	<body>
		<div id="row">
			<div id="emblem">
				사진		
			</div>
        -----------------------------------
			<div id="teamCategory">
				<table class="categoryTable">
					<tr>
						<td><a>팀 멤버</a></td>
					</tr>
					<tr>
						<td><a>팀 멤버</a></td>
					</tr>
					<tr>
						<td><a>팀 멤버</a></td>
					</tr>
				</table>
			</div>
			<div class="fire">
				<a>팀 탈퇴</a>
			</div>
		</div>
	</body>
	<script></script>
</html>