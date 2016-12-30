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
										<td><a href="./memberDetail?m_idx=${dto.m_idx}&t_idx=${team.t_idx}">${dto.m_name}</a></td>
										<td>${dto.m_position}</td>
										<td>${dto.m_tpoint}</td>
										<td>${dto.m_matchcount}</td>
									</tr>
								</c:when>
								<c:otherwise>
									<tr>
										<td>${status.count}</td>
										<td><a href="./memberDetail?m_idx=${dto.m_idx}&t_idx=${team.t_idx}">${dto.m_name}</a></td>
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
	function listCall(currPage,idx,value,type){
		var url="../td/tdList";
		var data = {};
		data.page = currPage;
		data.pagePerNum = $("#pagePerNum").val();
		data.j_category = idx;
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
			+"<a href='../td/tdDetail?j_idx="+list[i].j_idx+",j_category="+list[i].j_category+"'>"
			+list[i].j_title+"</a><b>["+list[i].j_reple+"]</b></td><td>"
			+list[i].j_name+"</td><td>"
			+list[i].j_date.substr(0,10)+"</td><td>"
			+list[i].j_vcount+"</td></tr>";
		}
		$("#start").empty();
		$("#start").append(content);
	}
	

	
	</script>
</html>