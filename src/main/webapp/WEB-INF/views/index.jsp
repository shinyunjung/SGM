<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
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
            }
            
            .login .txt {
                padding-top: 30%
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
									<td colspan="4">
										<h4><b>매칭보드</b></h4>
									</td>
								</tr>
								<tr>
									<th>글쓴이</th>
									<th class="center">제목</th>
									<th class="center">날짜</th>
									<th>상태</th>
								</tr>
							</thead>
							<tbody>
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
						<table class="loginBox">
							<tr>
								<td class="loginBox"><input type="text" placeholder="아이디"/></td>
								<td class="loginBox" rowspan="2">
									<div class="login">
										<div class="txt">로그인</div>
									</div>
								</td>
							</tr>
							<tr>
								<td class="loginBox"><input type="password" placeholder="비밀번호"/></td>
							</tr>
							<tr>
								<td class="loginBox" colspan="2">
									<a>회원가입	</a>
									<a>아이디</a>/<a>비밀번호 찾기</a>
								</td>
							</tr>
							<tr>
								<td class="loginBox" colspan="2">
									카카오톡 로그인
								</td>
							</tr>
						</table>
					
				      
		    	</div>
		  </div>
		  </div>
	
	
	<jsp:include page="../../resources/include/footer.jsp" />
		
		
	</body>
	<script></script>
</html>