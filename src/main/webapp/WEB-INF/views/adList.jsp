<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>광고관리 페이지</title>
		<script src="https://code.jquery.com/jquery-3.1.0.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
		<style>
			.manager{
				margin-left: 10%;
			}
			.table{
				width: 100%;
				border-bottom: 1px solid silver;
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
						<legend>광고관리</legend>
					</fieldset>
					<div class="manager">
						<jsp:include page="../../resources/include/manager.jsp" />
					</div>
				</div>
				
				<!-- 두 번째 구역 -->
				<div class="col5 content">
					<div class="adList">
						<table class="table margin">
							<thead>
								<tr>
									<td style="text-align: left;">
										<button onclick="location.href='./adWrite'">광고등록</button>
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
											<option value="ad_title">제목</option>
											<option value="ad_content">내용</option>
											<option value="ad_host">광고주</option>
											<option value="ad_manager">담당자</option>
										</select>
										<input type="text" class="input"/>
										<button onclick="Search()">검색</button>
									</td>
								</tr>
							</thead>
						</table>
						<table class="table table-hover">
							<thead>
								<tr>
									<th>NO</th>
									<th style="width: 30%">제목</th>
									<th>유형</th>
									<th>조회</th>
									<th>노출</th>
									<th>날짜</th>
									<th>상태</th>
								</tr>
							</thead>
							<tbody id="start">
								
							</tbody>
						</table>
						<div id="paging"></div> 
					</div>
				</div>
				
				<!-- 세 번째 구역 -->
				<div class="col3 content">
				
				</div>	
			</div>
		</div>
	</body>
	<script>
	var currPage = 1;
	var num = 5;
	var value = null;
	var type = null;
	
	$(document).ready(function(){
		listCall(currPage,value,type);
	});
	
	$("#pagePerNum").change(function(){
		currPage = 1;
		listCall(currPage,value,type);
	});
	
	//검색기능
	function Search(){
		value = $(".input").val();
		type = $(".type").val();
		listCall(currPage,value,type);
		
	}
	
	function listCall(currPage,value,type){
		var url="./listCall";
		var data = {};
		data.page = currPage;
		data.pagePerNum = $("#pagePerNum").val();
		data.value = value;
		data.type = type;
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
				printList(d.jsonList.list);
				currPage = d.currPage;
				printPaging(d.allCnt, d.page);
			},error:function(e){
				console.log(e)
			}
		});
	}
	
	function printList(list){
		var content = "";
		console.log(list);
		for(var i=0; i<list.length; i++){
			content +="<tr><td>"+list[i].ad_idx+"</td><td>"
			+"<a href='../ad/adDetail?ad_idx="+list[i].ad_idx+"'>"
			+list[i].ad_title+"</a></td><td>"
			+list[i].ad_type+"["+list[i].ad_count+"]</td><td>"
			+list[i].ad_vcount+"</td><td>"
			+list[i].ad_exposure+"</td><td>"
			+list[i].e_date+"</td><td>"
			+list[i].ad_state+"</td></tr>";
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
		if(pageNum==1||pageNum==0){
			$(".first").addClass("disabled");
			$(".prev").addClass("disabled");
			$(".next").addClass("disabled");
			$(".last").addClass("disabled");
		}
		
	} 
	</script>
</html>