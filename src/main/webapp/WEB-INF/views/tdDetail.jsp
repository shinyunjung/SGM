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
			.team{
				padding-left: 5%;
			}
			.subject{
				width: 50%;
			}
			.recordTable{
				width: 100%;
			}
			.recordList{
				
				border: 1px solid black;
				border-collapse: collapse;
			}
			.user{
				text-align: center;
				
				width: 10%;
			}
			.data{
				width: 80%;
				padding: 10px;
			}
			.repleBtn{
				margin: 5px;
			}
			#replyZone{
				
				width: 100%;
				margin-top: 10px;
			}
			#repleBox{
				
				width: 100%;
				padding: 10px;
			}
			textarea{
				width: 100%;
				resize: none;
			}
			.recordZone{
				position: relative;
				display: block;
			}
			#content{
				width: 100%;
				min-height: 300px;
				font-size: 14px;
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
						<legend>팀 일지</legend>
					</fieldset>
					<div class="team">
						<jsp:include page="../../resources/include/team.jsp" />
					</div>
				</div>
				
				<!-- 두 번째 구역 -->
				<div class="col5 content">
					<div id="detailZone">
						<table class="table">
							<thead>
								<tr>
								 	<th>글 번호</th>
								</tr>
								<tr>
									<td colspan="6" class="subject">${td.j_title}</td>
								</tr>
								<tr>
									<td class="subject">작성자</td>
									<td class="subject">${td.j_name}</td>
									<td class="borderLeft">날짜</td>
									<td class="borderLeft">${td.j_date}</td>
									<td class="borderLeft">조회수</td>
									<td class="borderLeft">${td.j_vcount}</td>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td colspan="6">
										<div id="content">${td.j_content}</div>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
					<div class="recordZone">
						<table class="recordTable">
							<thead>
								<tr>
									<th>개인기록</th>
								</tr>
								<tr>
									<th style="width:15%">이름</th>
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
								<c:forEach items="${record}" var="rec">
									<c:if test="${rec.m_name!=null}">
										<tr class='borderTop'>
											<td>${rec.m_name}</td>
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
								<tr class="borderTop">
									<td class="left"><a>댓글쓰기</a></td>
									<td colspan="10" class="right ">
										<a href="./tdModify?idx=${td.totalIdx}&t_idx=${team.t_idx}">수정</a> / <a href="./delete?idx=${td.totalIdx}&t_idx=${team.t_idx}">삭제</a>
									</td>
								</tr>
							</tbody>
						</table>
						<div id="replyZone">
							<table id="repleBox">
							<tr>
								<td class="user">등록자</td>
								<td class="data"><textarea rows="3"></textarea></td>
								<td class="repleBtn"><button id="go">댓글등록</button></td>
							</tr>
						</table>
					</div>
					</div>
				</div>
				
				<!-- 세 번째 구역 -->
				<div class="col3 content">
					
				</div>
			</div>
		</div>
	</body>
	<script>
	start();
	function start(){
		/* if("${record}"=="[]"){
			$(".recordZone").css("display","none");
		} */
		var path = "../../main/resources/upload/";
		for(var i=0; i<3; i++){
			var src = ["${file[0].f_newfilename}","${file[1].f_newfilename}","${file[2].f_newfilename}"];
			if(src[i]!=""){
			$("#file"+(i+1)).attr("src",path+src[i]);
				var ss = $("#file"+(i+1)).attr("src");
				console.log("d");
				console.log(src);
				console.log(ss);
			}
		}
	}
	</script>
</html>