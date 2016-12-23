<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<% String[] area = {"중구", "동구", "남구", "연수구", "남동구", "부평구", "계양구", "서구", "강화군", "옹진군"}; %>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>로그인 페이지</title>
		<script src="https://code.jquery.com/jquery-3.1.0.min.js"></script>
		<script src="../../main/resources/bootstrap/js/bootstrap.js"></script>
		<link rel="stylesheet" type="text/css" href="../../main/resources/bootstrap/css/bootstrap.css" />
		<style>		
			.detailTable{
				width: 100%;
			}
			.subject{
				width: 15%;
				text-align: center;
			}
			input[type='text']{
				display: block;
				width: 100%;
				height: 34px;
				padding: 6px 12px;
				font-size: 14px;
				
			}
			textarea{
				width:100%;
				resize:none;
				font-size: 14px;
			}
			.detailTable th,td{
				width:25%;
				height: 36px;
			}
			.map{
				height: 300px;
			}
			#popup{
				width: 100%;
				height: 300px;
				background-color: white;
				display:none;
				overflow: auto;
			}
			.sel td,th{
				text-align: center;
			}
		</style>
	</head>
	<body>
		<jsp:include page="../../resources/include/logo.jsp" />
		<jsp:include page="../../resources/include/loginBox.jsp" />
		<jsp:include page="../../resources/include/nav.jsp" />
		<div class=" layer">
			<div class="page">
				<div class="col2 content">
					<fieldset>
				  		<legend>매칭게시판</legend>
				  	</fieldset>
				</div>
				<div class="col5 content">
				<fieldset>
					<legend>글쓰기</legend>
				</fieldset>
					<form action="write" method="post" id="mainForm" name="writeForm" onSubmit="writeCheck();return false">
						<table class="detailTable">
								<tr class="borderTop">
									<td colspan="4">
										<input type="text" name="mch_title" placeholder="제목"/>
									</td>
								</tr>
								<tr class="borderTop">
									<td colspan="4" class="messenger">
										<select name="team_info">
											<c:forEach items="${teamList}" var="team">
												<option value="${team.t_idx}/${team.t_name}">${team.t_name}</option>
											</c:forEach>
										</select>
									</td>
								</tr>
								<tr class="borderTop">
									<th>경기날짜</th>
									<td><input type="date" name="mch_date" value="" /></td>
									<th>경기시간</th>
									<td><input type="time" name="mch_time" value=""/></td>
								</tr>
								<tr class="borderTop">
									<th>유형</th>
									<td><select name="mch_type"></select></td>
									<th>연령대</th>
									<td><select name="mch_age"></select></td>
								</tr>
								<tr class="borderTop">
									<td colspan="4">
										<textarea rows="17" name="mch_content"></textarea>
									</td>
								</tr>
								<tr class="borderTop">
									<td><button type="button" class="btn btn-info" name="area">운동장 선택</button></td>
								</tr>
								<tr>
									<td colspan="4" class="map">
										<div id="popup">
										<!-- 장소목록 -->	
											<table class="sel" width="100%">
												<thead>
													<tr>
														<td colspan="4">
															<select name="mch_area">
															<c:set var="area" value="<%=area %>"></c:set>
																<c:forEach items="${area}" var="team" varStatus="gu">
																	<option value="${gu.index}">${team}</option>
																</c:forEach>
															</select>
														</td>
													</tr>
													<tr class="borderTop">
														<th>no</th>
														<th>운동장</th>
														<th>주소</th>
														<th>선택</th>
													</tr>
													</thead>
													<tbody class="areaList">
													<tr class="borderTop">
														
													</tr>
												</tbody>	
											</table>
										</div>
										<div class="popMap">
											<jsp:include page='../../resources/include/mapSearch.jsp' />
										</div>
									</td>
								</tr>
								<tr class="borderTop">
									<td colspan="4" style="text-align: center;">
					  				<button type="reset" class="btn btn-default">취소</button>
					        		<button type="submit" class="btn btn-primary" >등록</button>
			  				</td>
								</tr>
						</table>
					</form>
				</div>
				<div class="col3 content">      
				<!-- 배너 -->
				</div>
			</div>
		</div>	
		<jsp:include page="../../resources/include/footer.jsp" />
	</body>
	<script>
	var url="";
	var data={};
	var areaCheck=false;
	var userIdx="${sessionScope.userIdx}";
	
	
	$(".btn-info").click(function(){
		url="../match/areaList";
		$("#popup").slideToggle("slow",function(){
			var flag=$("#popup").css("display");
			console.log(flag);
			if(flag=="block"){
				reqServer(url, data);
			}
		});
	});
	
	$("select[name='gu']").change(function(){
		console.log("구 변경");
		var url="../match/selectAreaList";
		var data={};
		data.area=$("select[name='area']").val();
		
	});
	
	function reqServer(url, data){
		console.log(url);
		console.log(data);
		$.ajax({
			url:url,
			type:"post",
			data:data,
			dataType:"JSON",
			success:function(data){
				console.log(data);
				if(url=="../match/areaList"){
					printArea(data.area);
				}
			},
			error:function(error){
				console.log(error);
			}
		});
	}
	
	$(".cancel").click(function(){
		$("#popup").slideUp("slow",function(){
			
		});
	});
	$(document).ready(function(){
		var frm = document.getElementById('mainForm');
		var no=0;
		var valCnt=0;
		
		frm['mch_type'].options[0] = new Option('축구', 1);
		frm['mch_type'].options[1] = new Option('풋살', 2);
		for(var i=1; i<7; i++){
			for(var j=0; j<2; j++){
				var l = i+1;
				valCnt++;
				if(j<1){
					frm['mch_age'].options[no] = new Option(i+'0대', valCnt);
				}else{
					frm['mch_age'].options[no] = new Option(i+'0대~'+l+'0대', valCnt);
				}
				no++;
			}
		}
	});
	
	$(".btn-primary").click(function(){
		var mch_date=$("input[type='date']").val();
		console.log(mch_date);
		
		var mch_time=$("input[type='time']").val();
		console.log(mch_time);
	});
	
	function printArea(list){
		var content="";
		for(var i=0; i<list.length; i++){
			content+="<tr>"
				+"<td>"+list[i].a_idx+"</td>"
				+"<td class='ground"+i+"'>"+list[i].a_ground+"</td>"
				+"<td>"+list[i].a_address+"</td>"
				+"<td>"+"<input type='radio' name='areaInfo' onclick='checkMap("+list[i].a_lat+", "+list[i].a_lng+", "+i+")' value='"+list[i].a_lat+"/"+list[i].a_lng+"/"+list[i].a_ground+"' />"+"</td>"
				+"</tr>";
			}
			
			$(".areaList").empty();
			$(".areaList").append(content);
	}
	
	function checkMap(lat, lng, i){
		console.log(lat, lng);
		console.log($("input[name='position']:checked").val());
		areaSearch(lat, lng);
		
		areaCheck=true;
	}
	
	
	function writeCheck(){
		console.log(areaCheck);
		var test=$("select[name='team_info']").value;
		console.log("select:"+test);
		
		if(document.writeForm.mch_title.value==""){
			alert("제목을 입력해주세요");
			document.writeForm.mch_title.focus();
		}else if(document.writeForm.team_info.value==""){
			alert("팀을 입력해주세요");
			document.writeForm.team_info.focus();
		}else if(document.writeForm.mch_date.value==""){
			alert("경기날짜를 입력해주세요");
			document.writeForm.mch_date.focus();
		}else if(document.writeForm.mch_time.value==""){
			alert("경기시간을 입력해주세요");
			document.writeForm.mch_time.focus();
		}else if(document.writeForm.mch_content.value==""){
			alert("내용을 입력해주세요");
			document.writeForm.mch_content.focus();
		}else if(areaCheck==false){
			alert("운동장을 입력해주세요");
			document.writeForm.area.focus();
		}else{
			
			 document.writeForm.submit(); 
			return true; 
		}
	}
	</script>
</html>