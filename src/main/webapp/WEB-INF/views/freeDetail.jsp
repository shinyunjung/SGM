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
			.detailTable{
				width: 100%;
			}
			.subject{
				width: 55%;
			}
			.user{
				text-align: center;
				
				width: 10%;
			}
			.data{
				width: 82%;
				padding: 10px;
			}
			.repleBtn{
				margin: 5px;
				width: 8%;
			}
			#replyZone{
				
				width: 100%;
				margin-top: 10px;
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
						<legend>자유 게시판</legend>
					</fieldset>
				</div>
				
				<!-- 두 번째 구역 -->
				<div class="col5 content">
					<div class="detailZone">
						<table class="detailTable">
							<thead>
								<tr>
									<td class="subject left">제목(불러오기)</td>
									<td class="borderLeft">날짜</td>
									<td class="borderLeft">날짜(불러오기)</td>
									<td class="borderLeft">조회수</td>
									<td class="borderLeft">0</td>
								</tr>
							</thead>
							<tbody class="borderTop">
								<tr>
									<td colspan="5">
										내용(불러오기)
									</td>
								</tr>
								<tr class="borderTop">
									<td class="left"><a>댓글쓰기</a></td>
									<td colspan="4" class="right ">
										<a>수정</a> / <a>삭제</a>
									</td>
								</tr>
							</tbody>
						</table>
						<!-- 댓글 -->
						<div id="replyZone">
							<table id="repleBox">
								<tr class="borderTop">
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
	<script></script>
</html>