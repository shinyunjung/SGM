<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Insert title here</title>
		<script src="https://code.jquery.com/jquery-3.1.0.min.js"></script>
		<script src="resources/bootstrap/js/bootstrap.js"></script>
		<link rel="stylesheet" type="text/css" href="resources/bootstrap/css/bootstrap.css" />
		<style>
			#teamList{
				width:100%;
				text-align: center;
			}
			#search{
				width: 100%;
				text-align: right;
				margin-bottom: 10px;
			}
			.table{
				
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
		<div id="search">
			<button>검색</button>
			<input type="text" />
		</div>
		<div id="teamList">
			<table class="table table-hover">
				<thead>
					<tr>
						<th>랭킹</th>
						<th>팀</th>
						<th>경기 수</th>
						<th>승점</th>
						<th>승</th>
						<th>무</th>
						<th>패</th>
						<th>득점</th>
						<th>실점</th>
						<th>득점차</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>0</td>
						<td>OOO</td>
						<td>0</td>
						<td>0</td>
						<td>0</td>
						<td>0</td>
						<td>0</td>
						<td>0</td>
						<td>0</td>
						<td>0</td>
					</tr>
				</tbody>
			</table>
		</div>
		
	</body>
	<script></script>
</html>