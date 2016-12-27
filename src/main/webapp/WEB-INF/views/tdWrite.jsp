<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<% String idx = request.getParameter("idx"); %>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>로그인 페이지</title>
		<script src="https://code.jquery.com/jquery-3.1.0.min.js"></script>
		<script src="../../main/resources/js/jQuery.MultiFile.min.js"></script>
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
			#div1{
				width: 100%;
				min-height: 300px;
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
				  		<legend>팀일지</legend>
				  	</fieldset>
				</div>
				<div class="col5 content">
				<fieldset>
					<legend>글쓰기</legend>
				</fieldset>
					<form action="write" method="post" enctype="multipart/form-data" id="td" onsubmit="return CheckForm(this)">
						<table class="detailTable">
								<tr class="borderTop">
									<td><input type="text" name="j_title" placeholder="제목"/></td>
								</tr>
								<tr class="borderTop">
									<td>
									<input type="text" name="j_name" value="admin" readonly/>
									<input type="hidden" name="u_idx" value="1"/>
									<input type="hidden" name="j_category" value="<%=idx %>"/>
									</td>
								</tr>
								<tr class="borderTop">
									<td>
										<div id="div1" contenteditable="true" ondrop="drop(event)" ondragover="allowDrop(event)">
											
										</div>
										<input type="hidden" name="j_content"/>
									</td>
								</tr>
								<tr class="borderTop">
									<td>
										<input type="file"name="file1" id="imgInp" onchange="fileView(this)"/>
										<input type="file" name="file2" id="imgInp" onchange="fileView(this)"/>
										<input type="file" name="file3" id="imgInp" onchange="fileView(this)"/>
										<input id="fileName" type="hidden" name="fileName"/>
										
									</td>
								</tr>
								<tr class="borderTop">
									<td>
										<button type="button" onclick="member()" class="btn btn-success">개인기록</button>
									</td>
								<tr class="borderTop">
									<td style="text-align: center;">
					  				<button type="reset" onclick="html()" class="btn btn-default">취소</button>
					        		<button type="submit" onclick="CheckForm()" class="btn btn-primary">등록</button>
			  				</td>
								</tr>
						</table>
					</form>
				</div>
				<div class="col3 content img">
				</div>
			</div>
		</div>	
		<jsp:include page="../../resources/include/footer.jsp" />
	</body>
	<script>
	var file = null;
	var fileName = null;
	
	
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
            	var img = "<img id='"+file+"' src='"+e.target.result+"' alt='"
            	+fileName+"' draggable='true' ondragstart='drag(event)'/>";
        		$("#"+file).detach();   
                $("#div1").append(img);
                var imgW = $("#"+file).width();
            	var imgH = $("#"+file).height();
            	console.log(imgW);
            	if(imgW>600||imgH>600){
            		$("#"+file).width(imgW/3);
            		$("#"+file).height(imgH/3);
            	}else if(imgW>400||imgH>400){
            		$("#"+file).width(imgW*0.8);
            		$("#"+file).height(imgH*0.8);
            	}
                		
            }

          reader.readAsDataURL(input.files[0]);
        }$("#"+file).detach(); 
    }
	
	//value값 넣기
	function CheckForm(){ 
		$("#div1 img").attr("src","#");
		var text = $("#div1").html();
		$("input[name=j_content]").val(text);
		console.log($("input[name=j_content]").val());
		
	    return true; 
	} 
	//리셋
	function html() {
		console.log("dd");
		$("#div1").empty();
	}
	
	
	//드래그
	function allowDrop(ev) {
	    ev.preventDefault();
	}

	function drag(ev) {
	    ev.dataTransfer.setData("text", ev.target.id);
	}

	function drop(ev) {
	    ev.preventDefault();
	    var data = ev.dataTransfer.getData("text");
	    ev.target.appendChild(document.getElementById(data));
	}
	</script>
</html>