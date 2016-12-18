<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>로그인 페이지</title>
		<script src="https://code.jquery.com/jquery-3.1.0.min.js"></script>
		<script src="resources/bootstrap/js/bootstrap.js"></script>
		<link rel="stylesheet" type="text/css" href="resources/bootstrap/css/bootstrap.css" />
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
			
		</style>
	</head>
	<body>
		<jsp:include page="../../resources/include/logo.jsp" />
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
					<legend>글쓰기</legend>
				</fieldset>
					<form action="" method="post">
						<table class="detailTable">
								<tr class="borderTop">
									<td><input type="text" name="a_ground" placeholder="운동장"/></td>
								</tr>
								<tr class="borderTop">
									<td><input type="text" name="a_name" value="" readonly/></td>
								</tr>
								<tr class="borderTop">
									<td>
										<textarea rows="17" name="a_content" placeholder="내용"></textarea>
									</td>
								</tr>
								<tr class="borderTop">
									<td>
										<input type="file" name="a_picfile"/>
									</td>
								</tr>
								<tr class="borderTop">
									<td>
										<jsp:include page="../../resources/include/mapWrite.jsp" />
										<input type="hidden" name="lat" />
										<input type="hidden" name="lng" />
										<button type="button" class="bt">취소</button><!-- 테스트용 -->
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
		var lat = $("input[name=lat]").val();
		console.log(lat);
	});
	</script>
</html>