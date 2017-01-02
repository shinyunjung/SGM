<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<% String[] area = {"중구", "동구", "남구", "연수구", "남동구", "부평구", "계양구", "서구", "강화군", "옹진군"}; %>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Insert title here</title>
		<script src="https://code.jquery.com/jquery-3.1.0.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
		<style>
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
				width:100%; 
				height: 100%;
			}
			#cen{
			 margin: 10px;
			}
			table{
				width: 100%;
			}
			#team th{
				text-align: right;
				padding-bottom: 5px;
				padding-right: 10px;
				width: 20%;
				/* border: 1px solid; */
			}
			#team td{
				padding-bottom: 10px;
				width: 60%;
				height: 36px;
				/*  border: 1px solid; */
			}
			.table th,.table td{
				text-align: center;
			}
			input[name="u_id"],
			input[name="m_name"],
			input[name="m_position"]{
				width: 80px;
			}
			#leader{
				height: 30px;
			}
		</style>
	</head>
	<body>
		<jsp:include page="../../resources/include/logo.jsp" />
		<jsp:include page="../../resources/include/nav.jsp" />
		<div class="layer">
			<div class="page">
			<form action="./teamUpdate" class="form-horizontal" id="mainForm" method="post" enctype="multipart/form-data" onsubmit="return CheckForm(this)">
				<!-- 첫 번째 구역 -->
				<div class="col3 content">
					<fieldset class="fil">
						<legend>${team.t_name}</legend>
						<div class="thumbnail"></div>
						<div id="cen">
						<input type="file" name="file" id="imgInp" onchange="fileView(this)"/>
						<input id="fileName" type="hidden" name="fileName"/>
						</div>
					</fieldset>
				</div>
				
				<!-- 두 번째 구역 -->
				<div class="col5 content">
				<div class="well bs-component">
			 	<fieldset>
			  	<legend>팀정보수정</legend>
			  		<table id="team">
			  			<tr>
			  				<th>팀명</th>
			  				<td>${team.t_name}</td>
			  				<td></td>
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
				  				<input type="checkbox" name="t_day" value="토"/> 토&nbsp;
				  				<input type="checkbox" name="t_day" value="일"/> 일&nbsp;
			  				</td>
			  				<th></th>
			  			</tr>
			  			<tr>
			  				<th>모임시간</th>
			  				<td>
			  					<input type="time" class="form-control" value="${team.t_time}" >
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
			  					<input type="text" class="form-control" value="${team.t_uniform}">
			  				</td>
			  				<th></th>
			  			</tr>
			  			<tr>
			  				<td colspan="3" style="text-align: center;">
			        		<button type="submit" class="btn btn-primary">등록</button>
			  				</td>
			  			</tr>
			  		</table>
			  </fieldset>
			</div>
			</div>
		</form>
			<div class="col5 content">
			<div class="member">
				-------------------------------------------------------------------------------------------------------------------------	
				<table class="table">
					<thead id="member">
						<tr>
							<th>멤버 리스트</th>
							<th colspan="2"></th>
							<th colspan="3" >
								<span>
									<b>팀대표</b>
									<select id="leader">
									<c:forEach items="${member}" var="mem">
									<c:if test="${mem.u_idx!=null}">
									<option value="${mem.m_idx}">${mem.m_name}</option>
									</c:if>
									</c:forEach>
									</select>
									<button type="button" onclick="change()">변경</button>
								</span>
							</th>
							<th>
								<button class="btn btn-default">추가</button>
							</th>
						</tr>
						<tr>
							<th>아이디</th>
							<th style="width: 100px;">이름</th>
							<th style="width: 100px;">포지션</th>
							<th>총점</th>
							<th>경기수</th>
							<th>삭제</th>
							<th>등록</th>
						</tr>
					</thead>
					<tbody class="mem">
						<c:forEach items="${member}" var="mem" varStatus="num">
						<tr>
						<c:if test="${mem.u_idx!=null}">
							<td>
							<input type="text" name="u_id" value="${mem.u_id}" readonly>
							<input type="hidden" name="m_idx" value="${mem.m_idx}">
							</td>
						</c:if>
						<c:if test="${mem.u_idx==null}">
							<td>
							<input type="text" name="u_id" value="">
							<input type="hidden" name="m_idx" value="${mem.m_idx}">
							</td>
						</c:if>
							<td>${mem.m_name}</td>
							<td><input type="text" name="m_position" value="${mem.m_position}"></td>
							<td>${mem.m_tpoint}</td>
							<td>${mem.m_matchcount}</td>
							<td><button onclick="memDel(${num.index})" class="btn btn-primary">삭제</button></td>
							<td><button onclick="memUp(${num.index})" class="btn btn-success">등록</button></td>
						</tr>
						</c:forEach>
					</tbody>	
				</table>	
			</div>
		</div>
		</div>
		</div>			
		<jsp:include page="../../resources/include/footer.jsp" />		
	</body>
	<script>
	var t_idx = "${team.t_idx}"
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
		
		var img = "<img id='file' src='../../main/resources/upload/${team.t_newPicture}' alt='${team.t_oldPicture}'/>";   
        $(".thumbnail").append(img);
        var day = "${team.t_day}";
        var t_day = day.split(","); 
        for(var i=0; i<t_day.length; i++){
        	$("input[value='"+t_day[i]+"']").attr("checked",true);
        }
        $("select[name='t_area'] option:contains('${team.t_area}')").attr("selected", "selected");
        $("select[name='t_age'] option[value='${team.t_age}']").attr("selected", "selected");
        $("select[name='t_type'] option[value='${team.t_type}']").attr("selected", "selected");
        console.log("${member[2].m_name}");
	});
	$(".btn-default").click(function(){
		var num = $("input[name=m_idx]").length;
		if(num<25){
			$(this).toggleClass("ex");            
	        sw = $(this).hasClass("ex");            
			if(sw == true){
				$(this).text("취소");
				
				$(".mem").append(
						"<tr id='add'><td><input type='text' name='u_id'></td>"
						+"<td><input type='text' name='m_name'></td>"
						+"<td><input type='text' name='m_position'></td>"
						+"<td>0</td>"
						+"<td>0</td>"
						+"<td></td>"
						+"<td><button onclick='memAdd("+num+")' class='btn btn-success'>등록</button></td></tr>"
				);
			}else{
				$(this).text("추가");
				$("#add").detach();
			}
		}else{
			alert("더 이상 추가하실 수 없습니다.");
		}
		
	});
	
	//멤버 등록
	function memAdd(num){
		var url="./memberAdd";
		var data = {};
		data.u_id = $("input[name='u_id']").eq(num).val();
		data.t_idx = t_idx;
		data.m_name = $("input[name='m_name']").val();
		data.m_position = $("input[name='m_position']").eq(num).val();
		reqServer(url,data);
	}
	
	//멤버삭제
	function memDel(num){
		var url="./memberDel";
		var data = {};
		data.m_idx = $("input[name='m_idx']").eq(num).val();
		data.t_idx = t_idx;
		reqServer(url,data);
	}
	
	//멤버 수정
	function memUp(num){
		var url="./memberup";
		var data = {};
		data.t_idx = t_idx;
		data.u_id = $("input[name='u_id']").eq(num).val();
		data.m_idx = $("input[name='m_idx']").eq(num).val();
		data.m_position = $("input[name='m_position']").eq(num).val();
		reqServer(url,data);
	}
	
	//대표변경
	function change(){
		var url="./leader";
		var data = {};
		data.m_idx = $("#leader").val();
		data.t_idx = t_idx;
		reqServer(url,data);
	}
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
        }$("#"+file).detach(); 
    }
	
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
				alert(d.msg);
				if(url == "./memberAdd"||url == "./memberDel"){
					printList(d.list.member);
				}
			},error:function(e){
				console.log(e)
			}
		});
	}
	
	//멤버목록그리기
	function printList(list){
		console.log(list);
		var content = "";
		for(var i=0; i<list.length; i++){
			console.log(list[i].u_idx);
			content += "<tr>";
			if(list[i].u_idx!=null){
				content += "<td><input type='text' name='u_id' value='"+list[i].u_id+"' readonly>"
						+"<input type='hidden' name='m_idx' value='"+list[i].m_idx+"'></td>";
			}else{
				content += "<td><input type='text' name='u_id' value=''>"
						+"<input type='hidden' name='m_idx' value='"+list[i].m_idx+"'></td>";
			}
			content += "<td>"+list[i].m_name+"</td><td>"
					+"<input type='text' name='m_position' value='"+list[i].m_position+"'></td>"
					+"<td>"+list[i].m_tpoint+"</td><td>"+list[i].m_matchcount+"</td>"
					+"<td><button onclick='memDel("+i+")' class='btn btn-primary'>삭제</button></td>"
					+"<td><button onclick='memUp("+i+")' class='btn btn-success'>등록</button></td></tr>";
		}
		$(".mem").empty();
		$(".mem").append(content);
	}
	
	//submit체크
	function CheckForm(f){
		if($("input[name=t_time]").val()==""){
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