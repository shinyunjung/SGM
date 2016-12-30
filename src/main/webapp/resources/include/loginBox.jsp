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
			
		</style>
	</head>
	<body>
		<div class="layer">
			<div class="userMsg">
				<button class="loginBtn" onclick="location.href='../loginPage'">로그인</button>
				<button class="joinBtn" onclick="location.href='../join'">회원가입</button>
			</div>
		</div>
	</body>
	<script>
		var userId="${sessionScope.userId}";
		var userIdx="${sessionScope.userIdx}";
		var manager="${sessionScope.manager}";
		var userData={};
		var teamData={};
		console.log(userId);
		console.log(userIdx);
		
		if(userId!=""){
			var url="../../main/userSearch";
			var data={};
			data.userId=userId;
			sendServer(url, data);
		}
		
		function logoId(){
			if(userId!=""){
				var url="../../main/userSearch";
				var data={};
				data.userId=userId;
				reqServer(url, data);
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
			if(manager==""){
				content+="<select>"
					+"<option value=0>내가 가입한 팀: </option>";
					for(var i=0; i<data.length; i++){
						content+="<option value="+data[i].t_idx+" >"+data[i].t_name+"</option>";
					}
					content+="</select>";
					content+=" "+name+" 님 안녕하세요";
			}
			else{
				content+=" <a href='../../main/manager/usManager'>"+manager+" 님 안녕하세요</a> ";
			}
			content+="<a href=../../main/logout?idx="+${sessionScope.userIdx}+" >로그아웃</a>";
			content+="  <a href=../../main/msgpage> 쪽지 </a>";
			$(".userMsg").empty();
			$(".userMsg").append(content);
		}
	</script>
</html>