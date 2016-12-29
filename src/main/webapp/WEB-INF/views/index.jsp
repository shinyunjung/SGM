<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
  <title>Bootstrap Example</title>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <style>
   			 .table{
                width: 100%;
                text-align: center;
                border-bottom: 1px solid silver;
            }
            .login {
                /* width: 50px;
                height: 50px; */
                text-align: center;
                border: 1px solid;
                padding-top: 30%
            }
            
            .userLogin{
            	border: 1px solid black;
            	height: 100px;
            }
            
            .loginBox{
                border: 1px solid;
                border-collapse: collapse;
                padding: 5px;
            }
            
            .matching{
                background-color: orange;
            }
            
            
            
            #nowGame{
                border: 1px solid brown;
                width: 100%;
            }
            
            a{
                cursor:pointer;
            }
            
            th{
                text-align: center;
                background-color: silver;
            }
		</style>
	</head>
	<body>
		<jsp:include page="../../resources/include/logo.jsp" />
		<jsp:include page="../../resources/include/nav.jsp" />
		   <div class=" layer">
			<div class="page">
			    <div class="col2 content">

			    </div>
			    <div class="col5 content"> 
			      <!-- 매칭 리스트 -->
					<div id="board">
						<table class="table table-hover">
							<thead>
								<tr class="matching">
									<td colspan="5">
										<h4><b>매칭보드</b></h4>
									</td>
								</tr>
								<tr>
									<th>번호</th>
									<th>글쓴이</th>
									<th class="center">제목</th>
									<th class="center">날짜</th>
									<th>상태</th>
								</tr>
							</thead>
							<tbody id="list">
								<tr>
									<td>ddddd</td>
									<td class="center">fdsfdsfsdfsdfdsfsdfsdf</td>
									<td class="center">12/02</td>
									<td>상대대기</td>
								</tr>
								<tr>
									<td>글쓴이</td>
									<td class="center">제목</td>
									<td class="center">날짜</td>
									<td>상태</td>
								</tr>
								<tr>
									<td>글쓴이</td>
									<td class="center">제목</td>
									<td class="center">날짜</td>
									<td>상태</td>
								</tr>
								<tr>
									<td>글쓴이</td>
									<td class="center">제목</td>
									<td class="center">날짜</td>
									<td>상태</td>
								</tr>
								<tr>
									<td>글쓴이</td>
									<td class="center">제목</td>
									<td class="center">날짜</td>
									<td>상태</td>
								</tr>
							</tbody>
						</table>
					</div>
					
					<!-- 현재 진행중인 경기 -->
					<div id="nowGame">
						<table>
							<tr>
								<td>게임 진행중인 경기장</td>
							</tr>
							<tr>
								<td>경기중인 팀</td>
							</tr>
						</table>
					</div>
			    </div>
			    <div class="col3 content">
				      
				      <!-- 로그인 box -->
				      <c:if test="${sessionScope.userId==null}">
					      <form action="login" method="post" id="login">
							<table class="loginBox">
								<tr>
									<td class="loginBox">
										<input type="text" name="u_id" size="12" placeholder="아이디"/>
									</td>
									<td class="loginBox" rowspan="2">
											<div class="txt"><input type="submit" value="로그인"></div>
									</td>
								</tr>
								<tr>
									<td class="loginBox">
										<input type="password" name="u_pass" size="12" placeholder="비밀번호"/>
									</td>
								</tr>
								<tr>
									<td class="loginBox" colspan="2">
										<a href="./joinForm">회원가입</a><br/>
										<a href="./idFind">아이디 찾기</a>/<a href="./passFind">비밀번호 찾기</a>
									</td>
								</tr>
								<tr>
									<td class="loginBox" colspan="2">
										<jsp:include page="../../resources/include/kakao.jsp" />
									</td>
								</tr>
							</table>
						</form>
					</c:if>
					<c:if test="${sessionScope.userId!=null}">
						<div class="userLogin">
							
						</div>
					</c:if>
		    	</div>
		  </div>
		  </div>
		  <jsp:include page="../../resources/include/footer.jsp" />
	</body>
	<script>
		var user="${sessionScope.userId}";
		console.log(user);
		var currPage=1;//현재 페이지
		
		var msg="";
		msg="${msg}";
		if(msg!=""){
			alert(msg);
		}
		
		if(user!=""){
			var url="./userSearch";
			var data={};
			data.userId=user;
			sendServer(url, data);
		}
			
		$("document").ready(function(){
			listCall(currPage);
		});
			
		function listCall(currPage){
			var url="../../main/match/listCall";
			var data={};
			data.count=6;
			sendServer(url, data);
		}
		
		
			function selectTeam(u_idx){
				console.log("selectTeam");
				var url="./selectTeam";
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
						if(url=="./userSearch"){
							console.log("유저확인");
							selectTeam(data.user.u_idx);
							userData=data.user;
							console.log(userData);
						}else if(url=="./selectTeam"){
							console.log("팀정보 확인");
							teamData=(data.userTeam);
							console.log(teamData.length);
							printUser(userData.u_name, teamData);
							
						}else if(url=="../../main/match/listCall"){
							console.log("매칭리스트");
							printList(data.list);
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
				content+=" "+"<a href='myPage?id=${sessionScope.userId}'>"+name+"</a> 님 안녕하세요<br/>";	
					content+="<select>"
						+"<option value=0>내가 가입한 팀: </option>";
						for(var i=0; i<data.length; i++){
							content+="<option value="+data[i].t_idx+" >"+data[i].t_name+"</option>";
						}
						content+="</select>";
				content+="<div class='center'><a href='./teamJoin'>팀 생성</a></div>"		
				$(".userLogin").empty();
				$(".userLogin").append(content);
			}
			
			function printList(list){
				var content="";
				for(var i=0; i<list.length; i++){
					content+="<tr>"
						+"<td>"+list[i].mch_idx+"</td>"
						+"<td>"+list[i].mch_name+"</td>"
						+"<td><a href='../../main/match/matchDetail?idx="+list[i].mch_idx+"'>"+list[i].mch_title+"</a></td>"
						+"<td>"+list[i].mch_vcount+"</td>"
						+"<td>"+list[i].mch_state+"</td>"
						+"</tr>";
					}
					
					$("#list").empty();
					$("#list").append(content);
				}
			
	</script>
</html>