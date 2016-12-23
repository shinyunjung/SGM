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
			.member{
				width: 100%;
				padding-top: 20px;
				overflow: auto;
				display: block;
				border: 1px solid;
			}
			.tdList{
				padding-top: 20px;
				position: relative;
				z-index: 2;
				display: none;
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
					<div class="eva col-sm-5">
						<table class="evaTable">
							<tr>
								<th colspan="4">전적</th>
							</tr>
							<c:forEach items="${ent}" var="ent" begin="0" end="4">
							<tr>
								<td>${ent.e_team}</td>
								<td rowspan="2">${ent.date}</td>
							</tr>
							<tr>
								<td>${ent.e_difference}</td>
							</tr>
							</c:forEach>
						</table>
					</div>
					<div class="eva col-sm-7">
						<table class="evaTable">
							<tr>
								<th colspan="4">평가 정보</th>
							</tr>
							<tr>
								<td>매너</td>
								<td>
								<c:set var="sum" value="0"/>
								<c:forEach items="${evalue}" var="i">
									<c:set var="sum" value="${sum+i.ev_manner}"/>
								</c:forEach>
								<c:if test="${sum!=0}">
								<fmt:formatNumber value="${sum/evCnt}" type="pattern" pattern="0"/>
								</c:if>
								<div class="progress">
								  <div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="40"
								  aria-valuemin="0" aria-valuemax="100" style="width:${evCnt}0%">
								  </div>
								</div>
								</td>
								<td>OOO</td>
								<td>OOO</td>
							</tr>
							<tr>
								<td>OOO</td>
								<td>OOO</td>
								<td>OOO</td>
								<td>OOO</td>
							</tr>
						</table>
					</div>
					<div class="member">
					----------------------------------------------------------------------------------------------------------------------	
						<table class="table">
							<thead>
								<tr>
									<th>멤버 리스트</th>
								</tr>
								<tr>
									<th>No</th>
									<th>이름</th>
									<th>포지션</th>
									<th>총점</th>
									<th>경기수</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${member}" var="dto" varStatus="status">
								<c:choose>
								<c:when test="${dto.rank==1 && dto.m_tpoint!=0 }">
									<tr id="ace">
										<td>ace</td>
										<td>${dto.m_name}</td>
										<td>${dto.m_position}</td>
										<td>${dto.m_tpoint}</td>
										<td>${dto.m_matchcount}</td>
									</tr>
								</c:when>
								<c:otherwise>
									<tr>
										<td>${status.count}</td>
										<td>${dto.m_name}</td>
										<td>${dto.m_position}</td>
										<td>${dto.m_tpoint}</td>
										<td>${dto.m_matchcount}</td>
									</tr>
								</c:otherwise>
							</c:choose>
							</c:forEach>
							</tbody>
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
										<option value="5">제목</option>
										<option value="10">내용</option>
										<option value="15">글쓴이</option>
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
						<tbody>
							
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
	
	function tdList(t_idx){
		$(".tdList").css("display","block");
		$(".member").css("display","none");
		/* listCall(currPage,t_idx,value,type); */
	}
	function member(){
		$(".tdList").css("display","none");
		$(".member").css("display","block");
	}
	
	
	$("#pagePerNum").change(function(){
		currPage = 1;
		listCall(currPage,t_idx,value,type);
	});
	
	//검색기능
	function Search(){
		value = $(".input").val();
		type = $(".type").val();
		listCall(currPage,t_idx,value,type);
		
	}
	
	function listCall(currPage,t_idx,value,type){
		var url="./tdList";
		var data = {};
		data.page = currPage;
		data.pagePerNum = $("#pagePerNum").val();
		data.t_idx = t_idx;
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
		console.log(list);
		for(var i=0; i<list.length; i++){
			content +="<tr>"
			+"<td>"+list[i].rank+"</td><td>"
			+"<a href='./teamDetail?t_idx="+list[i].t_idx+"'>"
			+list[i].t_name+"</a></td><td>"
			+list[i].t_matchcount+"</td><td>"
			+list[i].t_rankpoint+"</td><td>"
			+list[i].t_win+"</td><td>"
			+list[i].t_draw+"</td><td>"
			+list[i].t_lose+"</td></tr>";
			
			/* <tr>
			<td>0</td>
			<td>OOO</td>
			<td>OOOOO</td>
			<td>0</td>
			<td>OOO</td>
		</tr>  */
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