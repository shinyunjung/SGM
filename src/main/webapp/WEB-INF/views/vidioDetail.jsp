<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Insert title here</title>
		<script src="https://code.jquery.com/jquery-3.1.0.min.js"></script>
		<script src="../../main/resources/bootstrap/js/bootstrap.js"></script>
		<link rel="stylesheet" type="text/css" href="../../main/resources/bootstrap/css/bootstrap.css" />
		<style>
			
			#replyZone{
				width: 100%;
				margin-top: 10px;
				display: none;
			}
			#repleBox{
				width: 100%;
				text-align: left;
			}
			tr{
				height: 40px;
			}
			.detailTable{
				width: 100%;
			}
			.subject{
				width: 40%;
			}
			textarea{
				width: 100%;
				resize: none;
			}
			video{
				width: 100%;
				resize: none;
			}
			#content{
				width: 100%;
				min-height: 300px;
				font-size: 14px;
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
						<legend>영상 게시판</legend>
					</fieldset>
				</div>
				
				<!-- 두 번째 구역 -->
				<div class="col5 content">
					<div class="detailZone">
						<table class="detailTable">
							<thead>
								<tr class="borderBottom center">
									<td colspan="6">${content.j_title}</td>
								</tr>
								<tr class="borderBottom center">
									<td style="width: 10%;">작성자</td>
									<td class="borderLeft" style="width: 25%;">${content.j_name}</td>
									<td class="borderLeft">날짜</td>
									<td class="borderLeft">${content.j_date}</td>
									<td class="borderLeft">조회수</td>
									<td class="borderLeft">${content.j_vcount}</td>
								</tr>
							</thead>
							<tbody class="borderBottom">
								<tr>
									<td colspan="6" >
										<div id="content">${content.j_content}</div>
										<br/><br/>
										<video onerror="this.style.display='none'" src="../../main/resources/upload/${file[0].f_newfilename}" controls preload="metadata" ></video>
									</td>
								</tr>
							</tbody>
						</table>
						<table>
							<tr  style="height: 50px; font-size: 14px;">
								<td class="left"><b id="reCnt" onclick="reple()" style="cursor: pointer;">댓글(${content.j_reple})</b></td>
								<td style="width: 500px"></td>
								<td class="right ">
									<b onclick="location.href='./vidioModify?idx=${content.totalIdx}'" style="cursor: pointer;">수정</b>
									/ <b onclick="location.href='./delete?idx=${content.totalIdx}'" style="cursor: pointer;">삭제</b>
								</td>
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
		data.idx="${content.totalIdx}";
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
		data.idx="${content.totalIdx}";
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
		data.idx="${content.totalIdx}";
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