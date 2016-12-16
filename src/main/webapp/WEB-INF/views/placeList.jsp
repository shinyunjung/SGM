<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>장소목록 게시판</title>
		<script src="https://code.jquery.com/jquery-3.1.0.min.js"></script>
		<script src="resources/bootstrap/js/bootstrap.js"></script>
		<link rel="stylesheet" type="text/css" href="resources/bootstrap/css/bootstrap.css" />
		<style>
			.map{
				margin-bottom: 2%;
			}
			.manager{
				margin-left: 10%;
			}
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
				<div class="col2 content">
					<fieldset>
						<legend>장소목록</legend>
					</fieldset>
					<div class="manager">
						<jsp:include page="../../resources/include/manager.jsp" />
					</div>
				</div>
				
				<!-- 두 번째 구역 -->
				<div class="col5 content">
					<div class="center map borderBottom">
						지도	
					</div>
					<div class="center">
						<select>
							<option value="1">OO구</option>
						</select>
						<input type="text" size="40" />
						<button>검색</button>
					</div>
					<div class="placeList">
						<table class="table table-hover totalTable">
							<thead>
								<tr>
									<th>사진</th>
									<th class="center">제목</th>
									<th class="center">날짜</th>
									<th>비교</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>사진</td>
									<td>제목</td>
									<td>날짜</td>
									<td>비교</td>
								</tr>
							</tbody>
						</table>
						<div class="left">
							<button>장소추가</button>
						</div>
					</div>
				</div>	
				
				<!-- 세 번째 구역 -->
				<div class="col3 content">
				
				</div>
			</div>
		</div>				
	</body>
	<script></script>
</html>