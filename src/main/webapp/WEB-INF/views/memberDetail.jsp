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
			#point{
				position:absolute;
				left:500px;
				top:230px;
			}
			#poin{
				position:absolute;
				left:500px;
				top:461px;
				
			}
			td{
				text-align:center;
			}
			
				
		</style>
	</head>
	<body>
		<jsp:include page="../../resources/include/logo.jsp" />
		<jsp:include page="../../resources/include/nav.jsp" />
		<jsp:include page="../../resources/include/team.jsp" />
		<!-- memberDetail -->
		<div id="point">
			<table>
				<tr>
					<td>개인기록</td>
				</tr>
				<tr>
					<td>합계</td>
				</tr>
			</table>
				<br/>
				<br/>
			<table>	
				<tr>
					<td>이름</td>
					<td>득점</td>
					<td>도움</td>
					<td>공격포인트</td>
					<td>슈팅</td>
					<td>파울</td>
					<td>경고</td>
					<td>퇴장</td>
					<td>코너킥</td>
					<td>패널티킥</td>
					<td>오프사이트</td>
					<td>유효슈팅</td>
				</tr>
				<tr>
	    			<td>0</td>
	    			<td>0</td>
	    			<td>0</td>
	    			<td>0</td>
	    			<td>0</td>
	    			<td>0</td>
	    			<td>0</td>
	    			<td>0</td>
	    			<td>0</td>
	    			<td>0</td>
	    			<td>0</td>
	    			<td>0</td>
	    		</tr>				
			</table>
	    </div>
	    <div id="poin">
	    	----------------------------------------------------
	    	<br/>
	    	<br/>
	    	<table>
	    		<tr>
	    			<td>
	    				<p>최근 경기기록</p>
	    			</td>	
	    		</tr>
	    		<tr>	
	    			<td>
	    				<input value="대전"/>
	    			</td>
	    		</tr>
	    	</table>
	    	<table>
	    		<tr>
	    			<td>득점</td>
					<td>도움</td>
					<td>공격포인트</td>
					<td>슈팅</td>
					<td>파울</td>
					<td>경고</td>
					<td>퇴장</td>
					<td>코너킥</td>
					<td>패널티킥</td>
					<td>오프사이트</td>
					<td>유효슈팅</td>
	    		</tr>
	    		<tr>
	    			<td>0</td>
	    			<td>0</td>
	    			<td>0</td>
	    			<td>0</td>
	    			<td>0</td>
	    			<td>0</td>
	    			<td>0</td>
	    			<td>0</td>
	    			<td>0</td>
	    			<td>0</td>
	    			<td>0</td>
	    		</tr>
	    	</table>
	    </div>
	</body>
	<script></script>
</html>