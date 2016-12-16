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
			.img{
               border: 1px solid; 
				width: 170px;
				height: 220px;
                margin-left: 10px;
                margin-bottom: 10px; 
			}
			.emblem{
				
			}
			.infoTable{
				border: 1px solid;
				border-collapse: collapse;
			}
			input[type='text']{
				width: 100%;
			}
			table{
				width: 100%;
			}
			
		</style>
	</head>
	<body>
		<jsp:include page="../../resources/include/logo.jsp" />
		<jsp:include page="../../resources/include/nav.jsp" />
		<div class="layer">
			<div class="page">
				
				<!-- 첫 번째 구역 -->
				<div class="col3 content">
					<fieldset>
						<legend>팀 정보</legend>
					</fieldset>
					<div class="emblem">	
						<div class="img">
							<img src="">
							사진
						</div>
						<input type="file" />		
					</div>
				</div>
				
				<!-- 두 번째 구역 -->
				<div class="col5 content">
					<div class="info">
						<table class="infoTable">
							<tr>
								<td class="infoTable">팀명</td>
								<td class="infoTable"><input type="text" /></td>
								<td class="infoTable">지역</td>
								<td class="infoTable"><input type="text" /></td>
							</tr>
							<tr>
								<td class="infoTable">요일</td>
								<td class="infoTable left">
									월:<input type="radio" value="Mon" />
									화:<input type="radio" value="Tus" />
									수:<input type="radio" value="Web" />
									목:<input type="radio" value="Thu" />
									금:<input type="radio" value="Fri" />
									토:<input type="radio" value="Sat" />
									일:<input type="radio" value="Sun" />
								</td>
								<td class="infoTable">시간</td>
								<td class="infoTable"><input type="text" /></td>
							</tr>
							<tr>
								<td class="infoTable">연령대</td>
								<td class="infoTable"><input type="text" /></td>
								<td class="infoTable">유니폼</td>
								<td class="infoTable"><input type="text" /></td>
							</tr>
							<tr>
								<td class="infoTable">경기수</td>
								<td class="infoTable"><input type="text" /></td>
								<td class="infoTable">대표</td>
								<td class="infoTable"><input type="text" /></td>
							</tr>
							<tr>
								<td>부대표</td>
								<td><input type="text" /></td>
								<td>매니저</td>
								<td><input type="text" /></td>
							</tr>						
						</table>
					</div>
					<div class="member">
						-------------------------------------------------------------------------------------------------------------------------	
						<table class="table">
							<thead>
								<tr>
									<th>멤버 리스트</th>
									<th colspan="4" class="right"><button>탈퇴</button></th>
								</tr>
								<tr>
									<td>이름</td>
									<td>포지션</td>
									<td>총점</td>
									<td>경기수</td>
									<td>선택</td>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>이름</td>
									<td>포지션</td>
									<td>총점</td>
									<td>경기수</td>
									<td><input type="checkbox" /></td>
								</tr>
								<tr>
									<td>이름</td>
									<td>포지션</td>
									<td>총점</td>
									<td>경기수</td>
									<td><input type="checkbox" /></td>
								</tr>
							</tbody>	
						</table>	
					</div>
				</div>
			</div>
		</div>
	</body>
	<script></script>
</html>