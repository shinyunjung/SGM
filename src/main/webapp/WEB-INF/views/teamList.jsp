<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>팀 순위</title>
		<script src="https://code.jquery.com/jquery-3.1.0.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
		<style>
			.teamList{
				width: 100%;
			}
			th{
				text-align: center;
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
						<legend>팀 게시판</legend>
					</fieldset>
				</div>
				
				<!-- 두 번째 구역 -->
				<div class="col5 content">
					<table class="table table-hover totalTable">
						<thead>
							<tr>
								<td style="text-align: left;">
									게시물수:
									<select id="pagePerNum"> <!-- onchange="" -->
										<option value="5">5</option>
										<option value="10">10</option>
										<option value="15">15</option>
										<option value="20">20</option>
									</select>
								</td>
								<td style="text-align: right;">
									<input type="text" class="input"/>
									<button onclick="Search()">검색</button>
								</td>
							</tr>
						</thead>
					</table>
					<table class="table table-hover totalTable">
					<thead>
						<tr>
							<th>랭킹</th>
							<th>팀</th>
							<th>지역</th>
							<th>경기 수</th>
							<th>승점</th>
							<th>승</th>
							<th>무</th>
							<th>패</th>
						</tr>
					</thead>
					<tbody id="start">
					
					</tbody>
				</table>
				<div id="paging"></div> 
			</div>
				
				<!-- 세 번째 구역 -->
				<div class="col3 content">
				
				</div>	
			</div>
		</div>
		<jsp:include page="../../resources/include/footer.jsp" />
	</body>
	<script>
	var currPage = 1;
	var num = 5;
	var t_name = null;
	
	$(document).ready(function(){
		listCall(currPage);
	});
	
	$("#pagePerNum").change(function(){
		currPage = 1;
		listCall(currPage);
	});
	
	//검색기능
	function Search(){
		t_name = $(".input").val();
		listCall(currPage);
		
	}
	
	function listCall(currPage){
		var url="./listCall";
		var data = {};
		num = $("#pagePerNum").val();
		data.page = currPage;
		data.pagePerNum = num;
		data.t_name = t_name;
		reqServer(url,data);
	}
	
	
	function reqServer(url,data){
		$.ajax({
			url:url,
			type:"post",
			data:data,
			dataType:"json",
			success:function(d){
				console.log(d)
				currPage = d.currPage;
				printPaging(d.allCnt, d.page);
				printList(d.allCnt,d.jsonList.list);
				
			},error:function(e){
				console.log(e)
			}
		});
	}
	

	function printList(allCnt,list){
		console.log(list);
		var end = currPage*num;
		var sta = end-num;
		console.log(sta+"/"+end);
		if(end>allCnt-1){
			end=allCnt;
		}
		if(allCnt<num){
			sta = 0;
		}
		var content = "";
		for(var i=sta; i<end; i++){
			i=parseInt(i);
			content +="<tr>"
			+"<td>"+list[i].rank+"</td><td>"
			+"<a href='./teamDetail?t_idx="+list[i].t_idx+"'>"
			+list[i].t_name+"</a></td><td>"
			+list[i].t_area+"</a></td><td>"
			+list[i].t_matchcount+"</td><td>"
			+list[i].t_rankpoint+"</td><td>"
			+list[i].t_win+"</td><td>"
			+list[i].t_draw+"</td><td>"
			+list[i].t_lose+"</td></tr>";
		}
		$("#start").empty();
		$("#start").append(content);
	}
	
	function printPaging(allCnt, pageNum){
		console.log("전체 게시물 :"+allCnt );
		console.log("생성 가능 페이지 :"+pageNum );
		console.log("현재 페이지 :"+currPage);
		
		$("#paging").empty();
		var start;	//페이지 시작
		var end;	//페이지 끝
		var range = (currPage/5);	//다음 페이지 있는지 여부
		
		var content = "<ul class='pagination pagination-sm'>"
   			+"<li class='page-item first'><a href='#' onclick='listCall(1)'>First</a></li>"
   			+"<li class='page-item prev'><a href='#' onclick='listCall("+(currPage-1)+")'>Previous</a></li>";
		
		if(range >1){//5페이지 넘었을 경우
			end = currPage%5 == 0 ?
					(Math.floor(range))*5
					:(Math.floor(range)+1)*5;
			start = Math.floor(end-4);
		}else{//5페이지 미만일 경우
			start = 1;
			end = 5;
		}
		
		//페이징 표시			
		for(var i=start; i<=end;i++){
			if(i<=pageNum){
				if(currPage ==i){
					content += "<li class='page-item active'><a href='#'>"+i+"</a></li>";
				}else{
					content += "<li class='page-item'><a href='#' onclick='listCall("+i+")' >"+i+"</a></li>";
				}					
			}			
		}
		content += "<li class='page-item next'><a href='#' onclick='listCall("+(currPage+1)+")'>Next</a></li>"
           +"<li class='page-item last'><a href='#' onclick='listCall("+pageNum+")'>Last</a></li></ul>";
		
		$("#paging").append(content);
		if(currPage==1){
			$(".first").addClass("disabled");
			$(".prev").addClass("disabled");
		}
		if(currPage==pageNum){
			$(".next").addClass("disabled");
			$(".last").addClass("disabled");
		}
		
	}
	
	</script>
</html>