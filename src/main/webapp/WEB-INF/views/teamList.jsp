<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>팀 게시판</title>
		<script src="https://code.jquery.com/jquery-3.1.0.min.js"></script>
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
					<div class="right">
						<button>검색</button>
						<input type="text" />
					</div>
					<div class="teamList">
					게시물 갯수:
					<select id="pagePerNum"> <!-- onchange="" -->
						<option value="5">5</option>
						<option value="10">10</option>
						<option value="15">15</option>
						<option value="20">20</option>
					</select>
						<table class="table table-hover totalTable">
							<thead>
								<tr>
									<th>랭킹</th>
									<th>팀</th>
									<th>경기 수</th>
									<th>승점</th>
									<th>승</th>
									<th>무</th>
									<th>패</th>
								</tr>
							</thead>
							<tbody id="start">
							<c:forEach items="${list}" var="dto">
								<tr>
									<td>${dto.id}</td>
									<td>
										<a href="./memberView?id=${dto.id}">${dto.name}</a>
									</td>
									<td>
										<a href="./delete?id=${dto.id}">탈퇴</a>
									</td>
								</tr>
							</c:forEach>
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
	
	$(document).ready(function(){
		listCall(currPage);
	});
	
	$("#pagePerNum").change(function(){
		listCall(currPage);
	});
	
	function listCall(currPage){
		var url="./listCall";
		var data = {};
		data.page = currPage;
		data.pagePerNum = $("#pagePerNum").val();
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

	var rank = 1;
	function printList(list){
		var content = "";
		for(var i=0; i<list.length; i++){
			content +="<tr>"
			+"<td>"+i+"</td><td><a href='#'>"
			+list[i].t_name+"</a></td><td>"
			+list[i].t_matchcount+"</td><td>"
			+list[i].t_rankpoint+"</td><td>"
			+list[i].t_win+"</td><td>"
			+list[i].t_draw+"</td><td>"
			+list[i].t_lose+"</td></tr>";
		}
		$("#start").empty();
		$("#start").append(content);
	}
	

	var currPage = 1;
	
	function printPaging(allCnt, pageNum){
		console.log("전체 게시물 :"+allCnt );
		console.log("생성 가능 페이지 :"+pageNum );
		console.log("현재 페이지 :"+currPage);
		
		$("#paging").empty();
		var start;	//페이지 시작
		var end;	//페이지 끝
		var range = (currPage/5);	//다음 페이지 있는지 여부
		var content = "";
		
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
		//< 이전
		if(currPage > 5){
			content +="<a href='#' onclick='listCall("
				+(start-1)+")'>이전</a> | "
		}
		
		
		
		for(var i=start; i<=end;i++){
			if(i<=pageNum){
				if(currPage ==i){
					content +="<b>"+i+"</b>";
				}else{
					content += " <a href='#' onclick='listCall("+i+")'>"
					+i+"</a> "
				}					
			}			
		}
		//마지막 페이지가 전체 페이지 수 보다 적으면 다음 링크 생성
		if(end<pageNum){
			content +=" | <a href='#' onclick='listCall("
					+(end+1)+")'>다음</a> "
		}
		
		$("#paging").append(content);
		
	}
	
	</script>
</html>