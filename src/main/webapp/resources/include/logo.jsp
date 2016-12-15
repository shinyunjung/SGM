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
			
			.layer{
				width: 100%;
				text-align: center;
				margin-bottom: 50px;
			}
	
			.page {
				height: auto;
				width: 1080px;
				border: 1px solid;
				display: inline-block;
				margin: 0 auto;
			} 
			.col2{
				width:20%;
			}
			.col5{
				width: 60%;
			}
			.col3{
				width: 20%;
			}
		    
				
			.content {
				height: 100%;
				border: 1px solid;
	            float: left;
				padding: 1%;
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
			
			/**위치 스타일**/
			.right{
				text-align: right;
			}
			.center{
				text-align: center;
			}	
			.left{
				text-align: left;
			}
			
			/**게시글 제목 스타일**/
			.title{
				text-align: right;
			}
			
			/**관리글 제목 스타일**/
			.managerTitle{
				text-align: center;
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