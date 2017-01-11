<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<% String[] area = {"중구", "동구", "남구", "연수구", "남동구", "부평구", "계양구", "서구", "강화군", "옹진군"}; %>
<html>
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>팀만들기</title>
	
	<script src="https://code.jquery.com/jquery-3.1.0.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<style>
		.well{
			min-height: 510px;
		}
		.fil{
			height: 500px;
		}
		.thumbnail{
			width: 190px;
			height: 220px;
            margin-left: 10px;
            margin-bottom: 10px; 
		}
		#file{
			width: 100%;
			height: 100%;
		}
		#cen{
		 margin: 10px;
		}
		table{
			width: 100%;
		}
		th{
			text-align: right;
			padding-bottom: 5px;
			padding-right: 10px;
			width: 20%;
			/* border: 1px solid; */
		}
		td{
			padding-bottom: 10px;
			width: 60%;
			/*  border: 1px solid; */
		}
	</style>
</head>
<body>
	<jsp:include page="../../resources/include/logo.jsp" />
	<jsp:include page="../../resources/include/loginBox.jsp" />
	<jsp:include page="../../resources/include/nav.jsp" />
	<div class=" layer">
	<div class="page">
		<form action="./insertTeam" class="form-horizontal" id="mainForm" method="post" enctype="multipart/form-data" onsubmit="return CheckForm(this)">
		<div class="col2 content">
			<fieldset class="fil">
						<legend>팀 만들기</legend>
			<div class="thumbnail">
				<img id="file" src="../../main/resources/include/img/default1.png"/>
			</div>
			<div id="cen">
				<input type="file" name="file" id="imgInp" onchange="fileView(this)"/>
				<input id="fileName" type="hidden" name="fileName"/>
			</div>
			</fieldset>
		</div>
		<div class="col5 content"> 
            <div class="well bs-component">
			  <fieldset>
			  	<legend>팀만들기</legend>
			  		<table>
			  			<tr>
				  			<td colspan="3" style="text-align: center;">
				  				팀정보를 입력해 주세요. 모두 입력하셔야 가입이 가능합니다.
				  			</td>
			  			</tr>
			  			<tr>
			  				<th>팀명</th>
			  				<td>
			  					<input type="text" class="form-control" name="t_name" placeholder="팀명">
			  					<input type="hidden" name="u_idx" value="${sessionScope.userIdx}">
			  					<input type="hidden" name="u_name" value="${sessionScope.userName}">
			  				</td>
			  				<td style="padding-left: 10px;">
			  					<button type="button" onclick="overlay()" class="btn btn-default">중복체크</button>
			  				</td>
			  			</tr>
			  			<tr>
			  				<th>지역</th>
			  				<td>
			  					<select name="t_area" class="form-control">
								<c:set var="area" value="<%=area %>"></c:set>
									<c:forEach items="${area}" var="team" varStatus="gu">
										<option value="${gu.index}">${team}</option>
									</c:forEach>
								</select>
			  				</td>
			  				<th></th>
			  			</tr>
			  			<tr>
			  				<th>모임요일</th>
			  				<td>
				  				<input type="checkbox" name="t_day" value="월"/> 월&nbsp;
				  				<input type="checkbox" name="t_day" value="화"/> 화&nbsp;
				  				<input type="checkbox" name="t_day" value="수"/> 수&nbsp;
				  				<input type="checkbox" name="t_day" value="목"/> 목&nbsp;
				  				<input type="checkbox" name="t_day" value="금"/> 금&nbsp;
				  				<input type="checkbox" name="t_day" value="토" checked/> 토&nbsp;
				  				<input type="checkbox" name="t_day" value="일"/> 일&nbsp;
			  				</td>
			  				<th></th>
			  			</tr>
			  			<tr>
			  				<th>모임시간</th>
			  				<td>
			  					<input type="time" class="form-control" name="t_time" placeholder="모임시간" >
			  				</td>
			  				<th></th>
			  			</tr>
			  			<tr>
							<th>유형</th>
							<td>
								<select name="t_type" class="form-control">
									<option value="축구">축구</option>
									<option value="풋살">풋살</option>
								</select>
							</td>
						</tr>
			  			<tr>
							<th>연령대</th>
							<td><select name="t_age" class="form-control"></select></td>
						</tr>
			  			<tr>
			  				<th>유니폼색</th>
			  				<td>
			  					<input type="text" class="form-control" name="t_uniform" placeholder="유니폼색">
			  				</td>
			  				<th></th>
			  			</tr>
			  			<tr>
			  				<td colspan="3" style="text-align: center;">
			  				<button type="reset" class="btn btn-default">취소</button>
			        		<button type="submit" class="btn btn-primary">등록</button>
			  				</td>
			  			</tr>
			  		</table>
			  </fieldset>
			</div>
		</div>
		</form>
		<div class="col3 content">      
		<!-- 배너 -->
		</div>
		</div>
	</div>
	<jsp:include page="../../resources/include/footer.jsp" />
</body>
<script>
	var teamName = false;
	
	$(document).ready(function(){
		var frm = document.getElementById('mainForm');
		var no=0;
		for(var i=1; i<7; i++){
			for(var j=0; j<2; j++){
				var l = i+1;
				if(j<1){
					frm['t_age'].options[no] = new Option(i+'0대', i+'0대');
				}else{
					frm['t_age'].options[no] = new Option(i+'0대~'+l+'0대', i+'0대~'+l+'0대');
				}
				no++;
			}
		}
	});
	
	//파일이름추출
	function fileView(elem){
		console.log(elem);
		console.log(elem.value);
		var fullPath = elem.value;
		fileName = fullPath.substring(12);
		console.log(fileName);
		$("#fileName").val(fileName);
	}
	
	//파일변경시(이미지)
	$(function() {
        $("input[type=file]").on('change', function(){

    		file = $(this).attr("name");
    		console.log(file);
            readURL(this);
        });
    });
	
	//이미지 미리보기
    function readURL(input) {
        if (input.files && input.files[0]) {
        var reader = new FileReader();

        reader.onload = function (e) {
            	var img = "<img id='"+file+"' src='"+e.target.result+"' alt='"+fileName+"'/>";
        		$("#file").detach();   
                $(".thumbnail").append(img);              		
            }

          reader.readAsDataURL(input.files[0]);
        }$("#file").attr("src","../../main/resources/include/img/default1.png"); 
    }
	
	//팀명 변경시
    $("input[name=t_name]").change(function (){
		teamName = false;
	});
	
  	//중복체크
	function overlay(){
		var url="./tName";
		var data = {};
		var name = $("input[name=t_name]").val();
		if(teamName != false){
			alert("이미 중복확인 되었습니다.");
		}else{
			if(name==""){
				alert(" 팀명을 입력해주세요");
			}else{
				data.t_name = name;
				reqServer(url,data);
			}	
		}
	}
	
	function reqServer(url,data){
		$.ajax({
			url:url,
			type:"post",
			data:data,
			dataType:"json",
			success:function(d){
				console.log(d)
				if(d.use=="Y"){
					alert("사용가능한 팀명입니다.");
					teamName = true;
				}else{
					alert("사용 불가능한 팀명입니다.");
					$("input[name=t_name]").val("");
				}
			},error:function(e){
				console.log(e)
			}
		});
	}
	
	//submit체크
	function CheckForm(f){
		if($("input[name=t_name]").val()==""){
			alert("팀명을 입력해주세요");
			$("input[name=t_name]").focus();
		}else if(!teamName){
			alert("중복체크를 해주세요");
		}else if($("input[name=t_time]").val()==""){
			alert("모임시간을 입력 해주세요");
			$("input[name=t_time]").focus();
		}else if($("input[name=t_uniform]").val()==""){
			alert("유니폼색을 입력해주세요");
			$("input[name=t_uniform]").focus();
		}else{
		    return true; 
		}
		return false; 
	}
	</script>
</html>