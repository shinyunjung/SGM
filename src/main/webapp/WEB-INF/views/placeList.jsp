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
									<th>No</th>
									<th class="center">작성자</th>
									<th class="center">장소명</th>
									<th>주소</th>
									<th>조회수</th>
									<th>날짜</th>
									<th>별점</th>
									
								</tr>
							</thead>
							<tbody>
								<tr>
									<th>No</th>
									<th class="center">작성자</th>
									<th class="center">장소명</th>
									<th>주소</th>
									<th>조회수</th>
									<th>날짜</th>
									<th>별점</th>
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
	
	
	var url="";
	var data={};
	var currPage=1;//현재 페이지
	var totalPage=1;
	
	 $("document").ready(function(){
		listCall(currPage);
	}); 
	
	$("#pagePerNum").change(function(){
		listCall(currPage);
	});
	
	function searchCall(){
		var input = $(".input").val();
		console.log(input);
		$(".input").val("");
		var url="../rest/searchCall";
		var data={};
		data.page=currPage;
		data.pagePerNum=$("#pagePerNum").val();
		data.input=input;
		reqServer(url, data);
		
	}
	
	function listCall(currPage){
		if(currPage>=1 && currPage<=totalPage)
		var url="../rest/listCall";
		var data={};
		data.page=currPage;
		data.pagePerNum=$("#pagePerNum").val();
		reqServer(url, data);
	}
	
	
	function reqServer(url, data){
		console.log(url);
		$.ajax({
			url:url,
			type:"post",
			data:data,
			dataType:"JSON",
			success:function(data){
				console.log(data);
				if(url=="../rest/listCall"){
					printList(data.jsonList.list);
					currPage=data.currPage;
					totalPage=data.totalPage;
					printPaging(data.totalCount, data.totalPage); 
				}
				else if(url=="./rest/searchCall"){
					printList(data.jsonList.list);
					currPage=data.currPage;
					totalPage=data.totalPage;
					printPaging(data.totalCount, data.totalPage); 
				}
				else if(url=="./rest/delete"){
					alert(data.msg);
					listCall(currPage);
				}
			},
			error:function(error){
				console.log(error);
			}
	});
}
	
function printList(list){
	var content="";
	for(var i=0; i<list.length; i++){
		content+="<tr>"
			+"<td>"+list[i].a_idx+"</td>"
			+"<td>"+list[i].a_name+"</td>"
			+"<td>"+list[i].a_ground+"</td>"
			+"<td>"+list[i].a_address+"</td>"
			+"<td>"+list[i].a_vocunt+"</td>"
			+"<td>"+list[i].a_date+"</td>"
			+"<td>"+list[i].a_total+"</td>"
			+"</tr>";
		}
		
		$("#list").empty();
		$("#list").append(content);
	}



 //페이지 그리기
function printPaging(count, page){
	console.log("전체 게시물:"+count);
	console.log("전체 페이지:"+page);
	console.log("현재 페이지:"+currPage);

	var start; //페이지 시작
	var end; //페이지 끝
	
	var pre=currPage-1;
	
	var next=currPage+1;
	
	//다음 페이지가 있는지 여부확인
	var range=(currPage/5);
	
	var content="";
	
	console.log(range);
	if(range>1){//5페이지 넘었을 경우
		end=currPage%5==0?
				(Math.floor(range))*5:
				(Math.floor(range)+1)*5;
		start=Math.floor(end-4);
	}else{//5페이지 이하일 경우
		start=1;
		end=start+4;
	}
	console.log(start+"/"+end);
	
	content+="<a href='#' onclick='listCall("+1+")'>처음</a> |";
	
	content+=" <a href='#' onclick='listCall("+(start-1)+")'> << </a> ";
	
	content+="<a href='#' onclick='listCall("+pre+")'> < </a> ";
	
	for(var i=start; i<=end; i++){
		if(i<=page){
			if(currPage==i){
				content+="<b>"+i+"</b>";	
			}else{
				content+=" <a href='#' onclick='listCall("+i+")'>"
				+i+"</a> ";
			}	
		}
	}
	
	content+="<a href='#' onclick='listCall("+next+")'> > </a> ";
	
	content+=" <a href='#' onclick='listCall("+(end+1)+")'> >> </a>";
	
	content+="| <a href='#' onclick='listCall("+page+")'>끝</a>";
	$("#paging").empty();
	$("#paging").append(content);
} 
	
	
	
	
	
	
	
	</script>
</html>