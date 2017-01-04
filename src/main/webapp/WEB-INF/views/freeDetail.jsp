<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<% 
	String j_idx = (String)session.getAttribute("j_idx");
    boolean check=false;
%>
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
			
			.detailTable{
				width: 100%;
			}
			.subject{
				width: 40%;
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
			#replyZone{
				
				width: 100%;
				margin-top: 10px;
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
						<legend>자유 게시판</legend>
					</fieldset>
				</div>
				
				<!-- 두 번째 구역 -->
				<div class="col5 content">
					<div class="detailZone">
						<table class="detailTable">
							<thead>
								<tr>
									<td class="subject left">제목</td>
									<td class="subject left">${content.j_title}</td>
									<td class="borderLeft">날짜</td>
									<td class="borderLeft">${content.j_date}</td>
									<td class="borderLeft">조회수</td>
									<td class="borderLeft">${content.j_vcount}</td>
								</tr>
							</thead>
							<tbody class="borderTop">
								<tr>
									<td colspan="5" >
										${content.j_content}
									</td>
								</tr>
								<tr class="borderTop">
									<td colspan="4" class="right ">
										<input type="button" onclick="location.href='./freeList'" value="돌아가기"/>
										<input type="button" onclick="location.href='./freeModify?j_idx=${content.j_idx}'" value="수정하기"/>
										<input type="button" onclick="del()" value="삭제"/>
									</td>
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
			</div>
				
				<!-- 세 번째 구역 -->
				
			</div>
	</body>
	<script>
	var url="";
	var data={};
	var userIdx="${sessionScope.userIdx}";
	var user="${sessionScope.userName}"+"(${sessionScope.userId})";
	var repleCnt=0;
	
	function del(){
		location.href="./delete?j_idx="+${content.j_idx };
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
		var url="../free/replyRegist";
		var data={};
		data.r_idx="${detail.totalIdx}";
		data.r_category=3;
		data.r_replyer=user; 
		data.r_reple=$("#reple").val();
		console.log(data);
		reqServer(url, data);
	});
	
	function replyList(){
		var url="../free/replyList";
		var data={};
		data.r_idx="${detail.totalIdx}";
		data.r_category=3;
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
	
	function repleDel(r_idx){
		var url="../free/replyDel";
		var data={};
		data.r_idx=r_idx;
		data.r_parent="${detail.totalIdx}";
		data.r_category=3;
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
				if(url=="../free/replyRegist"){
					console.log(data.msg);
					$("#reple").val("");
					 replyList(); 
				}else if(url=="../free/replyList"){
					console.log("댓글 리스트 호출");
					printReple(data.replyList); 
				}else if(url=="../free/replyDel"){
					console.log("댓글 삭제");
					alert(data.msg);
					replyList();
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
	
	</script>
</html>