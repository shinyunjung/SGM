<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>메인 페이지</title>
		<script src="https://code.jquery.com/jquery-3.1.0.min.js"></script>
		<script src="resources/bootstrap/js/bootstrap.js"></script>
		<link rel="stylesheet" type="text/css" href="resources/bootstrap/css/bootstrap.css" />
		<style>
			.table{
				width: 700px;
				text-align: center;
				border-bottom: 1px solid silver;
			}
			
			
			
		
			.matching{
				background-color: orange;
			}
			
			#board{
				position: absolute;
				left: 170px;
			}
			#send{
				position: absolute;
				left: 170px;
				top: 500px;
				size: 50%;
              
			}
			
						
			
			a{
				cursor:pointer;
			}
			
			th{
				text-align: center;
				background-color: silver;
			}
			ar{
				text-align: center;
				background-color: silver;
				
			}
	
		</style>
	</head>
	<body>
		<jsp:include page="../../resources/include/logo.jsp" />
		<jsp:include page="../../resources/include/nav.jsp" />
		<!-- 쪽지함 -->
		<div id="board">
			<table class="table table-hover">
				<thead>
					<tr class="matching">
						<td colspan="7">
							<h4><b>쪽지함</b></h4>
						</td>
					</tr>
					<tr>
						<th>No</th>
						<th class="center">제목</th>
						<th class="center">보낸이</th>
						<th>팀명</th>
						<th>날짜</th>
						<th>수락/거절</th>
						<th>삭제</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td> 1 </td>
						<td class="center">12/20일에 축구하실 건가요?</td>
						<td class="center">왼발의마법</td>
						<td>아나즈미</td>
						<td>12/14</td>
						<td>
							<div id="ar">
       						  <button>수락</button>
        					  <button>거절</button>
      						</div>
						 </td>
						<td>삭제</td>
					</tr>
					
				</tbody>
			</table>
		</div>
		
		<!-- 쪽지보내기 -->
		<div id="send">
			<table class="table table-hover">
				<thead>
					<tr class="matching">
						<td colspan="4">
							<h4><b>쪽지보내기</b></h4>
						</td>
					</tr>
					<tr>
						<th>보낸이</th>
						<th></th>
						<th>팀명</th>
						<th></th>
					
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>받는이</td>
						<td></td>
						<td>팀명</td>
						<td></td>
					</tr>
					<tr>
						<td>지역</td>
						<td></td>
						<td>운동장</td>
						<td></td>
					</tr>
					<tr>
						<td>날짜</td>
						<td></td>
						<td>시간</td>
						<td></td>
					</tr>
					<tr>
						<td>내용</td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
					<td>
							<div id="ar">
       						  <button>보내기</button>
        					  <button>취소</button>
      						</div>
						 </td>
				</tbody>
			</table>
		</div>
		
		
	</body>
	<script></script>
</html>