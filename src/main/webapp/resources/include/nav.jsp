<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
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
				margin-bottom: 20px;
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
        <li class="active"><a href="../../main/match/matchList"><h4><b>매칭게시판</b></h4><span class="sr-only">(current)</span></a></li>
        <li><a href="../../main/match/calendar"><h4><b>매칭일정</b></h4></a></li>
        <li>
          <a href="../../main/place/placeList" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><h4><b>장소목록</b></h4></a>
        </li>
        <li>
        	<a href="../../main/team/teamList"><h4><b>팀</b></h4></a>
        </li>
         <li>
        	<a href="../../main/vidio/vidioList"><h4><b>영상 게시판</b></h4></a>
        </li>
         <li>
        	<a href="../../main/free/freeList"><h4><b>자유 게시판</b></h4></a>
        </li>
      </ul>  
    </div>
    </div>
  
	</body>
	<script></script>
</html>