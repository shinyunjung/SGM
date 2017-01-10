<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
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
				  		<legend>자유게시판</legend>
				  	</fieldset>
				</div>
				<div class="col5 content">
				<fieldset>
					<legend>글수정</legend>
				</fieldset>
					<form action="update" method="post" onsubmit="return CheckForm(this)">
						<table class="detailTable">
								<tr class="borderTop">
									<td><input type="text" name="j_title" value="${content.j_title}"/></td>
								</tr>
								<tr class="borderTop">
									<td>
										<input type="hidden" name="idx" value="${content.totalIdx}"/>
										<input type="text" name="j_name" value="${content.j_name}"/>
									</td>
								</tr>
								<tr class="borderTop">
									<td>
										<div id="content" contenteditable="true" ondrop="drop(event)" ondragover="allowDrop(event)">${content.j_content}</div>
										<input type="hidden" name="j_content"/>
									</td>
								</tr>
								<tr class="borderTop">
									<td style="text-align: center;">
									<button type="submit" class="btn btn-primary">수정</button>
					  				<button type="reset" class="btn btn-default">취소</button>     		
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
	function CheckForm(f){
		var text = $("#content").html();
		$("input[name=j_content]").val(text);
		console.log($("input[name=j_content]").val());
		
	    return true; 
	}
	</script>
</html>