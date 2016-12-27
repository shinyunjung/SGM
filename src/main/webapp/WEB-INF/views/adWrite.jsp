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
			#div1,#div2{
				width: 100%;
				height: 300px;
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
						<legend>광고관리</legend>
					</fieldset>
					<div class="manager">
						<jsp:include page="../../resources/include/manager.jsp" />
					</div>
				</div>
				<div class="col5 content">
				<fieldset>
					<legend>글쓰기</legend>
				</fieldset>
					<form action="write" method="post" enctype="multipart/form-data">
						<table class="detailTable">
								<tr class="borderTop">
									<td><input type="text" name="ad_title" placeholder="제목"/></td>
								</tr>
								<tr class="borderTop">
									<td>
										<input type="text" name="ad_manager" placeholder="담당자" />
										<input type="text" name="ad_host" placeholder="광고주" />
									</td>
								</tr>
								<tr class="borderTop">
									<td>
										<select name="ad_type">
										<option value="CPC">CPC</option>
										<option value="CPM">CPM</option>
										<option value="기간">기간</option>
										</select>
										<input type="text" name="ad_count" readonly />
									</td>
								</tr>
								<tr class="borderTop">
									<td>
										<input type="date" name="s_date" placeholder="시작일" />
										<input type="date" name="e_date" placeholder="종료일" />
									</td>
								</tr>
								<tr class="borderTop">
									<td>
										<input type="file" name="file1" onchange="fileView(this)"/>
										<input type="file" name="file2" onchange="fileView(this)"/>
										<input type="file" name="file3" onchange="fileView(this)"/>
										<input id="fileName" type="hidden" name="fileName"/>
									</td>
								</tr>
								<tr class="borderTop">
									<td><input type="url" name="ad_URL" placeholder="URL"/>
									<input type="url" name="ad_URL" placeholder="URL"/>
									<input type="url" name="ad_URL" placeholder="URL"/></td>
								</tr>
								<tr class="borderTop">
									<td colspan="4">
										<select name="ad_area">
										<c:set var="area" value="<%=area %>"></c:set>
											<c:forEach items="${area}" var="ad" varStatus="gu">
												<option value="${gu.index}">${ad}</option>
											</c:forEach>
										</select>
									<input type="text" name="ad_address" placeholder="주소" />
									</td>
								</tr>
								<tr class="borderTop">
									<td>
										<jsp:include page="../../resources/include/mapWrite.jsp" />
										<input type="hidden" name="ad_lat" value="2"/>
										<input type="hidden" name="ad_lng" value="2"/>
										<button type="button" class="bt">취소</button><!-- 테스트용 -->
									</td>
								</tr>
								<tr class="borderTop">
									<td>
										<textarea name="ad_content" rows="20"></textarea>
									</td>
								</tr>
								<tr class="borderTop">
									<td style="text-align: center;">
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
	$(".bt").click(function() {/* 테스트용 */
		var lat = $("input[name=ad_lat]").val();
		console.log(lat);
	});
	
	$("select[name='ad_type']").change(function(){
		var type = $("select[name='ad_type']").val();
		$("input[name='ad_count']").removeAttr("readonly");
		if(type=="CPC"){
			$("input[name='ad_count']").attr("placeholder","클릭수");
		}else if(type=="CPM"){
			$("input[name='ad_count']").attr("placeholder","노출수");
		}else{
			$("input[name='ad_count']").attr("placeholder","일수");
		}
	});
	
	function fileView(elem){
		console.log(elem);
		console.log(elem.value);
		var fullPath = elem.value;
		var fileName = fullPath.substring(12);
		console.log(fileName);
		$("#fileName").val(fileName);
	}
	</script>
</html>