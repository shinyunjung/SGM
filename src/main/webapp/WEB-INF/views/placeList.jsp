<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>장소목록 게시판</title>
		<script src="https://code.jquery.com/jquery-3.1.0.min.js"></script>
		<script src="resources/bootstrap/js/bootstrap.js"></script>
		<link rel="stylesheet" type="text/css" href="resources/bootstrap/css/bootstrap.css" />
		<style>
			.map{
				margin-bottom: 2%;
			}
			.manager{
				margin-left: 10%;
			}
			th{
				text-align: center;
			}
			 .map_wrap {position:relative;width:100%;height:350px;}
   			 .title {font-weight:bold;display:block;}
		     .hAddr {position:absolute;left:10px;top:10px;border-radius: 2px;background:#fff;background:rgba(255,255,255,0.8);z-index:1;padding:5px;}
    		 #centerAddr {display:block;margin-top:2px;font-weight: normal;}
    		 .bAddr {padding:5px;text-overflow: ellipsis;overflow: hidden;white-space: nowrap;}
		</style>
	</head>
	<body>
		<jsp:include page="../../resources/include/logo.jsp" />
		<jsp:include page="../../resources/include/nav.jsp" />
		<div class="layer">
			<div class="page">
			<div class="map_wrap">
   			 <div id="map" style="width:100%;height:100%;position:relative;overflow:hidden;"></div>
   				 <div class="hAddr">
      			  <span class="title">지도중심기준 행정동 주소정보</span>
       			 <span id="centerAddr"></span>
    			 </div>
			 </div>
			
				
				
				
				<!-- 두 번째 구역 -->
				<div class="col5 content">
					
					<div class="center">
						<select>
							<option value="1">OO구</option>
						</select>
						<input type="text" size="40" />
						<button>검색</button>
					</div>
					<div class="placeList">
						<table class="table table-hover totalTable">
							<thead>
								<tr>
									<th>사진</th>
									<th class="center">제목</th>
									<th class="center">날짜</th>
									<th>비교</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>사진</td>
									<td>제목</td>
									<td>날짜</td>
									<td>비교</td>
								</tr>
							</tbody>
						</table>
						<div class="left">
							<button onclick="location.href='placeDetail'">장소추가</button>
							
						</div>
					</div>
				</div>	
				
				
			</div>
		</div>				
	</body>
	<script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=4c80c1326b8411cbdc60e962e2c46260&libraries=services"></script>
	<script>
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new daum.maps.LatLng(37.447357, 126.6824384), // 지도의 중심좌표
        level: 7 // 지도의 확대 레벨
    			};
	
	
	// 지도를 생성합니다    
	var map = new daum.maps.Map(mapContainer, mapOption); 

	
	var positions = [
	    {
            content: '<div>인천축구전용경기장</div>', 
            latlng: new daum.maps.LatLng(37.4660211, 126.64305495)
        },
        {
            content: '<div>인천문학경기장</div>', 
            latlng: new daum.maps.LatLng(37.43514542, 126.6909023)
        }
	   
	];

	// 마커 이미지의 이미지 주소입니다
	var imageSrc = "http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"; 
	    
	for (var i = 0; i < positions.length; i ++) {
	    
	    // 마커 이미지의 이미지 크기 입니다
	    var imageSize = new daum.maps.Size(24, 35); 
	    
	    // 마커 이미지를 생성합니다    
	    var markerImage = new daum.maps.MarkerImage(imageSrc, imageSize); 
	    
	    // 마커를 생성합니다
	    var marker = new daum.maps.Marker({
	        map: map, // 마커를 표시할 지도
	        position: positions[i].latlng, // 마커를 표시할 위치
	        title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
	        image : markerImage // 마커 이미지 
	    });
	}
	
	
	
	
	
	
	
	
	</script>
</html>