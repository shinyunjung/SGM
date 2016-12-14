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
			
			.login {
				width: 50px;
				height: 50px;
				text-align: center;
				border: 1px solid;
			}
			
			.login .txt {
				padding-top: 30%
			}
			
			.loginBox{
				border: 1px solid;
				border-collapse: collapse;
				padding: 5px;
			}
			
			.matching{
				background-color: orange;
			}
			
			#board{
				position: absolute;
				left: 170px;
			}
			
			#loginBox{
				position: absolute;
				left:900px;
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
		<!-- 매칭 리스트 -->
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
		
		
	</body>
	<script></script>
</html>