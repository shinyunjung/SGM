<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Insert title here</title>
		<script src="https://code.jquery.com/jquery-3.1.0.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
		<style>
			.recordTable{
				width: 100%;
			}
			td,th{
				width: 6%;
				height: 40px;
				text-align: center;
			}
			.recordZone{
				min-height: 800px;
			}
		</style>
	</head>
	<body>
		<jsp:include page="../../resources/include/logo.jsp" />
		<jsp:include page="../../resources/include/loginBox.jsp" />
		<jsp:include page="../../resources/include/nav.jsp" />
		<div class="layer">
			<div class="page">
				
				<!-- 첫 번째 구역 -->
				<div class="col2 content">
					<fieldset>
						<legend>개인기록</legend>
					</fieldset>
					<div class="team">
						<jsp:include page="../../resources/include/team.jsp" />
					</div>
				</div>
				
				<!-- 두 번째 구역 -->
				<div class="col5 content">
					<div class="recordZone">
						<table class="recordTable center">
							<thead>
								<tr>
									<th colspan="11"><h4>${detail[0].m_name}</h4></th>
					            </tr>
					            <c:set var="goal" value="0"/>
								<c:set var="assist" value="0"/>
								<c:set var="shoot" value="0"/>
								<c:set var="poul" value="0"/>
								<c:set var="warning" value="0"/>
								<c:set var="off" value="0"/>
								<c:set var="ck" value="0"/>
								<c:set var="pk" value="0"/>
								<c:set var="offside" value="0"/>
								<c:set var="effectshot" value="0"/>
								<c:forEach items="${detail}" var="rec">
									<c:set var="goal" value="${sum+rec.p_goal}"/>
									<c:set var="assist" value="${sum+rec.p_assist}"/>
									<c:set var="shoot" value="${sum+rec.p_shoot}"/>
									<c:set var="poul" value="${sum+rec.p_poul}"/>
									<c:set var="warning" value="${sum+rec.p_warning}"/>
									<c:set var="off" value="${sum+rec.p_off}"/>
									<c:set var="ck" value="${sum+rec.p_ck}"/>
									<c:set var="pk" value="${sum+rec.p_pk}"/>
									<c:set var="offside" value="${sum+rec.p_offside}"/>
									<c:set var="effectshot" value="${sum+rec.p_effectshot}"/>
								</c:forEach>
										<tr class='borderTop'>
								            <th>합계</th>
											<td>${goal}</td>
											<td>${assist}</td>
								            <td>${shoot}</td>
								            <td>${poul}</td>
								            <td>${warning}</td>
								            <td>${off}</td>
								            <td>${ck}</td>
								            <td>${pk}</td>
								            <td>${offside}</td>
								            <td>${effectshot}</td>
							            </tr>
								<tr class='borderTop'>
					                <th style="width:15%">경기일</th>
									<th>득점</th>
					                <th>도움</th>
					                <th>슈팅</th>
					                <th>파울</th>
					                <th>경고</th>
					                <th>퇴장</th>
					                <th>코너킥</th>
					                <th>패널티 킥</th>
					                <th>오프 사이드</th>
					                <th>유효 슈팅</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${detail}" var="rec">
									<c:if test="${rec.m_name!=null}">
										<tr class='borderTop'>
								            <td>${rec.p_date}</td>
											<td>${rec.p_goal}</td>
								            <td>${rec.p_assist}</td>
								            <td>${rec.p_shoot}</td>
								            <td>${rec.p_poul}</td>
								            <td>${rec.p_warning}</td>
								            <td>${rec.p_off}</td>
								            <td>${rec.p_ck}</td>
								            <td>${rec.p_pk}</td>
								            <td>${rec.p_offside}</td>
								            <td>${rec.p_effectshot}</td>
							            </tr>
									</c:if>
									<c:if test="${rec.m_name==null}">
										<tr>
											<td colspan="11">개인기록이 없습니다.</td>
										</tr>
									</c:if>
								</c:forEach>
								</tbody>
							</table>
						</div>
				</div>
				<!-- 세 번째 구역 -->
				<div class="col3 content">
					
				</div>
			</div>
		</div>
		<jsp:include page="../../resources/include/footer.jsp" />
	</body>
	<script>
	start();
	function start(){
		var tt ="${detail[0].m_name}";
		console.log("t");
		console.log(tt);
	} 
	</script>
</html>