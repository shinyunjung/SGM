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
		
			#logo{
				width: 1080px;
				text-align: center;
				font-size: large;
				display: inline-block;
				margin: 0 auto;
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
			.layer{
				width: 100%;
				text-align: center;
				margin-bottom: 20px;
			}
	
			.page {
				height: auto;
				width: 1080px;
				border: 1px solid;
				display: inline-block;
				margin: 0 auto;
			} 
			.col2{
				width:17%;
				text-align: center;
				padding-top: 30px;
			}
			.col5{
				width: 63%;
				padding-left: 1%;
				padding-right: 1%;
			}
			.col3{
				width: 20%;
			}
		    
				
			.content {
				height: 100%;
				/* border: 1px solid; */
	            float: left;
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
		<div class="layer">
			<div id="logo" >
				 <a href="index"><img id="logoImg" src="./resources/include/img/logo.jpg" /></a>
			</div>
		</div>
	</body>
	<script></script>
</html>