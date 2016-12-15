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
		    .menu{
				
				width: 1080px;
				background-color: orange; 
				display: inline-block;
				margin: 0 auto;
			}
			ul.nav li{
				float: left;
				width: 180px;
			}
			
			
 			
		</style>
	</head>
	<body>
	<div class="layer">
    <div class="menu">
      <ul class="nav">
        <li class="active"><a href="matchList"><h4><b>매칭게시판</b></h4><span class="sr-only">(current)</span></a></li>
        <li><a href="calendar"><h4><b>매칭일정</b></h4></a></li>
        <li>
          <a href="placeList" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><h4><b>장소목록</b></h4></a>
        </li>
        <li>
        	<a href="teamList"><h4><b>팀</b></h4></a>
        </li>
         <li>
        	<a href="vidioList"><h4><b>영상 게시판</b></h4></a>
        </li>
         <li>
        	<a href="freeList"><h4><b>자유 게시판</b></h4></a>
        </li>
      </ul>  
    </div>
    </div>
  
	</body>
	<script></script>
</html>