<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.1.0.min.js"></script>
<style>
</style>
</head>
	<body>
		<div class="member">
		----------------------------------------------------------------------------------------------------------------------	
			<table class="table table-hover totalTable">
				<thead>
					<tr>
						<td style="text-align: left;">
							게시물수:
							<select id="pagePerNum"> <!-- onchange="" -->
								<option value="5">5</option>
								<option value="10">10</option>
								<option value="15">15</option>
								<option value="20">20</option>
							</select>
						</td>
						<td style="text-align: right;">
							<input type="text" class="input"/>
							<button onclick="Search()">검색</button>
						</td>
					</tr>
				</thead>
			</table>
			<table class="table">
				<thead>
					<tr>
						<th>팀 일지</th>
					</tr>
					<thead>
					<tr>
						<th>번호</th>					
						<th>제목</th>
						<th>작성자</th>
						<th>작성일</th>
						<th>조회</th>
					</tr>
				</thead>
				<tbody>
					
				</tbody>
			</table>
		</div>
	</body>
<script>	
</script>
</html>