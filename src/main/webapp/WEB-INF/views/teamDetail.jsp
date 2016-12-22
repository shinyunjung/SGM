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
				padding-bottom: 7%;
			}
			.evaTable{
				width: 100%;
			}
			.normal{
				border: 1px solid;
				border-collapse: collapse;
			}
			.memberSign{
				padding-top: 8%;
				
				text-align: right;
			}
			.member{
				padding-top: 20%;
			}
			#ace{
				background-color: black;
				color: aliceblue;
				height: 40px;
			}
			td,th{
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
									<th colspan="3">인수</th>
									<td colspan="3">${meCnt}</td>
									<th>연령</th>
									<td>${team.t_age}</td>
									<th>색</th>
									<td>${team.t_uniform}</td>
								</tr>
							</tbody>
						</table>
					</div>
					<div class="eva col-sm-8">
						<table class="evaTable">
							<tr>
								<th colspan="4">평가 정보</th>
							</tr>
							<tr>
								<td class="normal">매너</td>
								<td class="normal">
								<c:set var="sum" value="0"/>
								<c:forEach items="${evalue}" var="i">
									<c:set var="sum" value="${sum+i.ev_manner}"/>
								</c:forEach>
								<c:if test="${sum!=0}">
								<fmt:formatNumber value="${sum/evCnt}" type="pattern" pattern="0"/>
								</c:if>
								</td>
								<td class="normal">OOO</td>
								<td class="normal">OOO</td>
							</tr>
							<tr>
								<td class="normal">OOO</td>
								<td class="normal">OOO</td>
								<td class="normal">OOO</td>
								<td class="normal">OOO</td>
							</tr>
						</table>
					</div>
					<div class="col-sm-4 memberSign">
						<button>멤버 등록</button>
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
	
	$("#pagePerNum").change(function(){
		currPage = 1;
		listCall(currPage);
	});
	
	//검색기능
	function Search(){
		t_name = $(".input").val();
		listCall(currPage);
		
	}
	
	function tdList(t_idx){
		var url="./tdList";
		var data = {};
		data.t_idx = t_idx;
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
				printList(allCnt,list)
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