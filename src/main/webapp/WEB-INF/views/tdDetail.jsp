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
									<td class="subject">제목(불러오기)</td>
									<td class="borderLeft">날짜</td>
									<td class="borderLeft">날짜(불러오기)</td>
									<td class="borderLeft">조회수</td>
									<td class="borderLeft">00</td>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td colspan="5">
										내용(불러오기)
									</td>
								</tr>
							</tbody>
						</table>
					</div>
					<div class="recordZone">
						<table class="recordTable">
							<thead>
								<tr>
									<th>기록일지</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td class="recordList">OO</td>
									<td class="recordList">OO</td>
									<td class="recordList">OO</td>
									<td class="recordList">OO</td>
									<td class="recordList">OO</td>
									<td class="recordList">OO</td>
									<td class="recordList">OO</td>
									<td class="recordList">OO</td>
									<td class="recordList">OO</td>
									<td class="recordList">OO</td>
								</tr>
								<tr class="borderTop">
									<td class="left"><a>댓글쓰기</a></td>
									<td colspan="9" class="right ">
										<a>수정</a> / <a>삭제</a>
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
		function open(){
			$(".recordZone").css("display","block");
		}
	</script>
</html>