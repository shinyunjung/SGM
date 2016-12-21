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
		
			#logo{
				width: 1080px;
				text-align: center;
				font-size: large;
				display: inline-block;
				margin: 0 auto;
				margin-bottom: 20px;
			}
			
			.userMsg{
				width: 1080px;
				text-align: right;
			}
			#logoImg{
				width: 300px;
				height: 100px; 
			}
		/**관리 게시판 위치**/
			#Manager{
				position: absolute;
				left: 270px;
				top: 300px;
			}
			.layer{
				width: auto;
				text-align: center;
			}
	
			.page {
				height: auto;
				width: 1080px;
				/* border: 1px solid; */
				display: inline-block;
				margin: 0 auto;
			} 
			.col2{
				width:20%;
				padding-top: 30px;
			}
			.col5{
				width: 60%;
				text-align: center;
				padding-left: 1%;
				padding-right: 1%;
				/* border: 1px solid; */
			}
			.col3{
				width: 20%;
			}
		    
				
			.content {
				height: auto;
				/* border: 1px solid; */
	            float: left;
	    	}
			
		/**게시판 스타일**/
			.totalTable{
				width: 700px;
				text-align: center;
				border-bottom: 1px solid silver;
			}
			
		/**검색 스타일(글작성 없음)**/	
			#searchManager{
				width: 970px;
				text-align: right;
			}
		
		/**검색 스타일(글작성 있음)**/	
			#searchList{
				position: absolute;
				left: 270px; 
				width: 700px;
			}
			
		/**border 한방향 스타일**/
			.borderLeft{
				border-left: 1px solid;
			}
			.borderRight{
				border-right: 1px solid;
			}
			.borderBottom{
				border-bottom: 1px solid;
			}
			.borderTop{
				border-top: 1px solid;
			}	
			
		/**텍스트 위치 스타일**/
		.right{
			text-align: right;
		}
		.left{
			text-align: left;
		}
		.center{
			text-align: center;
		}	
		</style>
	</head>
	<body>
		<div class="layer">
			<div id="logo" >
				 <a href="../index"><img id="logoImg" src="../../main/resources/include/img/logo.jpg" /></a>
			</div>
			<div class="userMsg">
				
			</div>
		</div>
	</body>
	<script>
		var userId="${sessionScope.userId}";
		var userIdx="${sessionScope.userIdx}";
		var userData={};
		var teamData={};
		console.log(userId);
		console.log(userIdx);
		if(userId!=""){
			var url="../../main/userSearch";
			var data={};
			data.userId=userId;
			reqServer(url, data);
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
			reqServer(url, data); 
		}
		
		function reqServer(url, data){
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
			content+="<select>"
			+"<option value=0>내가 가입한 팀: </option>";
			for(var i=0; i<data.length; i++){
				content+="<option value="+data[i].t_idx+" >"+data[i].t_name+"</option>";
			}
			content+="</select>";
			content+=" "+name+" 님 안녕하세요";
			$(".userMsg").empty();
			$(".userMsg").append(content);
		}
	</script>
</html>