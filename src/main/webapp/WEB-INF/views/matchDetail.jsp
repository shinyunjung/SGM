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
			#title{
				width: 270px;
				text-align: right;
			}
			#detailZone{
				width: 700px;
				position: absolute;
				left: 270px;
				top: 270px;
			}
			#replyZone{
				
				width: 700px;
				margin-top: 10px;
			}
			#repleBox{
				
				width: 100%;
				padding: 10px;
			}
			#go{
				height: 50px;
			}
			.detailTable{
				width: 100%;
			}
			.subject{
				width: 500px;
			}
			.right{
				text-align: right;
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
			thead{
				border-bottom: 1px solid;
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
		<div id="page">
			<div id="title">
				<h3>매칭 게시판</h3>
			</div>
			<div id="detailZone">
				<table class="detailTable">
					<thead>
						<tr>
							<td class="subject">제목(불러오기)</td>
							<td class="borderLeft">날짜</td>
							<td class="borderLeft">날짜(불러오기)</td>
							<td class="borderLeft">조회수</td>
							<td class="borderLeft">조회수(불러오기)</td>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td colspan="5">
								내용(불러오기)
							</td>
						</tr>
						<tr>
							<td colspan="5" class="right">
								<button>매칭 신청</button>
							</td>
						</tr>
						<tr class="borderTop">
							<td colspan="3" class="borderRight">
								지도(불러오기)<br/>
								주소
							</td>
							<td colspan="2" class="borderLeft">
								광고 배너 공간
							</td>
						</tr>
						<tr class="borderTop">
							<td><a>댓글쓰기</a></td>
							<td colspan="4" class="right ">
								<a>수정</a> / <a>삭제</a>
							</td>
						</tr>
					</tbody>
				</table>
				<!-- 댓글 -->
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
	</body>
	<script></script>
</html>