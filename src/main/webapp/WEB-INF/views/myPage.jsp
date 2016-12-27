<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<html>
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>마이페이지</title>
	
	<script src="https://code.jquery.com/jquery-3.1.0.min.js"></script>
	<script src="resources/bootstrap/js/bootstrap.js"></script>
	<link rel="stylesheet" type="text/css" href="resources/bootstrap/css/bootstrap.css" />
	<style>
		table{
			width: 100%;
		}
		#myimporm th{
	        text-align: right;
	        padding-bottom: 10px;
	        padding-right: 10px;
	        width: 20%;
		}
		#myimporm td{
		  padding-bottom: 10px;
		   width: 30%;
		   height: 36px;
		   text-align: center;
		}
		#mypoin td{
			width: 6%;
			border: 1px solid;
			text-align: center;
			font-size: 14;
		}
	</style>
</head>
<body>
	<jsp:include page="../../resources/include/logo.jsp" />
	<jsp:include page="../../resources/include/nav.jsp" />
	<div class=" layer">
	<div class="page">
		<div class="col2 content">
		<!-- 배너 -->
		</div>
		<div class="col5 content"> 
            <div class="well bs-component">
			  <fieldset>
			  	<legend>마이페이지</legend>
			  		<table id="myimporm">
			  			<tr>
			  				<th>아이디</th>
			  				<td></td>
			  				<th>성명</th>
			  				<td></td>
			  			</tr>
			  			<tr>
			  				<th>성별</th>
			  				<td></td>
			  				<th>생년월일</th>
			  				<td></td>
			  			</tr>
			  			<tr>
			  				<th>핸드폰</th>
			  				<td></td>
			  				<th>이메일</th>
			  				<td></td>
			  			</tr>
			  			<tr>
			  				<td colspan="4">
				        		<button class="btn btn-primary" onclick="location='./userModify'">수정</button>
			  				</td>
			  			</tr>
			  		</table>
			  		<form id="mainForm">
				  		<div style="text-align: left;">
							내가 가입한 팀&nbsp;<select name="myTeam"></select>
			            </div>
			  		</form>
		  		 	<table id="mypoin">
		  		 	<thead>
		            <tr>
		            	<td style="width: 14%;">날짜</td>
		                <td style="width: 20%;">상대팀</td>
		                <td>득점</td>
		                <td>도움</td>
		                <td>공격포인트</td>
		                <td>슈팅</td>
		                <td>파울</td>
		                <td>경고</td>
		                <td>퇴장</td>
		                <td>코너킥</td>
		                <td>패널티킬</td>
		                <td>오프사이드</td>
		                <td>유효슈팅</td>
		            </tr>
		            </thead>
					<tbody id="mylistCall">
		           		<!-- 리스트가 출력될 영역 -->
		            </tbody>
		            <tr>
						<td colspan="6" id="paging">
							<div id="pagenation"></div>
						</td>
					</tr>
		        </table>
			  </fieldset>
			</div>
		</div>
		<div class="col3 content">      
		<!-- 배너 -->
		</div>
		</div>
	</div>
	<jsp:include page="../../resources/include/footer.jsp" />
	</body>
	<script>
	 function listCall(){
          $.ajax({
             type : "get",
             url : "./mylistCall",
             dataType : "json",
             success : function(d){
                console.log(d);
                /* 함수 하나 만들어서 d.list 전달 */
                printList(d.list);
             }, error : function(e){
                console.log(e);
             }       
          });
       }
	 
	function printList(list){
		console.log(list); 
		$("#mylistCall").empty();
		var content = "";
		
		for(var i=0; i<list.length; i++){
			content +="<tr>"
			+"<td>"+list[i].p_date+"</td>"
			+"<td>"+list[i].t_idx+"</td>"
			+"<td>"+list[i].p_offside+"</td>"
			+"<td>"+list[i].p_effectshot+"</td>"
			+"<td>"+list[i].p_goal+"</td>"
			+"<td>"+list[i].p_assist+"</td>"
			+"<td>"+list[i].p_atkpoint+"</td>"
			+"<td>"+list[i].p_shoot+"</td>"
			+"<td>"+list[i].p_poul+"</td>"
			+"<td>"+list[i].p_warning+"</td>"
			+"<td>"+list[i].p_off+"</td>"
			+"<td>"+list[i].p_ck+"</td>"
			+"<td>"+list[i].p_pk+"</td>"
			+"</tr>"
		}
		$("#list").append(content);
	}
	
	
	</script>
</html>