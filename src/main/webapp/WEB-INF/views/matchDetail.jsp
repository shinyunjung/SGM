<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Insert title here</title>
		<script src="https://code.jquery.com/jquery-3.1.0.min.js"></script>
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
							</thead>
							<tbody>
								<tr>
									<td colspan="5" class="left">
										${detail.mch_content}
									</td>
								</tr>
								<tr>
									<td colspan="5" class="right">
										<button onclick="mchMsg()">매칭 신청</button>
									</td>
								</tr>
								<tr class="borderTop">
									<td colspan="5">
										<jsp:include page='../../resources/include/mapSearch.jsp' /><br/>
										주소
									</td>
								</tr>
								<tr class="borderTop">
									<c:if test="${detail.mch_reple==0}">
										<td class="left"><a onclick="reple()" class="repCnt">댓글쓰기</a></td>
									</c:if>
									<c:if test="${detail.mch_reple!=0}">
										<td class="left"><a onclick="reple()" class="repCnt">댓글 ${detail.mch_reple}</a></td>
									</c:if>
									<td colspan="4" class="right ">
										<a href="../match/matchModify?idx=${detail.mch_idx }">수정</a> / <a>삭제</a>
									</td>
								</tr>
							</tbody>
						</table>
						<!-- 댓글 -->
						<div id="replyZone">
							<table class="repleBox borderTop">
								<tr>
									<td class="user">등록자</td>
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
					<table class="matchMsg">
						<tr>
							<td>매칭쪽지 보내기</td>
							<td class="right"><button onclick="delMsg()">x</button></td>
						</tr>
						<tr class="center borderTop">
							<td class="borderRight sender">보낸 이 : <input type="text" readonly/></td>
							<td class="sender">받는 이 : <input type="text" value="${detail.mch_name}" readonly/></td>
						</tr>
						<tr class="borderTop">
							<td colspan="2">
								내용<br/>
								<div class="msg">
									<textarea></textarea>
								</div>
							</td>
						</tr>
						<tr>
							<td class="center borderTop" colspan="2" style="padding: 5px">
								<button>보내기</button>
								<button onclick="delMsg()">취소</button>
							</td>
						</tr>
					</table>
				</div>
			</div>
		</div>
	</body>
	<script>
		var repleCnt=0;
		areaSearch(${detail.mch_lat}, ${detail.mch_lng});
		function mchMsg(){
			console.log("신청");
			$("#matchMsg").css("display","block");
		}
		
		function delMsg(){
			console.log("신청");
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
			data.idx="${detail.mch_idx}";
			data.category=4;
			/* data.replyer="${sessionScope.userId}"; */
			data.replyer="등록자";
			data.reple=$("#reple").val();
			console.log(data);
			sendServer(url, data);
		});
		
		function replyList(){
			var url="../match/replyList";
			var data={};
			data.idx="${detail.mch_idx}";
			data.category=4;
			console.log(data);
			console.log("댓글 리스트");
			sendServer(url, data);
		}
		
		function printReple(list){
			var content="";
			var user="등록자";
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
			}
			$("#repleList").empty();
			$("#repleList").append(content);
		}		
		
		function repleDel(idx){
			var url="../match/replyDel";
			var data={};
			data.idx=idx;
			data.category=4;
			console.log(data);
			sendServer(url, data);
		}
		
		function sendServer(url, obj){
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
					}
				},
				error:function(error){
					console.log(error);
				}
			});
		}
	</script>
</html>