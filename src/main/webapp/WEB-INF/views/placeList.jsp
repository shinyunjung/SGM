<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>장소목록 게시판</title>
		<script src="https://code.jquery.com/jquery-3.1.0.min.js"></script>
		<script src="../../main/resources/bootstrap/js/bootstrap.js"></script>
		<link rel="stylesheet" type="text/css" href="../../main/resources/bootstrap/css/bootstrap.css" />
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
   			 <div>
   				<jsp:include page='../../resources/include/placeMap.jsp' />	
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
					<br/>
					<td class="left">
					게시물 갯수 : 
									<select id="pagePerNum">
										<option value="5">5</option>
										<option value="10">10</option>
										<option value="15">15</option>
										<option value="20">20</option>
									</select>
					</td>
								<br/>
								
								<!-- <tr>
									<th value=>No</th>
									<th value= ,class="center">작성자</th>
									<th value= ,class="center">장소명</th>
									<th value=>주소</th>
									<th value=>조회수</th>
									<th value=>날짜</th>
									<th value=>별점</th>
									
								</tr> -->
								
								
					<div class="placeList">
						<table class="table table-hover totalTable">
							
								<tr>
									<th >No</th>
									<th class="center">작성자</th>
									<th class="center">장소명</th>
									<th >주소</th>
									<th >조회수</th>
									<th >날짜</th>
									<th >별점</th>
									
								</tr>
							
							<tbody id="list">
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
						<div id="paging">
						
						</div>
						<div class="left">
							<button onclick="location.href='placeDetail'">상세보기</button>
							<button onclick="location.href='placeWrite'">장소추가</button>
							
						</div>
					</div>
				</div>	
				
				
			</div>
		</div>
		
		
						
	</body>
	
	
	<script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=4c80c1326b8411cbdc60e962e2c46260&libraries=services"></script>
	<script>
	
	
	//DB 에서 정보 받아와 마커 생성해보기
	function addMarker(lat, lng){
	    //마커가 표시될 위치입니다 
	      var markerPosition  = new daum.maps.LatLng(lat, lng);    
	   
	   //마커를 생성합니다
	   var marker = new daum.maps.Marker({
	      position: markerPosition
	     
		   	});
	   for(var i=0; i<list.length; i++){
	         addMarker(list[i].a_lat, list[i].a_lng);
	   	}
	   
	   
	  
	   }
	
	
	var url="";
	var data={};
	var currPage=1;//현재 페이지
	var totalPage=1;
	
	 $("document").ready(function(){
		listCall(currPage);
	}); 
	
	$("#pagePerNum").change(function(){
		listCall(1);
	});
	
	function searchCall(){
		var input = $(".input").val();
		console.log(input);
		$(".input").val("");
		var url="./searchCall";
		var data={};
		data.page=currPage;
		data.pagePerNum=$("#pagePerNum").val();
		data.input=input;
		reqServer(url, data);
		
	}
	
	function listCall(currPage){
		if(currPage>=1 && currPage<=totalPage)
		var url="./listCall";
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
				if(url=="./listCall"){
					printList(data.jsonList.list);
					currPage=data.currPage;
					totalPage=data.totalPage;
					printPaging(data.totalCount, data.totalPage); 
				}
				else if(url=="./searchCall"){
					printList(data.jsonList.list);
					currPage=data.currPage;
					totalPage=data.totalPage;
					printPaging(data.totalCount, data.totalPage); 
				}
				else if(url=="./delete"){
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
		addMarker(list[i].a_lat, list[i].a_lng);
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