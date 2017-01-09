<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Insert title here</title>
		<script src="https://code.jquery.com/jquery-3.1.0.min.js"></script>
		<style>
			#ca{
				padding-top: 10px;
				/* border: 1px solid; */
			}
			.thumbnail{
				width: 190px;
				height: 220px;
	            margin-left: 10px;
	            margin-bottom: 10px; 
			}
			#file{
				width:100%; 
				height: 100%;
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
				<img src="../../main/resources/upload/${team.t_newPicture}" onerror="this.src='../../main/resources/include/img/default1.png'" style="width:100%; height: 210px;"/>
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
					<a href="../team/teamDetail?t_idx=${team.t_idx}" class="list-group-item">팀 멤버</a>
					<a href="../td/tdList?t_idx=${team.t_idx}" class="list-group-item">팀 일지</a>
					<a href="../team/teamModify?t_idx=${team.t_idx}" class="list-group-item">팀 수정</a>
					<a href="../team/Delete?t_idx=${team.t_idx}" class="list-group-item">팀 탈퇴</a>
				</div>
			</div>
		</div>
	</body>
	<script>
	</script>
</html>