<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Insert title here</title>
		<script src="https://code.jquery.com/jquery-3.1.0.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
		<style>
			.team{
				padding-left: 5%;
			}
			.score{
				width: 5%;
			}	
			.info{
				padding-top: 23px;
				border: 1px solid;
			}
			.eva{
				border: 1px solid;
			}
			.evaTable{
				width: 100%;
			}
			.memberSign{
				padding-top: 8%;
				text-align: right;
			}
			.tdList{
				padding-top: 20px;
				position: relative;
				border: 1px solid;
			}
			#ace{
				background-color: black;
				color: aliceblue;
				height: 40px;
			}
			td,th{
				text-align: center;
			}
			.margin{
				margin: 0;
				border: 1px solid;
			}
			.pro{
				width: 140px;
				height: 20px;
				background-color: #f0f0f0;
				border-radius: 4px;
				margin: 5px;
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
						<legend>${team.t_name}</legend>
					</fieldset>
					<div class="team">
						<jsp:include page="../../resources/include/team.jsp" />
					</div>
				</div>
				
				<!-- 두 번째 구역 -->
				<div class="col5 content">
					<div class="info">
						<table class="table">
							<thead>
								<tr>
									<th colspan="10">기본 정보</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<th class="score">승</th>
									<th class="score">무</th>
									<th class="score">패</th>
									<td class="score">${team.t_win}</td>
									<td class="score">${team.t_draw}</td>
									<td class="score">${team.t_lose}</td>
									<th>포인트</th>
									<td>${team.t_rankpoint}</td>
									<th>경기수</th>
									<td>${team.t_matchcount}</td>
								</tr>
								<tr>
									<th colspan="3">지역</th>
									<td colspan="3">
									${team.t_area}
									</td>
									<th>요일</th>
									<td>${team.t_day}</td>
									<th>시간</th>
									<td>${team.t_time}</td>
								</tr>
								<tr>
									<th colspan="3">인원수</th>
									<td colspan="3">${meCnt}</td>
									<th>연령</th>
									<td>${team.t_age}</td>
									<th>색</th>
									<td>${team.t_uniform}</td>
								</tr>
							</tbody>
						</table>
					</div>
					<div class="eva col-sm-6">
						<table class="evaTable">
							<tr>
								<th colspan="4">전적</th>
							</tr>
							<c:forEach items="${ent}" var="dto" begin="0" end="4">
							<tr>
								<td style="width:50%">${dto.e_team}</td>
								<td style="width:20%"> ${dto.e_difference} </td>
								<td style="width:30%">${dto.e_date}</td>
							</tr>
							</c:forEach>
						</table>
					</div>
					<div class="eva col-sm-6">
						<table class="evaTable">
							<tr>
								<th colspan="4">평가 정보</th>
							</tr>
							<tr>
								<th>매너</th>
								<td>
								<div class="pro">
								  <div class="progress-bar progress-bar-success" role="progressbar" style="width:${evalue.ev_manner*10}%">
								  </div>
								</div>
								</td>
								<th>${evalue.ev_manner/2}/5(${evalue.count})</th>
							</tr>
							<tr>
								<th>실력</th>
								<td>
								<div class="pro">
								  <div class="progress-bar progress-bar-info" " role="progressbar" style="width:${evalue.ev_level*10}%">
								  </div>
								</div>
								</td>
								<th>${evalue.ev_level/2}/5(${evalue.count})</th>
							</tr>
							<tr>
								<th>공격력</th>
								<td>
								<div class="pro">
								  <div class="progress-bar progress-bar-danger" role="progressbar" style="width:${evalue.ev_attk*10}%">
								  </div>
								</div>
								</td>
								<th>${evalue.ev_attk/2}/5(${evalue.count})</th>
							</tr>
							<tr>
								<th>수비력</th>
								<td>
								<div class="pro">
								  <div class="progress-bar progress-bar-warning" " role="progressbar" style="width:${evalue.ev_defe*10}%">
								  </div>
								</div>
								</td>
								<th>${evalue.ev_defe/2}/5(${evalue.count})</th>
							</tr>
						</table>
					</div>
				<div class="tdList">
				----------------------------------------------------------------------------------------------------------------------	
					<table class="table margin">
						<thead>
							<tr>
								<th style="text-align: left;" colspan="2">팀 일지</th>
							</tr>
							<tr>
								<td style="text-align: left;">
									<button onclick="tdWrite()">글쓰기</button>
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
										<option value="j_title">제목</option>
										<option value="j_content">내용</option>
										<option value="j_name">글쓴이</option>
									</select>
									<input type="text" class="input"/>
									<button onclick="Search()">검색</button>
								</td>
							</tr>
						</thead>
					</table>
					<table class="table">
						<thead>
							<tr>
								<th>번호</th>					
								<th>제목</th>
								<th>작성자</th>
								<th>작성일</th>
								<th>조회</th>
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
		<jsp:include page="../../resources/include/footer.jsp" />
	</body>
	<script>
	var currPage = 1;
	var num = 5;
	var value = null;
	var type = null;
	var t_idx = ${team.t_idx};
	
	$(document).ready(function(){
		listCall(currPage,t_idx,value,type);
	});
	
	
	
	$("#pagePerNum").change(function(){
		currPage = 1;
		listCall(currPage,t_idx,value,type);
	});
	
	//글쓰기
	function tdWrite(){
		console.log(t_idx);
		location.href="./tdWrite?t_idx="+t_idx;
	}
	
	//검색기능
	function Search(){
		value = $(".input").val();
		type = $(".type").val();
		listCall(currPage,t_idx,value,type);
		
	}
	
	function listCall(currPage,t_idx,value,type){
		var url="./listCall";
		var data = {};
		data.page = currPage;
		data.pagePerNum = $("#pagePerNum").val();
		data.j_category = "1"+t_idx;
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
			content +="<tr><td>"+list[i].j_idx+"</td><td>"
			+"<a href='./tdDetail?idx="+list[i].idx+"&t_idx="+t_idx+"'>"
			+list[i].j_title+"</a><b>["+list[i].j_reple+"]</b></td><td>"
			+list[i].j_name+"</td><td>"
			+list[i].j_date.substr(0,10)+"</td><td>"
			+list[i].j_vcount+"</td></tr>";
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
   			+"<li class='page-item first'><a href='#' onclick='listCall(1,"+t_idx+","+value+","+type+")'>First</a></li>"
   			+"<li class='page-item prev'><a href='#' onclick='listCall("+(currPage-1)+","+t_idx+","+value+","+type+")'>Previous</a></li>";
		
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
					content += "<li class='page-item'><a href='#' onclick='listCall("+i+","+t_idx+","+value+","+type+")' >"+i+"</a></li>";
				}					
			}			
		}
		content += "<li class='page-item next'><a href='#' onclick='listCall("+(currPage+1)+","+t_idx+","+value+","+type+")'>Next</a></li>"
           +"<li class='page-item last'><a href='#' onclick='listCall("+pageNum+","+t_idx+","+value+","+type+")'>Last</a></li></ul>";
		
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