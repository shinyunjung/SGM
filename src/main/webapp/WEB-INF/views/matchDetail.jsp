<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String idx = (String)session.getAttribute("userIdx");
	boolean check=false;
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Insert title here</title>
		<script src="https://code.jquery.com/jquery-3.1.0.min.js"></script>
		<script src="../../main/resources/bootstrap/js/bootstrap.js"></script>
		<link rel="stylesheet" type="text/css" href="../../main/resources/bootstrap/css/bootstrap.css" />
		<style>
			#repleBox{
				
				width: 100%;
				padding: 10px;
			}
			#matchMsg{
				width: 500px;
				border: 1px solid;
				position: absolute;
				background-color: skyblue;
				top: 45%;
				left: 45%;
				display: none;
				z-index: 2;
			}
			#replyZone{
				display: none;
			}
			.detailTable{
				width: 100%;
			}
			.subject{
				width: 60%;
			}
			.right{
				text-align: right;
			}
			.left{
				text-align: left;
			}
			.center{
				text-align: center;
			}
			.user{
				text-align: center;
				
				width: 10%;
			}
			.data{
				width: 82%;
				padding: 10px;
			}
			.repleBtn{
				margin: 5px;
				width: 8%;
			}
			.matchMsg{
				width: 100%;
			}
			.sender{
				padding: 5px;
			}
			.msg{
				padding: 5px;
			}
			thead{
				border-bottom: 1px solid;
			}
			textarea{
				width: 100%;
				resize: none;
			}
			input[name='writer']{
				display: none;
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
							<legend>매칭 게시판</legend>
					</fieldset>
				</div>
				
				<!-- 두 번째 구역 -->
				<div class="col5 content">
					<div id="detailZone">
						<table class="detailTable">
							<thead>
								<tr>
									<td class="subject left">${detail.mch_title}</td>
									<td class="borderLeft">날짜</td>
									<td class="borderLeft">${detail.mch_wrdate}</td>
									<td class="borderLeft">조회수</td>
									<td class="borderLeft">${detail.mch_vcount}</td>
								</tr>
								<tr class="borderTop">
									<td class="left">시합날짜:${detail.mch_date}</td>
									<td class="borderLeft">경기시간:${detail.mch_time}</td>
									<td class="borderLeft" colspan="3">팀명:${detail.mch_name}</td>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td colspan="5" class="left">
										${detail.mch_content}
									</td>
								</tr>
								<tr>
									<c:if test="${sessionScope.userIdx!=null}">
										<td colspan="5" class="right">
											<button onclick="mchMsg()">매칭 신청</button>
										</td>
									</c:if>
									<c:if test="${sessionScope.userIdx==null}">
										<td colspan="5" class="right">
											
										</td>
									</c:if>
								</tr>
								<tr class="borderTop">
									<td colspan="5">${detail.mch_ground}</td>
								</tr>
								<tr>
									<td colspan="5">
										<jsp:include page='../../resources/include/mapSearch.jsp' /><br/>
									</td>
								</tr>
								<tr class="borderTop">
									<c:if test="${sessionScope.userIdx==null}">
										<h1>세션 구별</h1>
									</c:if>
									<c:if test="${sessionScope.userIdx!=null}">
										<c:if test="${detail.mch_reple==0}">
											<td class="left"><a onclick="reple()" class="repCnt">댓글쓰기</a></td>
										</c:if>
										<c:if test="${detail.mch_reple!=0}">
											<td class="left"><a onclick="reple()" class="repCnt">댓글 ${detail.mch_reple}</a></td>
										</c:if>
										<c:set var="detailTeam" value="${detail.mch_name }" />
										<c:forEach items="${teamList}" var="team">
											<c:if test="${team.t_name==detailTeam}">
												<%check=true; %>
											</c:if>
										</c:forEach>
										<td colspan="4" class="right ">
											<%if(check) {%>
											<a href="../match/matchModify?idx=${detail.mch_idx }&userIdx=${sessionScope.userIdx}">수정</a> / <a href="../match/delete?idx=${detail.mch_idx}">삭제</a>
											<%} %>
										</td> 
									</c:if>
								</tr>
							</tbody>
						</table>
						<!-- 댓글 -->
						<div id="replyZone">
							<table class="repleBox borderTop">
								<tr>
									<td class="user">${sessionScope.userName}(${sessionScope.userId})</td>
									<td class="data"><textarea rows="3" id="reple"></textarea></td>
									<td class="repleBtn"><button class="repleGo">댓글등록</button></td>
								</tr>
							</table>
							<!-- 댓글 리스트 -->
							<table id="repleList">
							</table>
						</div>
					</div>
				</div>
				
				<!-- 세 번째 구역 -->
				<div class="col3 content">
					<div class="AD">
						광고 배너 공간
					</div>
				</div>
				
				<div id="matchMsg">
					<form action="sendNote" method="post">
						<table class="matchMsg">
							<tr>
								<td>매칭쪽지 보내기</td>
								<td class="right"><input type="button" onclick="delMsg()">x</button></td>
							</tr>
							<tr class="center borderTop">
								<td class="borderRight sender" id="sender">보낸 이 : </td>
								<td class="sender">
									받는 이 : <input type="text" name="recever" value="${detail.mch_name}" id="reception" readonly/><input type="text" name="writer" value="" />
									<input type="hidden" name="receverIdx" value="${detail.t_idx}" />
									<input type="hidden" name="noteTitle" value="[${detail.mch_title}] 의 글에서 신청한 쪽지가 왔습니다." />
									<input type="hidden" name="userIdx" value="${sessionScope.userIdx}" />
									<input type="hidden" name="contentIdx" value="${detail.mch_idx}" />
								</td>
							</tr>
							<tr class="borderTop">
								<td colspan="2">
									내용<br/>
									<div class="msg">
										<textarea class="msgContent" name="noteContent"></textarea>
									</div>
								</td>
							</tr>
							<tr>
								<td class="center borderTop" colspan="2" style="padding: 5px">
									<input type="submit" value="보내기" />
									<input type="button" onclick="delMsg()" value="취소" />
								</td>
							</tr>
						</table>
					</form>
				</div>
			</div>
		</div>
	</body>
	<script>
		var url="";
		var data={};
		var userIdx="${sessionScope.userIdx}";
		var user="${sessionScope.userName}"+"(${sessionScope.userId})";
		var repleCnt=0;
		areaSearch("${detail.mch_lat}", "${detail.mch_lng}");
		
		function mchMsg(){
			console.log("신청");
			var url="../match/gradeCheck"
			var data={};
			data.idx=userIdx;
			reqServer(url, data);
		}
		
		function selectTeam(idx){
			console.log(idx);
			url="../selectTeam";
			data.idx=idx;
			reqServer(url, data);
		}
		
		
		function sendMsg(){
			console.log("신청");
			
		}
		function delMsg(){
			console.log("취소");
			$(".msgContent").val("");
			$("#matchMsg").css("display","none");
		}
		
		function reple(){
			var display=$("#replyZone").css("display");
			if(display=="none"){
				$("#replyZone").css("display","block");
				 replyList(); 
			}else{
				$("#replyZone").css("display","none");
			}
		}
		
		$(".repleGo").click(function(){
			console.log("댓글 전송");
			var url="../match/replyRegist";
			var data={};
			data.idx="${detail.totalIdx}";
			data.category=4;
			data.replyer=user; 
			data.reple=$("#reple").val();
			console.log(data);
			reqServer(url, data);
		});
		
		function replyList(){
			var url="../match/replyList";
			var data={};
			data.idx="${detail.totalIdx}";
			data.category=4;
			console.log(data);
			console.log("댓글 리스트");
			reqServer(url, data);
		}
		
		function printReple(list){
			var content="";
			console.log(user);
			repleCnt=list.length;
			for(var i=0; i<list.length; i++){
				content+="<tr>"
					+"<td class='user'>"+list[i].r_writer+"</td>"
					+"<td class='data'>"+list[i].r_reple;
					if(user==list[i].r_writer){
					content+="<a href='#' onclick='repleDel("+list[i].r_idx+")'><sup>X</sup></a>";
					}
					content+="</td>"
					+"<td>"+list[i].r_date+"</td>"
					+"</tr>";
			}
			
			if(repleCnt>0){
				$(".repCnt").html("댓글 "+repleCnt);	
			}else{
				$(".repCnt").html("댓글쓰기");	
			}
			$("#repleList").empty();
			$("#repleList").append(content);
		}		
		
		function repleDel(idx){
			var url="../match/replyDel";
			var data={};
			data.idx=idx;
			data.parent="${detail.totalIdx}";
			data.category=4;
			console.log(data);
			reqServer(url, data);
		}
		
		function reqServer(url, obj){
			console.log(url);
			console.log(obj);
			$.ajax({
				url:url,
				type:"get",
				data:obj,
				dataType:"JSON",
				success:function(data){
					console.log(data);
					if(url=="../match/replyRegist"){
						console.log(data.msg);
						$("#reple").val("");
						 replyList(); 
					}else if(url=="../match/replyList"){
						console.log("댓글 리스트 호출");
						printReple(data.replyList); 
					}else if(url=="../match/replyDel"){
						console.log("댓글 삭제");
						alert(data.msg);
						replyList();
					}else if(url=="../match/gradeCheck"){
						if(data.success==1){
							$("#matchMsg").css("display","block");
							printSelect(data.teamList);
						}else{
							alert(data.msg);
						}
					}else if(url=="../selectTeam"){
						console.log("쪽지에서 함");
						console.log(data.userTeam);
						printSelect(data.userTeam);
					}
				},
				error:function(error){
					console.log(error);
				}
			});
		}
		
		
		function printSelect(data){
			console.log("printSelect")
			var content="보낸이 : ";
			$("input[name='writer']").val(data[0].t_name);
			content+="<select name='t_idx' class='select' onchange='teamValue()'>";
			for(var i=0; i<data.length; i++){
				content+="<option value="+data[i].t_idx+"  >"+data[i].t_name+"</option>";
			}
			content+="</select>";
			$("#sender").empty();
			$("#sender").append(content);
			console.log($("input[name='writer']").val())
		}
		
		function teamValue(){
			var value = $("select[name='t_idx']").val();
			var t_name=$("option[value='"+value+"']").html();
			$("input[name='writer']").val(t_name);
			console.log(t_name);
			console.log($("input[name='writer']").val());
			
		}
	</script>
</html>