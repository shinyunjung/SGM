<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Insert title here</title>
		<script src="https://code.jquery.com/jquery-3.1.0.min.js"></script>
		<script src="../../main/resources/bootstrap/js/bootstrap.js"></script>
		<link rel="stylesheet" type="text/css" href="../../main/resources/bootstrap/css/bootstrap.css" />
		<style>
			.detailTable{
				width: 100%;
			}
			.subject{
				width: 40%;
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
									<td class="subject left">제목</td>
									<td class="subject left">${content.j_title}</td>
									<td class="borderLeft">날짜</td>
									<td class="borderLeft">${content.j_date}</td>
									<td class="borderLeft">조회수</td>
									<td class="borderLeft">${content.j_vcount}</td>
								</tr>
							</thead>
							<tbody class="borderTop">
								<tr>
									<td colspan="5" >
										${content.j_content}
									</td>
								</tr>
								<tr class="borderTop">
									<td colspan="4" class="right ">
										<input type="button" onclick="location.href='./freeList'" value="돌아가기"/>
										<input type="button" onclick="location.href='./freeModify?j_idx=${content.j_idx}'" value="수정하기"/>
										<input type="button" onclick="del()" value="삭제"/>
									</td>
								</tr>
							</tbody>
						</table>
						<!-- 댓글 -->
						
					</div>
				</div>
				
				<!-- 세 번째 구역 -->
				<div class="col3 content">
					
				</div>
			</div>
		</div>
	</body>
	<script>

	</script>
</html>