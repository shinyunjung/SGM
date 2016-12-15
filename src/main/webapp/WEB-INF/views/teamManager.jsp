<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>팀관리 페이지</title>
		<script src="https://code.jquery.com/jquery-3.1.0.min.js"></script>
		<script src="resources/bootstrap/js/bootstrap.js"></script>
		<link rel="stylesheet" type="text/css" href="resources/bootstrap/css/bootstrap.css" />
		<style>
			th{
				text-align: center;
			}
		</style>
	</head>
	<body>
		<jsp:include page="../../resources/include/logo.jsp" />
		<jsp:include page="../../resources/include/nav.jsp" />
		<div class="layer">
			<div class="page">
				
				<!-- 첫 번째 구역 -->
					<fieldset>
						<legend>팀 정보</legend>
					</fieldset>
					<div id="searchManager">
						<button>검색</button>
						<input type="text" />
					</div>
					<div id="managerCategori">
						<jsp:include page="../../resources/include/manager.jsp" />
					</div>
					<div id="Manager">
						<table class="table table-hover totalTable">
							<thead>
								<tr>
									<th>NO</th>
									<th>팀명</th>
									<th>지역</th>
									<th>대표</th>
									<th>성명</th>
									<th>번호</th>
									<th>이메일</th>
									<th>해체</th>
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
			</div>
		</div>
	</body>
	<script></script>
</html>