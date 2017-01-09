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
			#content{
				width: 100%;
				min-height: 300px;
				font-size: 14px;
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
			input[name='areaInfo']{
				display: none;
			}
			
		</style>
	</head>
	<body>
		<jsp:include page="../../resources/include/logo.jsp" />
		
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
					<legend>글 수정</legend>
				</fieldset>
					<form action="modify" method="post" id="mainForm" name="modifyForm" onSubmit="modifyCheck();return false" >
						<table class="detailTable">
								<tr class="borderTop">
									<td colspan="4">
										<input type="text" name="mch_title" value="${detail.mch_title}"/>
										<input type="hidden" name="mch_idx" value="${detail.mch_idx}" />
										<input type="text" name="areaInfo" value="${detail.mch_lat}/${detail.mch_lng}/${detail.mch_ground}"/>
									</td>
								</tr>
								<tr>
									<td>VS ${detail.mch_name}</td>
								</tr>
								<tr class="borderTop">
									<th>경기날짜</th>
									<td><input type="date" name="mch_date" value="${detail.mch_date}" /></td>
									<th>경기시간</th>
									<td><input type="time" name="mch_time" value="${detail.mch_time}"/></td>
								</tr>
								<tr class="borderTop">
									<th>유형</th>
									<td><select name="mch_type"></select></td>
									<th>연령대</th>
									<td><select name="mch_age"></select></td>
								</tr>
								<tr class="borderTop">
									<td colspan="4">
										<div id="content" contenteditable="true" ondrop="drop(event)" ondragover="allowDrop(event)">${detail.mch_content }</div>
										<input type="hidden" name="mch_content"/>
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
					  				<input type="reset" class="btn btn-default" value="취소">
					        		<input type="submit" class="btn btn-primary" value="등록">
			  				</td>
								</tr>
						</table>
					</form>
				</div>
				<div class="col3 content">      
				<!-- 배너 -->
					<jsp:include page="../../resources/include/loginBox.jsp" />
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
	var teamList="${teamList}";
	var position="${detail.mch_lat}"+"/"+"${detail.mch_lng}"+"/"+"${detail.mch_ground}";
	
	
	$("document").ready(function(){
		console.log("document시작")
		var frm = document.getElementById('mainForm');
		var no=0;
		var valCnt=0;
		var age="${detail.mch_age}";
		var type="${detail.mch_type}";
		var t_idx="${detail.t_idx}";
		
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
		$("select[name='mch_age'] option:eq("+(age-1)+")").attr("selected","selected");
		$("select[name='mch_type'] option:eq("+(type-1)+")").attr("selected","selected");
		
		areaSearch("${detail.mch_lat}", "${detail.mch_lng}");
		$("select[name='team_info'] option:eq("+(t_idx-1)+")").attr("selected","selected");
		console.log($("select[name='team_info']"));
		areaInfo.value=position;
		
	});
	
	
	
	
	
	
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
				+"<td>"+"<input type='radio' name='areaInfoRadio' onclick='checkMap("+list[i].a_lat+", "+list[i].a_lng+", "+i+")' value='"+list[i].a_lat+"/"+list[i].a_lng+"/"+list[i].a_ground+"' />"+"</td>"
				+"</tr>";
			}
			
			$(".areaList").empty();
			$(".areaList").append(content);
			$("input [name='areaInfo']").attr("checked", true);
	}
	
	function checkMap(lat, lng, i){
		console.log(lat, lng);
		var test = $("input[name='areaInfoRadio']:checked").val();
		areaSearch(lat, lng);
		
		console.log(test);
		$("input[name='areaInfo']").val(test);
		areaCheck=true;
	}
	
	
	
	function modifyCheck(){
		console.log(areaInfo);
		
		if(document.modifyForm.mch_title.value==""){
			alert("제목을 입력해주세요");
			document.modifyForm.mch_title.focus();
		}else if(document.modifyForm.team_info.value==""){
			alert("팀을 입력해주세요");
			document.modifyForm.team_info.focus();
		}else if(document.modifyForm.mch_date.value==""){
			alert("경기날짜를 입력해주세요");
			document.modifyForm.mch_date.focus();
		}else if(document.modifyForm.mch_time.value==""){
			alert("경기시간을 입력해주세요");
			document.modifyForm.mch_time.focus();
		}else if($("#content").html()==""){
			alert("내용을 입력해주세요");
			$("#content").focus();
		}else{
			var text = $("#content").html();
			$("input[name=mch_content]").val(text);
			console.log($("input[name=mch_content]").val());
			document.modifyForm.submit(); 
			return true; 
		}
	}
	
	</script>
</html>