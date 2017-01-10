<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<% String[] area = {"중구", "동구", "남구", "연수구", "남동구", "부평구", "계양구", "서구", "강화군", "옹진군"}; %>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>로그인 페이지</title>
		<script src="https://code.jquery.com/jquery-3.1.0.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
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
			#img{
				width: 250px;
				height: 180px;
	            margin: 10px;
			}
			#content{
				width: 100%;
				min-height: 300px;
				font-size: 14px;
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
				  		<legend>장소목록</legend>
				  	</fieldset>
				</div>
				<div class="col5 content">
				<fieldset>
					<legend>글수정</legend>
				</fieldset>
					<form action="modify" method="post" name="place" enctype="multipart/form-data" onsubmit="return CheckForm(this)">
						<table class="detailTable">
						<thead>
							<tr class="borderBottom">
								<td colspan="2"><input type="text" name="a_ground" placeholder="운동장" value="${detail.a_ground}"/></td>
							</tr>
							<tr class="borderTop">
								<td colspan="2">
									<input type="text" name="a_name" value="${detail.a_name}" readonly/>
									<input type="hidden" name="a_idx" value="${detail.a_idx}"/>
								</td>
							</tr>
						</thead>
						<tbody>
							<tr class="borderBottom">
								<td colspan="2" class="borderLeft">
									<div id="content" contenteditable="true" ondrop="drop(event)" ondragover="allowDrop(event)">${detail.a_content}</div>
									<input type="hidden" name="a_content"/>
								</td>
							</tr>
							<tr class="borderTop">
								<td colspan="2">
									<input type="file" name="file" id="imgInp" onchange="fileView(this)"/>
									<input id="fileName" type="hidden" name="fileName"/>
								</td>
							</tr>
							<tr class="borderTop">
								<td style="width: 10%;">
									<select name="a_area" class="form-control">
									<c:set var="area" value="<%=area %>"></c:set>
										<c:forEach items="${area}" var="team" varStatus="gu">
											<option value="${gu.index}">${team}</option>
										</c:forEach>
									</select>
								</td>
								<td>
									<input type="text" name="address" value="${detail.a_address}" />
								</td>
							</tr>
							<tr class="borderBottom">
								<td colspan="2">
   									<jsp:include page="../../resources/include/placeWrite.jsp"/>
   									<input type="hidden" name="lat" value="${detail.a_lat}"/>
									<input type="hidden" name="lng" value="${detail.a_lng}"/>
  								</td>
							</tr>
							<tr class="borderTop">
								<td  colspan="2" style="text-align: center;">
					  				<button type="reset" class="btn btn-default">취소</button>
					        		<button type="button" onclick="CheckForm(this)" class="btn btn-primary">등록</button>
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
	$(document).ready(function(){
		$("select[name='a_area'] option[value='${detail.a_area}']").attr("selected", "selected");
		var placePosition = new daum.maps.LatLng("${detail.a_lat}", "${detail.a_lng}");
		// 이동할 위도 경도 위치를 생성합니다 
	    var moveLatLon = new daum.maps.LatLng("${detail.a_lat}", "${detail.a_lng}");
	    // 지도 중심을 이동 시킵니다
	    map.setCenter(moveLatLon);
	 	//지도를 1레벨 내립니다 (지도가 확대됩니다)
	    map.setLevel(5);
		addMarker(placePosition,0);
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
	
	//지도 검색
	$("#search").click(function(){
		var keyword = $("#keyword").val();
		searchPlaces(keyword);
	});
	
	//submit체크
	function CheckForm(f){
		console.log("f");
		if($("input[name='a_ground']").val()==""){
			alert("운동장을 입력해주세요");
			$("input[name='a_ground']").focus();
		}else if($("#content").html()==""){
			alert("내용을 입력해주세요");
			$("#content").focus();
		}else if($("input[name='lat']").val()==""){
			alert("장소를 선택해주세요");
			$("#keyword").focus();
		}else{ 
			var text = $("#content").html();
			$("input[name=a_content]").val(text);
			console.log($("input[name=a_content]").val());
			document.place.submit(); 
		}
		return false;
	}
	</script>
</html>