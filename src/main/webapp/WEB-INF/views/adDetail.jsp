<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Insert title here</title>
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
			#content{
				width: 100%;
				min-height: 300px;
				font-size: 14px;
			}
		</style>
	</head>
	<body>
		<jsp:include page="../../resources/include/logo.jsp" />
		<jsp:include page="../../resources/include/nav.jsp" />
		<div class="layer">
			<div class="page">
				
				<!-- 첫 번째 구역 -->
				<div class="col2 content">
					<fieldset>
						<legend>광고관리</legend>
					</fieldset>
					<div class="manager">
						<jsp:include page="../../resources/include/manager.jsp" />
					</div>
				</div>
				
				<!-- 두 번째 구역 -->
				<div class="col5 content">
					<div id="detailZone">
						<table class="detailTable">
								<tr class="borderTop">
									<td colspan="4">제목</td>
								</tr>
								<tr class="borderTop">
									<td>광고주</td>
									<td class="borderLeft">시작일</td>
									<td class="borderLeft">담당자</td>
									<td class="borderLeft">시작일</td>
								</tr>
								<tr class="borderTop">
									<td>광고타입</td>
									<td class="borderLeft">시작일</td>
									<td class="borderLeft">클릭수</td>
									<td class="borderLeft">시작일</td>
								</tr>
								<tr class="borderTop">
									<td>시작일</td>
									<td class="borderLeft">시작일</td>
									<td class="borderLeft">종료일</td>
									<td class="borderLeft">시작일</td>
								</tr>
								<tr class="borderTop">
									<td colspan="4">
										<div id="content"></div>
									</td>
								</tr>
								<tr class="borderTop">
									<td>주소</td>
									<td  class="borderLeft" colspan="3">
									</td>
								</tr>
								<tr class="borderTop">
									<td colspan="4">
										<jsp:include page='../../resources/include/mapSearch.jsp' />
									</td>
								</tr>
								<tr class="borderTop">
									<td colspan="4" style="text-align: right;">
					  				<a href="./tdModify?idx=${td.idx}&t_idx=${team.t_idx}">수정</a> / <a href="./delete?idx=${td.idx}&t_idx=${team.t_idx}">삭제</a>
			  					</td>
								</tr>
						</table>
					</div>
				</div>
				
				<!-- 세 번째 구역 -->
				<div class="col3 content">
					
				</div>
			</div>
		</div>
	</body>
	<script>
	start();
	function start(){
		/* if("${record}"=="[]"){
			$(".recordZone").css("display","none");
		} */
		var path = "../../main/resources/upload/";
		for(var i=0; i<3; i++){
			var src = ["${file[0].f_newfilename}","${file[1].f_newfilename}","${file[2].f_newfilename}"];
			if(src[i]!=""){
			$("#file"+(i+1)).attr("src",path+src[i]);
				var ss = $("#file"+(i+1)).attr("src");
				console.log("d");
				console.log(src);
				console.log(ss);
			}
		}
	}
	//지도 그리기
	/* areaSearch("${detail.ad_lat}", "${detail.ad_lng}"); */
	</script>
</html>