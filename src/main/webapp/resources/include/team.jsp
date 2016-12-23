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
			#ca{
				padding-top: 20px;
				/* border: 1px solid; */
			}
			
			#Category{
				width: 100%;
				height: 220px;
                margin-top: 20px;
			}
			
		</style>
	</head>
	<body>
		<div id="ca">
			<div class="thumbnail">
				<img src="#" alt="사진" style="width:100%; height: 220px;">
			</div>
			<h4><b>대표
				<c:forEach items="${member}" var="dto" varStatus="status">
					<c:if test="${dto.m_grade=='대표'}">
						${dto.m_name}&nbsp;
					</c:if>
				</c:forEach>
			</b></h4>
        -----------------------------------
			<div id="Category">
				<div class="list-group">
					<a href="#" onclick="member()"  class="list-group-item">팀 멤버</a>
					<a href="#" onclick="tdList(${team.t_idx})" class="list-group-item">팀 일지</a>
					<a href="#" class="list-group-item">팀 수정</a>
					<a href="#" class="list-group-item">팀 탈퇴</a>
				</div>
			</div>
		</div>
	</body>
	<script>
	</script>
</html>