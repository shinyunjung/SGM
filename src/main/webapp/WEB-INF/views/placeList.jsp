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
			.map_wrap{
				margin-bottom: 2%;
			}
			.manager{
				margin-left: 10%;
			}
			th{
				text-align: center;
			}
			.margin{
				margin: 0;
			}
			
		</style>
	</head>
	<body>
		<jsp:include page="../../resources/include/logo.jsp" />
		<jsp:include page="../../resources/include/loginBox.jsp" />
		<jsp:include page="../../resources/include/nav.jsp" />
		<div class="layer">
			<div class="page">
				
				<!-- 첫 번째 구역 -->
				<div class="col2 content">
					<fieldset>
						<legend>장소목록</legend>
					</fieldset>
					<c:if test="${sessionScope.userId=='admin'}">
						<div class="manager">
							<jsp:include page="../../resources/include/manager.jsp" />
						</div>
					</c:if>
				</div>
				
				<!-- 두 번째 구역 -->
				<div class="col5 content">
					<!-- 지도 -->
					<div class="map_wrap">
					<jsp:include page="../../resources/include/placeMap.jsp" />
		   				<div id="map" style="width:100%;height:100%;position:relative;overflow:hidden;"></div>
		   			</div>	
					<table class="table margin">
						<thead>
							<tr>
								<td style="text-align: left;">
								<c:if test="${sessionScope.manager=='관리자'}"> 
									<button onclick="location.href='placeWrite'">장소추가</button>
								
								</c:if> 
									게시물수:
									<select id="pagePerNum">
										<option value="5">5</option>
										<option value="10">10</option>
										<option value="15">15</option>
										<option value="20">20</option>
									</select>
								</td>
								<td style="text-align: right;">
									<select class="type">
										<option value="a_ground">운동장</option>
										<option value="a_address">주소</option>
									</select>
									<input type="text" class="input"/>
									<button onclick="searchCall()">검색</button>
								</td>
							</tr>
						</thead>
					</table>
						<table class="table table-hover">
							<thead>
								<tr>
									<th >No</th>
									<th class="center">장소명</th>
									<th >주소</th>
									<th >조회수</th>
									<th >날짜</th>
									<th >별점</th>
									
								</tr>
							</thead>
							<tbody id="list">
								
							</tbody>
						</table>
						<div id="paging">
						
						</div>
				</div>
				<!-- 세 번째 구역 -->
				<div class="col3 content">
					<div id="ad">
						광고
					</div>
				</div>
			</div>
		</div>				
		
	</body>
	<script>
	var url="";
	var data={};
	var currPage=1;//현재 페이지
	var totalPage=1;
	
	listCall(currPage);
	
	$("#pagePerNum").change(function(){
		listCall(1);
	});
	
	function searchCall(){
		var input = $(".input").val();
		var type = $(".type").val();
		console.log(input);
		$(".input").val("");
		var url="./searchCall";
		var data={};
		data.page=currPage;
		data.pagePerNum=$("#pagePerNum").val();
		data.input=input;
		data.type=type;
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
			+"<td><a href='../place/placeDetail?idx="+list[i].a_idx+"'>"+list[i].a_ground+"</td>"
			+"<td>"+list[i].a_address+"</td>"
			+"<td>"+list[i].a_vcount+"</td>"
			+"<td>"+list[i].a_date+"</td>"
			+"<td>"+list[i].a_total+"</td>"
			+"</tr>";
		}
		
		$("#list").empty();
		$("#list").append(content);
	}



 //페이지 그리기
function printPaging(count, page){
	var totalRange=page/5;
	var totalEnd=0;
	
	console.log("전체 게시물:"+count);
	console.log("전체 페이지:"+page);
	console.log("현재 페이지:"+currPage);
	
	/* if(currPage>page){
		currPage=page;
		searchCall(currPage);
	} */
	if(totalRange>1){
		totalEnd=page%5==0?
				(Math.floor(totalRange))*5:
				(Math.floor(totalRange)+1)*5;
		totalStart=Math.floor(totalEnd-4);	
	}else{
		totalStart=1;
		totalEnd=totalStart+4;
	}
	
	var start; //페이지 시작
	var end; //페이지 끝
	
	var pre=currPage-1;
	
	var next=currPage+1;
	
	//다음 페이지가 있는지 여부확인
	var range=(currPage/5);
	
	var content = "<ul class='pagination pagination-sm'>";
	
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
		content+="<li class='page-item first'><a href='#' onclick='listCall("+1+")'>First</a></li>"
		+"<li class='page-item prev'><a href='#' onclick='listCall("+(start-1)+")'> << </a></li> "
		+"<li class='page-item before'><a href='#' onclick='listCall("+pre+")'> < </a></li> ";
		for(var i=start; i<=end; i++){
			if(i<=page){
				if(currPage==i){
					content+="<li class='page-item active'><a href='#'><b>"+i+"</b></a></li>";	
				}else{
					content+="<li class='page-item'> <a href='#' onclick='listCall("+i+")'>"
					+i+"</a></li> ";
				}	
			}
		}
		content+="<li class='page-item after'><a href='#' onclick='listCall("+next+")'> > </a></li> "
		+"<li class='page-item next'> <a href='#' onclick='listCall("+(end+1)+")'> >> </a></li>"
		+"<li class='page-item last'><a href='#' onclick='listCall("+page+")'>Last</a></li>";	
	$("#paging").empty();
	$("#paging").append(content);
	
	if(range<1){
		$(".first").addClass("disabled");
		$(".prev").addClass("disabled");
		if(currPage==1){
			$(".before").addClass("disabled");	
		}
	}
	if(end==totalEnd){
		$(".next").addClass("disabled");
		$(".last").addClass("disabled");
		if(currPage==page){
			$(".after").addClass("disabled");
		}
	}
	
}
	</script>
</html>