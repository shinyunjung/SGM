<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>장소목록 상세보기</title>
		<script src="https://code.jquery.com/jquery-3.1.0.min.js"></script>
		<script src="resources/bootstrap/js/bootstrap.js"></script>
		<link rel="stylesheet" type="text/css" href="resources/bootstrap/css/bootstrap.css" />
		<style>
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
			.AD{
				width: 250px;
				position: absolute;
				left: 1000px;
				top: 270px;
			}
			.detailTable{
				width: 100%;
			}
			.subject{
				width: 60%;
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
				<div id="title">
					<h3>장소목록</h3>
				</div>
				<div	id="detailZone">
					<table class="detailTable">
						<thead>
							<tr class="borderBottom">
								<td class="subject">제목(불러오기)</td>
								<td class="borderLeft">날짜</td>
								<td class="borderLeft">날짜(불러오기)</td>
								<td class="borderLeft">조회수</td>
								<td class="borderLeft">조회수(불러오기)</td>
							</tr>
						</thead>
						<tbody>
							<tr class="borderBottom">
								<td colspan="5">
									<div class="col-sm-2 borderRight">
										주소 :
									</div>
									<div>
										주소(불러오기)
									</div>
								</td>
							</tr>
							<tr class="borderBottom">
								<td colspan="5">
									<div class="col-sm-4 borderRight">
										사진
									</div>
									<div>
										내용
									</div>
								</td>
							</tr>
							<tr class="borderBottom">
								<td colspan="5">
									지도
								</td>
							</tr>
							<tr class=>
								<td><a>댓글쓰기</a></td>
								<td colspan="4" class="right ">
									<a>수정</a> / <a>삭제</a>
								</td>
							</tr>
						</tbody>
					</table>
					<!-- 댓글 -->
					<div id="replyZone">
						<table id="repleBox" class="borderTop">
							<tr>
								<td class="user">등록자</td>
								<td class="data"><textarea rows="3"></textarea></td>
								<td class="repleBtn"><button id="go">댓글등록</button></td>
							</tr>
						</table>
					</div>
				</div>
				<div style="border: 1px solid" class="AD">
					광고
				</div>
			</div>
		</div>
	</body>
	<script></script>
</html>