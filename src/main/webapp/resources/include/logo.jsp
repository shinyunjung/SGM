<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Insert title here</title>
		<script src="https://code.jquery.com/jquery-3.1.0.min.js"></script>
		
		<style>
		/* Remove the jumbotron's default bottom margin */ 
     .jumbotron {
      margin-bottom: 0;
    }
			#logo{
				width: 100%;
				text-align: center;
				font-size: large;
			}
			#logoImg{
				width: 300px;
				height: 100px; 
			}
		/**관리 게시판 위치**/
			#Manager{
				position: absolute;
				left: 270px;
				top: 300px;
			}
			
		/**게시판 스타일**/
			.totalTable{
				width: 700px;
				text-align: center;
				border-bottom: 1px solid silver;
			}
			
		/**검색 스타일(글작성 없음)**/	
			#searchManager{
				width: 970px;
				text-align: right;
			}
		
		/**검색 스타일(글작성 있음)**/	
			#searchList{
				position: absolute;
				left: 270px; 
				width: 700px;
			}
			
		/**border 한방향 스타일**/
			.borderLeft{
				border-left: 1px solid;
			}
			.borderRight{
				border-right: 1px solid;
			}
			.borderBottom{
				border-bottom: 1px solid;
			}
			.borderTop{
				border-top: 1px solid;
			}	
		</style>
	</head>
	<body>
		<div id="logo" >
			 <a href="logo"><img id="logoImg" src="./resources/include/img/logo.jpg" /></a>
		</div>
	</body>
	<script></script>
</html>