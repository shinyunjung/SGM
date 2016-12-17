<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>로그인 페이지</title>
		<script src="https://code.jquery.com/jquery-3.1.0.min.js"></script>
		<script src="resources/bootstrap/js/bootstrap.js"></script>
		<link rel="stylesheet" type="text/css" href="resources/bootstrap/css/bootstrap.css" />
		<style>
			.title{
				font-size:20px;
			}
			div.wri{
				position:absolute;
				left:270px;
				top:180px;	
				width:80%
				
			}
			.writ{
				width:80%;
				
			}
			input[type='text']{
				width: 100%;
				height:100%;
			}
			#content{
				height:300px;
			}
			div.place{
				position:absolute;
				left:270px;
				width:270px;
				top:620px;
				
			}
	
			#map{
				border:1px solid;
				position:absolute;
				left:270px;
				width:500px;
				height:300px;
				top:690px;
			}
			#butt{
				position:absolute;
				left:270px;
				top:1000px;
				
			}				
			
			table, td{
				border:2px solid;
				text-align:center;
			}
			

		
		</style>
	</head>
	<body>
		<jsp:include page="../../resources/include/logo.jsp" />
		<jsp:include page="../../resources/include/nav.jsp" />
		<div class="wri">
		<h2 class="title">매칭게시판</h2>
			<br/>
			<table class="writ">
				<tr>
					<td>제목</td>
					<td>
						<input type="text"/>
					</td>
				</tr>
				<tr>
					<td>작성자</td>
					<td>
						작성자
					</td>
				</tr>
				<tr>
					<td>내용</td>
					<td id="content">
						<input type="text"/>
					</td>	
				</tr>	
			</table>
		</div>
		<div class="place">
			<table>
				<tr>
					<td>
						<p>경기장 위치</p>
					</td>
				</tr>
				<tr>
					<td>
						<input type="button" value="경기장검색"/>	
					</td>		
					<td>주소란</td>
				</tr>
			</table>	
		</div>
		<div id="map">
			지도란
		</div>
		<div id="butt">
			<button>수정완료</button>
			<button>취소</button>
		</div>
	</body>
	<script></script>
</html>