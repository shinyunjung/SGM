<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
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
			.subject{
				width: 50%;
			}
			.recordTable{
				width: 100%;
			}
			.recordList{
				border: 1px solid black;
				border-collapse: collapse;
			}
			#replyZone{
				width: 100%;
				display: none;
			}
			#repleBox{
				width: 100%;
				text-align: left;
			}
			tr{
				height: 40px;
			}
			textarea{
				width: 100%;
				resize: block;
			}
			.recordZone{
				position: relative;
				display: block;
			}
			#content{
				width: 100%;
				min-height: 300px;
				font-size: 14px;
				text-align: left;
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
						<legend>팀 일지</legend>
					</fieldset>
					<div class="team">
						<jsp:include page="../../resources/include/team.jsp" />
					</div>
				</div>
				
				<!-- 두 번째 구역 -->
				<div class="col5 content">
					<div id="detailZone">
						<table>
							<thead>
								<tr class="borderBottom center">
									<td colspan="6" class="subject">${td.j_title}</td>
								</tr>
								<tr class="borderBottom center">
									<td>작성자</td>
									<td class="borderLeft">${td.j_name}</td>
									<td class="borderLeft">날짜</td>
									<td class="borderLeft">${td.j_date}</td>
									<td class="borderLeft">조회수</td>
									<td class="borderLeft">${td.j_vcount}</td>
								</tr>
							</thead>
							<tbody>
								<tr class="borderBottom center">
									<td colspan="6">
										<div id="content">${td.j_content}</div>
									</td>
								</tr>
							</tbody>
						</table>
					<div class="recordZone">
						<table class="recordTable">
							<thead>
								<tr>
									<th>개인기록</th>
								</tr>
								<tr>
									<th style="width:15%">이름</th>
									<th>득점</th>
					                <th>도움</th>
					                <th>슈팅</th>
					                <th>파울</th>
					                <th>경고</th>
					                <th>퇴장</th>
					                <th>코너킥</th>
					                <th>패널티 킥</th>
					                <th>오프 사이드</th>
					                <th>유효 슈팅</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${record}" var="rec">
									<c:if test="${rec.m_name!=null}">
										<tr class='borderTop'>
											<td>${rec.m_name}</td>
											<td>${rec.p_goal}</td>
								            <td>${rec.p_assist}</td>
								            <td>${rec.p_shoot}</td>
								            <td>${rec.p_poul}</td>
								            <td>${rec.p_warning}</td>
								            <td>${rec.p_off}</td>
								            <td>${rec.p_ck}</td>
								            <td>${rec.p_pk}</td>
								            <td>${rec.p_offside}</td>
								            <td>${rec.p_effectshot}</td>
							            </tr>
									</c:if>
									<c:if test="${rec.m_name==null}">
										<tr>
											<td colspan="11">개인기록이 없습니다.</td>
										</tr>
									</c:if>
								</c:forEach>
								</tbody>
							</table>
						</div>
							<table>
								<tr  style="height: 50px;">
									<td class="left"><b id="reCnt" onclick="reple()" style="cursor: pointer;">댓글(${td.j_reple})</b></td>
									<td style="width: 500px"></td>
									<c:set var="detail" value="${td.j_name }" />
									<c:set var="user" value="${sessionScope.userName}(${sessionScope.userId})" />
									<c:if test="${user==detail }">
										<td class="right ">
											<b onclick="location.href='./tdModify?idx=${td.totalIdx}&t_idx=${team.t_idx}'" style="cursor: pointer;">수정</b>
											/ <b onclick="location.href='./delete?idx=${td.totalIdx}&t_idx=${team.t_idx}'" style="cursor: pointer;">삭제</b>
										</td>
									</c:if>
								</tr>
							</table>
						<!-- 댓글 -->
						<div id="replyZone">
							<table id="repleBox">
								<tr class="borderBottom">
									<td class="center" style="width: 20%;"> ${sessionScope.userName}(${sessionScope.userId})</td>
									<td style="width: 60%;"><textarea rows="1" id="reple"></textarea></td>
									<td style="width: 20%;"><button id="repleGo">등록</button></td>
								</tr>
							<!-- 댓글 리스트 -->
							<tbody id="repleList"></tbody>
							</table>
						</div>
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
	start();
	function start(){
		if("${record}"=="[]"){
			$(".recordZone").css("display","none");
		}
		var path = "../../main/resources/upload/";
		for(var i=0; i<3; i++){
			var src = ["${file[0].f_newfilename}","${file[1].f_newfilename}","${file[2].f_newfilename}"];
			if(src[i]!=""){
			$("#file"+(i+1)).attr("src",path+src[i]);
				console.log(src);
			}
		}
	}
	
	var user="${sessionScope.userName}(${sessionScope.userId})";
	
	function reple(){
		var display=$("#replyZone").css("display");
		if(display=="none"){
			$("#replyZone").css("display","block");
			 replyList(); 
		}else{
			$("#replyZone").css("display","none");
		}
	}
	
	$("#repleGo").click(function(){
		console.log("댓글 전송");
		var url="../replyRegist";
		var data={};
		data.idx="${td.totalIdx}";
		data.u_idx="${sessionScope.userIdx}";
		data.replyer=user; 
		data.reple=$("#reple").val();
		data.column="board_idx";
		data.table="board";
		data.repleCnt="j_reple";
		console.log(data);
		reqServer(url, data);
	});
	
	function replyList(){
		var url="../replyList";
		var data={};
		data.idx="${td.totalIdx}";
		data.column="board_idx";
		console.log(data);
		console.log("댓글 리스트");
		reqServer(url, data);
	}
	
	function printReple(list){
		var content="";
		console.log(list);
		for(var i=0; i<list.length; i++){
			content +="<tr class='borderBottom'>"
			+"<td class='center'> "+list[i].r_writer+"</td>"
			+"<td>"+list[i].r_reple;
			if(user==list[i].r_writer){
				content+=" <b onclick='repleDel("+list[i].r_idx+")' style='cursor: pointer; color: red;'>X</b>"
			}
			content +="</td>"
				+"<td>"+list[i].r_date+"</td>"
				+"</tr>";
		}
		$("#repleList").empty();
		$("#repleList").append(content);
		$("#reCnt").empty();
		$("#reCnt").append("댓글("+list.length+")");
	}		
	
	function repleDel(idx){
		var url="../replyDel";
		var data={};
		data.r_idx=idx;
		data.idx="${td.totalIdx}";
		data.table="board";
		data.repleCnt="j_reple";
		console.log(data);
		reqServer(url, data);
	}
	
	function reqServer(url, data){
		console.log(url);
		$.ajax({
			url:url,
			type:"post",
			data:data,
			dataType:"JSON",
			success:function(d){
				console.log(d);
				if(url=="../replyRegist"){
					$("#reple").val("");
					 replyList(); 
				}else if(url=="../replyList"){
					console.log("댓글 리스트 호출");
					printReple(d.replyList); 
				}else if(url=="../replyDel"){
					console.log("댓글 삭제");
					replyList();
				}
			},
			error:function(error){
				console.log(error);
			}
		});
	}
	</script>
</html>