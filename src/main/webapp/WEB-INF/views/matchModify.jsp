<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>로그인 페이지</title>
		<script src="https://code.jquery.com/jquery-3.1.0.min.js"></script>
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
		     	position:absolute;
				z-index:2;
				width: 300px;
				height: 300px;
				background-color: white;
				display:none;
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
					<legend>글수정</legend>
				</fieldset>
					<form action="modify" method="post" id="mainForm">
						<table class="detailTable">
								<tr class="borderTop">
									<td colspan="4">
										<input type="text" name="mch_title" value="${detail.mch_title}" />
										<input type="hidden" name="mch_idx" value="${detail.mch_idx}" />
									</td>
								</tr>
								<tr class="borderTop">
									<td colspan="4" class="messenger"></td>
								</tr>
								<tr class="borderTop">
									<th>경기날짜</th>
									<td><input type="date" name="mch_date" value="${detail.mch_date}" /></td>
									<th>경기시간</th>
									<td><input type="time" name="mch_time" value="${detail.mch_time}"/></td>
								</tr>
								<tr class="borderTop">
									<th>유형</th>
									<td><select name="mch_type" ></select></td>
									<th>연령대</th>
									<td><select name="mch_age"></select></td>
								</tr>
								<tr class="borderTop">
									<td colspan="4">
										<textarea rows="17" name="mch_content">${detail.mch_content}</textarea>
									</td>
								</tr>
								<tr class="borderTop">
									<td><button type="button" class="btn btn-info">운동장 선택</button></td>
								</tr>
								<tr>
									<td colspan="4" class="map">
										<div id="popup">
										<!-- 장소목록 -->	
											<table class="sel">
												<thead>
													<tr>
														<td colspan="4" style="text-align: right;">
															<b class="cancel">X</b>
														</td>
													</tr>
													<tr>
														<td colspan="4">
															<select name="gu"></select>
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
					        		<button type="submit" class="btn btn-primary">등록</button>
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
	var userIdx="${sessionScope.userIdx}";
	var change=false;
	$("document").ready(function(){
		console.log(userIdx);
		selectTeam(userIdx);
		var position="${detail.mch_lat}"+"/"+"${detail.mch_lng}";
		console.log(position);
		areaSearch("${detail.mch_lat}", "${detail.mch_lng}");
		$("input [name='position']").attr("checked",true);
		
	});
	
	$(document).ready(function(){
		var frm = document.getElementById('mainForm');
		var no=0;
		var valCnt=0;
		var age="${detail.mch_age}";
		var type="${detail.mch_type}";
		console.log(age+"/"+type);
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
		
	});
	
	
	
	
	
	
	function selectTeam(idx){
		url="../selectTeam";
		data.idx=idx;
		reqServer(url, data);
	}
	
	
	$(".btn-info").click(function(){
		url="../match/areaList";
		$("#popup").css("display","block");
		var frm = document.getElementById('mainForm');
		for (var i=0; i<10; i++) {
			frm['gu'].options[i] = new Option(i+1, i+1);
		}
		reqServer(url, data);
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
				}else if(url=="../selectTeam"){
					console.log("수정페이지에서 함");
					console.log(data.userTeam);
					printSelect(data.userTeam);
				}
			},
			error:function(error){
				console.log(error);
			}
		});
	}
	
	$(".cancel").click(function(){
		$("#popup").css("display","none");
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
				+"<td>"+list[i].a_ground
				+"<input type='hidden' name='ground' value='"+list[i].a_ground+"' /></td>"
				+"<td>"+list[i].a_address+"</td>"
				+"<td>"+"<input type='radio' name='position' onclick='checkMap("+list[i].a_lat+", "+list[i].a_lng+")' value='"+list[i].a_lat+"/"+list[i].a_lng+"' />"+"</td>"
				+"</tr>";
			}
			
			$(".areaList").empty();
			$(".areaList").append(content);
	}
	
	function checkMap(lat, lng){
		console.log(lat, lng);
		console.log($("input[name='position']:checked").val());
		areaSearch(lat, lng);
	}
	
	function printSelect(data){
		var content="";
		var t_idx="${detail.t_idx}";
		content+="<input type='hidden' name='mch_name' value="+data[0].t_name+" />";
		content+="<select name='t_idx' class='select' onchange='teamValue()'>";
		for(var i=0; i<data.length; i++){
			content+="<option value="+data[i].t_idx+"  >"+data[i].t_name+"</option>";
		}
		content+="</select>";
		$(".messenger").empty();
		$(".messenger").append(content);
		$("select[name='t_idx'] option:eq("+(t_idx-1)+")").attr("selected","selected");
	}
	
	function teamValue(){
		var input = document.getElementsByName("mch_name");
		var value = $("select[name='t_idx']").val();
		var t_name=$("option[value='"+value+"']").html();
		input.value=t_name;
		
	}
	</script>
</html>