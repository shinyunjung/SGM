<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>장소목록 상세보기</title>
		<script src="https://code.jquery.com/jquery-3.1.0.min.js"></script>
		<script src="../../main/resources/bootstrap/js/bootstrap.js"></script>
		<link rel="stylesheet" type="text/css" href="../../main/resources/bootstrap/css/bootstrap.css" />
		<style>
			   .map_wrap {position:relative;width:100%;height:350px;}
   			   .title {font-weight:bold;display:block;}
  			   .hAddr {position:absolute;left:10px;top:10px;border-radius: 2px;background:#fff;background:rgba(255,255,255,0.8);z-index:1;padding:5px;}
   			    #centerAddr {display:block;margin-top:2px;font-weight: normal;}
 			   .bAddr {padding:5px;text-overflow: ellipsis;overflow: hidden;white-space: nowrap;}
		
			#detailZone{
				width: 700px;
				position: absolute;
				left: 270px;
				top: 270px;
			}
			#replyZone{
				
				width: 700px;
				margin-top: 10px;
			}
			#repleBox{
				
				width: 100%;
				padding: 10px;
			}
			
			.detailTable{
				width: 100%;
			}
			.subject{
				width: 60%;
			}
			.reple{
				text-align: left;
				
				width: 10%;
			}
			.data{
				width: 82%;
				padding: 10px;
			}
			.repleBtn{
				margin: 5px;
				width: 8%;
			}
			.AD{
				margin-top: 10%;
			}
			textarea{
				width: 100%;
				resize: none;
			}
		</style>
	</head>
	<body>
		<jsp:include page="../../resources/include/logo.jsp" />
		<jsp:include page="../../resources/include/nav.jsp" />
		<div class="layer">
			<div class="page">
				
				<!-- 첫 번째 구역 -->
				<div class="col2 content">
					<fieldset>
							<legend>장소목록</legend>
					</fieldset>
				</div>
				
				<!-- 두 번째 구역 -->
				<div class="col5 content">
				<div id="detailZone">
					<table class="detailTable">
						<thead>
							<tr class="borderBottom">
								<td class="subject">제목(불러오기)</td>
								<td class="borderLeft">날짜</td>
								<td class="borderLeft">날짜(불러오기)</td>
								<td class="borderLeft">조회수</td>
								<td class="borderLeft">조회수(불러오기)</td>
							</tr>
						</thead>
						<tbody>
							<tr class="borderBottom">
								<td colspan="5">
									<div class="col-sm-2 borderRight">
										주소 :
									</div>
									<div>
										주소(불러오기)
									</div>
								</td>
							</tr>
							<tr class="borderBottom">
								<td colspan="5">
									<div class="col-sm-4 borderRight">
										사진
									</div>
									<div>
										내용
									</div>
								</td>
							</tr>
							<tr class="borderBottom">
								<td colspan="5">
									<div class="map_wrap">
  						  			<div id="map" style="width:100%;height:100%;position:relative;overflow:hidden;"></div>
    									<div class="hAddr">
        									<span class="title">지도중심기준 행정동 주소정보</span>
        									<span id="centerAddr"></span>
  									    </div>
									</div>
								</td>
							</tr>
							<tr class=>
								<td class="reple"><a>댓글</a></td>
								<td colspan="4" class="right ">
									<button>등록</button> / <button>삭제</button>
								</td>
							</tr>
						</tbody>
					</table>
					<!-- 댓글 -->
					<div id="replyZone">
						<table id="repleBox" class="borderTop">
							<tr>
				
								<td class="data"><textarea rows="3"></textarea></td>
								<td class="repleBtn"><button id="go">등록</button></td>
							</tr>
						</table>
						<!-- 댓글 -->
						<div id="replyZone">
							<table id="repleBox" class="borderTop">
								<tr>
									<td class="user">등록자</td>
									<td class="data"><textarea rows="3"></textarea></td>
									<td class="repleBtn"><button id="go">댓글등록</button></td>
								</tr>
							</table>
						</div>
						</div>
					</div>
					
					<!--  세 번째 구역 -->
					<div class="col3 content">
						<div class="AD">
							광고
						</div>
					</div>
			</div>
		</div>
	</body>
				
	<script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=4c80c1326b8411cbdc60e962e2c46260&libraries=services"></script>
	<script>
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    	mapOption = {
        	center: new daum.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
        	level: 1 // 지도의 확대 레벨
    	};  

// 지도를 생성합니다    
var map = new daum.maps.Map(mapContainer, mapOption); 

// 주소-좌표 변환 객체를 생성합니다
var geocoder = new daum.maps.services.Geocoder();

var marker = new daum.maps.Marker(), // 클릭한 위치를 표시할 마커입니다
    infowindow = new daum.maps.InfoWindow({zindex:1}); // 클릭한 위치에 대한 주소를 표시할 인포윈도우입니다

// 현재 지도 중심좌표로 주소를 검색해서 지도 좌측 상단에 표시합니다
searchAddrFromCoords(map.getCenter(), displayCenterInfo);

// 지도를 클릭했을 때 클릭 위치 좌표에 대한 주소정보를 표시하도록 이벤트를 등록합니다
daum.maps.event.addListener(map, 'click', function(mouseEvent) {
    searchDetailAddrFromCoords(mouseEvent.latLng, function(status, result) {
        if (status === daum.maps.services.Status.OK) {
            var detailAddr = !!result[0].roadAddress.name ? '<div>도로명주소 : ' + result[0].roadAddress.name + '</div>' : '';
            detailAddr += '<div>지번 주소 : ' + result[0].jibunAddress.name + '</div>';
            
            var content = '<div class="bAddr">' +
                            '<span class="title">법정동 주소정보</span>' + 
                            detailAddr + 
                        '</div>';

            // 마커를 클릭한 위치에 표시합니다 
            marker.setPosition(mouseEvent.latLng);
            marker.setMap(map);

            // 인포윈도우에 클릭한 위치에 대한 법정동 상세 주소정보를 표시합니다
            infowindow.setContent(content);
            infowindow.open(map, marker);
       		 										 }   
    																		});
															   });

	// 중심 좌표나 확대 수준이 변경됐을 때 지도 중심 좌표에 대한 주소 정보를 표시하도록 이벤트를 등록합니다
	daum.maps.event.addListener(map, 'idle', function() {
	    searchAddrFromCoords(map.getCenter(), displayCenterInfo);
														});

	function searchAddrFromCoords(coords, callback) {
   	 // 좌표로 행정동 주소 정보를 요청합니다
   	 geocoder.coord2addr(coords, callback);         
	}

	function searchDetailAddrFromCoords(coords, callback) {
   	 // 좌표로 법정동 상세 주소 정보를 요청합니다
   	 geocoder.coord2detailaddr(coords, callback);
	}

	// 지도 좌측상단에 지도 중심좌표에 대한 주소정보를 표출하는 함수입니다
	function displayCenterInfo(status, result) {
    	if (status === daum.maps.services.Status.OK) {
        	var infoDiv = document.getElementById('centerAddr');
        	infoDiv.innerHTML = result[0].fullName;
    	}    
	}
	</script>		
					
					
</html>