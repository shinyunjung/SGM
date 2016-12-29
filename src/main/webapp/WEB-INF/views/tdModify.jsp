<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<% String t_idx = request.getParameter("t_idx"); %>
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
				padding: 6px 12px;
				font-size: 14px;
				
			}
			#div1{
				width: 100%;
				min-height: 300px;
				font-size: 14px;
			}
			#pr{
				text-align: right;
				position: relative;
				z-index: 2;
				display: block;
			}
			#pr th,#pr td{
				width: 7%;
				text-align: center;
			}
			#up,#del{
				height: 30px;
				font-size: 11px;
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
									<td><input type="text" name="j_title" placeholder="제목" value="${td.j_title}"/></td>
								</tr>
								<tr class="borderTop">
									<td>
									<input type="text" name="j_name" value="admin" readonly/>
									<input type="hidden" name="u_idx" value="1"/>
									<input type="hidden" name="j_category" value="<%="1"+t_idx %>"/>
									</td>
								</tr>
								<tr class="borderTop">
									<td>
										<div id="div1" contenteditable="true" ondrop="drop(event)" ondragover="allowDrop(event)">${td.j_content}</div>
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
										<button type="button" id="toggle" class="btn btn-success">개인기록</button>
										<input id="tf" type="hidden" name="tf" value=""/>
										<div id="pr">
										<input type="date" name="p_date"/>
										<table class="detailTable tog">
										<tr>
											<th style="width:15%">이름</th>
											<th>득점</th>
							                <th>도움</th>
							                <th>슈팅</th>
							                <th>파울</th>
							                <th>경고</th>
							                <th>퇴장</th>
							                <th>코너킥</th>
							                <th>패널티 킥</th>
							                <th>오프 사이드</th>
							                <th>유효 슈팅</th>
							                <th style="width:17%">선택</th>
										</tr>
										<tbody id="start">
										<c:if test="${record!='[]'}">
										<c:forEach items="${record}" var="rec" varStatus="num">
										<tr class='borderTop'>
											<c:if test="${rec.p_goal!=null}">
												<td>${rec.m_name}</td>
												<td><input type="text" name="p_goal[]" value="${rec.p_goal}"/></td>
										        <td><input type="text" name="p_assist[]" value="${rec.p_assist}"/></td>
										        <td><input type="text" name="p_shoot[]" value="${rec.p_shoot}"/></td>
										        <td><input type="text" name="p_poul[]" value="${rec.p_poul}"/></td>
										        <td><input type="text" name="p_warning[]" value="${rec.p_warning}"/></td>
										        <td><input type="text" name="p_off[]" value="${rec.p_off}"/></td>
										        <td><input type="text" name="p_ck[]" value="${rec.p_ck}"/></td>
										        <td><input type="text" name="p_pk[]" value="${rec.p_pk}"/></td>
										        <td><input type="text" name="p_offside[]" value="${rec.p_offside}"/></td>
										        <td><input type="text" name="p_effectshot[]" value="${rec.p_effectshot}"/></td>
										        <td>
											        <input id="del" type="button" onclick="setDel(${num.index})" value="삭제"/>
											        <input id="up" type="button" onclick="setUp(${num.index})" value="수정"/>
											        <input type="hidden" name="set[]" value=""/>
										        </td>
										    </c:if>
										    <c:if test="${rec.p_goal==null}">
												<td>${rec.m_name}</td>
												<td><input type="text" name="p_goal[]" value="0"/></td>
												<td><input type="text" name="p_assist[]" value="0" readonly/></td>
												<td><input type="text" name="p_shoot[]" value="0" readonly/></td>
												<td><input type="text" name="p_poul[]" value="0" readonly/></td>
												<td><input type="text" name="p_warning[]" value="0" readonly/></td>
												<td><input type="text" name="p_off[]" value="0" readonly/></td>
												<td><input type="text" name="p_ck[]" value="0" readonly/></td>
												<td><input type="text" name="p_pk[]" value="0" readonly/></td>
												<td><input type="text" name="p_offside[]" value="0" readonly/></td>
												<td><input type="text" name="p_effectshot[]" value="0" readonly/></td>
												<td>
													<input id="add" type="button" onclick="setAdd(${num.index})" value="추가"/>
													<input type="hidden" name="set[]" value=""/>
												</td>
										    </c:if>
							            </tr>
										</c:forEach>
										</c:if>
										</tbody>
										</table>
										</div>
									</td>
								</tr>
								<tbody id="start">
								</tbody>
								<tr class="borderTop">
									<td style="text-align: center;">
					  				<button type="reset" onclick="html()" class="btn btn-default">취소</button>
					        		<button type="submit" onclick="CheckForm(this.form)" class="btn btn-primary">등록</button>
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
	var t_idx = <%=t_idx %>;
	var sw = false;
	//개인기록수정
	function setUp(num) {
		sw = $("input[name='set[]']").eq(num).val(); 
        console.log(sw);        
		if(sw == "up"){
			$("#up").val("수정");
			$("input[name='set[]']").eq(num).val("");
			$(".tog tr").eq(num+1).css("background-color","white");
		}else{
			$("#up").val("취소");
			$("input[name='set[]']").eq(num).val("up");
			$(".tog tr").eq(num+1).css("background-color","aqua");
		}
	}
	//기록삭제
	function setDel(num) {
		sw = $("input[name='set[]']").eq(num).val(); 
        console.log(sw);            
		if(sw == "del"){
			$("#del").val("삭제")
			$("input[name='set[]']").eq(num).val("");
			$(".tog tr").eq(num+1).css("background-color","white");			
		}else{
			$("#del").val("취소");
			$("input[name='set[]']").eq(num).val("del");
			$(".tog tr").eq(num+1).css("background-color","red");
		}
	}
	//기록추가
	function setAdd(num) {         
        sw = $("input[name='set[]']").eq(num).val(); 
        console.log(sw);
		if(sw == "in"){
			$("input[name='set[]']").eq(num).val("");
			$(".tog tr").eq(num+1).css("background-color","white");
			$("#add").val("추가");
		}else{
			$("input[name='set[]']").eq(num).val("in");
			$(".tog tr").eq(num+1).css("background-color","green");
			$("#add").val("취소");
		}
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
	
    $("#toggle").click(function(){
        $(this).toggleClass("ex");            
        sw = $(this).hasClass("ex");            
		if(sw == true){
			$(this).text("취소");
			$("#pr").css("display","block");
			$("#tf").val("t");
			member();
		}else{
			$(this).text("개인기록");
			/* $("#pr").css("display","none"); */
			$("#start").empty();
			$("#tf").val("");
		}
        
    });
    
	
	
	
	function reqServer(url,data){
		$.ajax({
			url:url,
			type:"post",
			data:data,
			dataType:"json",
			success:function(d){
				console.log(d)
				printList(d.jsonList.list);
				
			},error:function(e){
				console.log(e)
			}
		});
	}
	
	
	/* //submit체크
	function CheckForm(f){
		if(sw==true){
			for(var i=0; i<f.elements['chk[]'].length; i++){
				console.log("for"+i);
				if(f.elements['chk[]'][i].checked==false){
					console.log(i);
					f.elements['p_goal[]'][i].disabled=true;
					f.elements['p_assist[]'][i].disabled=true;
					f.elements['p_shoot[]'][i].disabled=true;
					f.elements['p_poul[]'][i].disabled=true;
					f.elements['p_warning[]'][i].disabled=true;
					f.elements['p_off[]'][i].disabled=true;
					f.elements['p_ck[]'][i].disabled=true;
					f.elements['p_pk[]'][i].disabled=true;
					f.elements['p_offside[]'][i].disabled=true;
					f.elements['p_effectshot[]'][i].disabled=true;
				}
			}
		}
		$("#div1 img").attr("src","#");
		var text = $("#div1").html();
		$("input[name=j_content]").val(text);
		console.log($("input[name=j_content]").val());
		
	    return true; 
	}  */
	//리셋
	function html() {
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