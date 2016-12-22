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
			<table class="table">
				<thead>
					<tr>
						<th>멤버 리스트</th>
					</tr>
					<tr>
						<th>No</th>
						<th>이름</th>
						<th>포지션</th>
						<th>총점</th>
						<th>경기수</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${member}" var="dto" varStatus="status">
					<c:choose>
					<c:when test="${dto.rank==1 && dto.m_tpoint!=0 }">
						<tr id="ace">
							<td>ace</td>
							<td>${dto.m_name}</td>
							<td>${dto.m_position}</td>
							<td>${dto.m_tpoint}</td>
							<td>${dto.m_matchcount}</td>
						</tr>
					</c:when>
					<c:otherwise>
						<tr>
							<td>${status.count}</td>
							<td>${dto.m_name}</td>
							<td>${dto.m_position}</td>
							<td>${dto.m_tpoint}</td>
							<td>${dto.m_matchcount}</td>
						</tr>
					</c:otherwise>
				</c:choose>
				</c:forEach>
				</tbody>
			</table>
		</div>
	</body>
<script>	
</script>
</html>