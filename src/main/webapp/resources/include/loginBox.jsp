<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Insert title here</title>
		<script src="https://code.jquery.com/jquery-3.1.0.min.js"></script>
		<style>
			
			.userMsg{
				width: 1080px;
				text-align: right;
			}
			.msgPannel{
				border: 1px solid blue;
				display: none;
				width: 500px;
				height: 150px;
				position:absolute;
				left: 620px;
				overflow:auto;
				z-index: 2;
				background-color: white;
				
			}
			.msgTable{
				border: 1px solid;
				width: 100%;
			}
			#noteImg{
				display:none;
			}
		</style>
	</head>
	<body>
		<div class="layer">
			<div class="userMsg">
				<button class="loginBtn" onclick="location.href='../loginPage'">로그인</button>
				<button class="joinBtn" onclick="location.href='../join'">회원가입</button>
			</div>
			<div class="msgPannel">
				<table class="table msgTable">
					<thead>
						<tr>
							<td>받은 팀</td>
							<td>제목</td>
						</tr>
					</thead>
					<tbody id="msgList">
						<tr>
							<td>dlwnaud</td>
							<td>test</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</body>
	<script>
		var userId="${sessionScope.userId}";
		var userIdx="${sessionScope.userIdx}";
		var manager="${sessionScope.manager}";
		var userData={};
		var teamData={};
		var preNoteCnt=0;
		var nowNoteCnt=0;
		console.log(userId);
		console.log(userIdx);
		
		if(userId!=""){
			var url="../../main/userSearch";
			var data={};
			data.userId=userId;
			sendServer(url, data);
			newNote();
		}
		
		function logoId(){
			if(userId!=""){
				var url="../../main/userSearch";
				var data={};
				data.userId=userId;
				sendServer(url, data);
				newNote();
			}
		}
		
		
		function selectTeam(u_idx){
			console.log("selectTeam");
			var url="../../main/selectTeam";
			var data={};
			data.idx=u_idx;
			sendServer(url, data); 
		}
		
		function sendServer(url, data){
			$.ajax({
				url:url,
				type:"post",
				data:data,
				dataType:"JSON",
				success:function(data){
					console.log(data);
					if(url=="../../main/userSearch"){
						console.log("유저확인");
						selectTeam(data.user.u_idx);
						userData=data.user;
						console.log(userData);
					}else if(url=="../../main/selectTeam"){
						console.log("팀정보 확인");
						teamData=(data.userTeam);
						console.log(teamData.length);
						printUser(userData.u_name, teamData);
						
					}else if(url=="../../main/note/newListCall"){
						console.log("새로운 쪽지 발생");
						printMsg(data.list);
					}else if(url=="../../main/note/countNote"){
						nowNoteCnt=data.count;
						if(nowNoteCnt!=0){
							$("#noteImg").css("display","block");
						}else{
							$("#noteImg").css("display","none");
						}
					}
				},
				error:function(error){
					console.log(error);
				}
			});
		}
		
		function printUser(name, data){
			console.log(name);
			var content="";
			content+="<a href='#' onclick='msgPannel()' id='noteImg'><img src='../../main/resources/img/쪽지.png'></a>";
			if(manager==""){
				content+="<select class='myTeam'>"
					+"<option value=0>내가 가입한 팀: </option>";
					for(var i=0; i<data.length; i++){
						content+="<option value="+data[i].t_idx+">"+data[i].t_name+"</option>";
					}
					content+="</select>";
					content+=" "+name+" 님 안녕하세요";
			}
			else{
				content+=" <a href='../../main/manager/usManager'>"+manager+" 님 안녕하세요</a> ";
			}
			content+="<a href=../../main/logout?idx="+${sessionScope.userIdx}+" >로그아웃</a>";
			$(".userMsg").empty();
			$(".userMsg").append(content);
		}
		
		function msgPannel(){
			 $(".msgPannel").slideToggle("fast",function(){
				console.log("토글");
			}); 
			 msgList(); 
		}
		
		function msgList(){
			var url="../../main/note/newListCall";
			var data={};
			var idx=0;
			console.log(teamData);
			data.idx="";
			for(var i=0; i<teamData.length; i++){
				if(i>0){
					data.idx+=" "+teamData[i].t_idx;	
				}else{
					data.idx+=teamData[i].t_idx;	
				}
				console.log(data.idx);
			}
			sendServer(url, data);
			
		}
		
		
	function printMsg(list){
		content="";
		for(var i=0; i<list.length; i++){
			console.log(i);
			content+="<tr>"
			+"<td><a href='../../main/note/msgPage?idx="+list[i].receiver_idx+"&name="+list[i].n_receiver+"' >"+list[i].n_receiver+"</a></td>"
			+"<td>"+list[i].n_title+"</td>"
			+"</tr>";
			console.log(content);
		}
		$("#msgList").empty();
		$("#msgList").append(content);
	}
	
	
	function newNote(){
		console.log("newNote");
		setInterval(function(){
			var url="../../main/note/countNote";
			var data={};
			sendServer(url, data);
		}, 10000);	
	}
	</script>
</html>