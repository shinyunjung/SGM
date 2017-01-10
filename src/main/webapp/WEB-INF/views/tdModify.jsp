<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
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
			#content{
				width: 100%;
				min-height: 300px;
				font-size: 14px;
			}
			#pr{
				text-align: right;
				position: relative;
				z-index: 2;
				display: none;
			}
			#pr th,#pr td{
				width: 7.7%;
				text-align: center;
			}
			input[type='text']{
				height: 100%;
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
						<legend>팀 일지</legend>
					</fieldset>
					<div class="team">
						<jsp:include page="../../resources/include/team.jsp" />
					</div>
				</div>
				<div class="col5 content">
				<fieldset>
					<legend>글수정</legend>
				</fieldset>
					<form action="modify" method="post" enctype="multipart/form-data" id="td" onsubmit="return CheckForm(this)">
						<table class="detailTable">
								<tr class="borderTop">
									<td><input type="text" name="j_title" placeholder="제목" value="${td.j_title}"/></td>
								</tr>
								<tr class="borderTop">
									<td>
									<input type="text" name="j_name" value="${td.j_name}" readonly/>
									<input type="hidden" name="idx" value="${td.totalIdx}"/>
									<input type="hidden" name="t_idx" value="${team.t_idx}"/>
									</td>
								</tr>
								<tr class="borderTop">
									<td>
										<div id="content" contenteditable="true" ondrop="drop(event)" ondragover="allowDrop(event)">${td.j_content}</div>
										<input type="hidden" name="j_content"/>
									</td>
								</tr>
								<tr class="borderTop">
									<td>
										<input type="file" name="file1" id="imgInp" onchange="fileView(this)"/><div class="file1"></div>
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
										<input type="date" name="p_date" value="${record[0].p_date}"/>
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
							                <th>선택</th>
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
											        <input name="click[]" type="button" onclick="setClick(${num.index})" value="선택"/>
											        <input type="hidden" name="oldAtk[]" value="${rec.p_atkpoint}"/>
											        <input type="hidden" name="chk[]" value="${rec.m_idx}"/>
											        <input type="hidden" name="set[]" value=""/>
										        </td>
										    </c:if>
										    <c:if test="${rec.p_goal==null}">
												<td>${rec.m_name}</td>
												<td><input type="text" name="p_goal[]" value="0"/></td>
												<td><input type="text" name="p_assist[]" value="0"/></td>
												<td><input type="text" name="p_shoot[]" value="0"/></td>
												<td><input type="text" name="p_poul[]" value="0"/></td>
												<td><input type="text" name="p_warning[]" value="0"/></td>
												<td><input type="text" name="p_off[]" value="0"/></td>
												<td><input type="text" name="p_ck[]" value="0"/></td>
												<td><input type="text" name="p_pk[]" value="0"/></td>
												<td><input type="text" name="p_offside[]" value="0"/></td>
												<td><input type="text" name="p_effectshot[]" value="0"/></td>
												<td>
													<input id="add" type="button" onclick="setAdd(${num.index})" value="추가"/>
													<input type="hidden" name="oldAtk[]" value="${rec.p_atkpoint}"/>
											        <input type="hidden" name="chk[]" value="${rec.m_idx}"/>
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
	var t_idx = "${team.t_idx}";
	var sw = false;
	
	start();
	function start(){
		if("${file}"!="[]"){
			console.log("s");
				/* var num = $("#content img").length; */
				var path = "../../main/resources/upload/";
				for(var i=0; i<3; i++){
					/* var id =  $("#content img").eq(i).attr("id"); */
					var src = ["${file[0].f_newfilename}","${file[1].f_newfilename}","${file[2].f_newfilename}"];
					if(src[i]!=""){
					$("#file"+(i+1)).attr("src",path+src[i]);
						var ss = $("#file"+(i+1)).attr("src");
						console.log("d");
						console.log(src);
						/* console.log(id); */
						console.log(ss);
					}
				}
		}
	}
	
	//개인기록 수정/삭제
	function setClick(num) {
		sw = $("input[name='set[]']").eq(num).val();       
		if(sw == "up"){
			$("input[name='click[]']").eq(num).val("삭제");
			$("input[name='set[]']").eq(num).val("del");
			$(".tog tr").eq(num+1).css("background-color","red");  
		}else if(sw == "del"){
			$("input[name='click[]']").eq(num).val("선택");
			$("input[name='set[]']").eq(num).val("");
			$(".tog tr").eq(num+1).css("background-color","white");  
		}else{
			$("input[name='click[]']").eq(num).val("수정");
			$("input[name='set[]']").eq(num).val("up");
			$(".tog tr").eq(num+1).css("background-color","aqua");  
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
	
	//개인기록 없어서 작성할때
	function chk(num){         
        sw = $("input[name='set[]']").eq(num).val(); 
        console.log(sw);
		if(sw == "in"){
			$("input[name='set[]']").eq(num).val("");
		}else{
			$("input[name='set[]']").eq(num).val("in");
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
                $("#content").append(img);
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
	//개인기록 보이기 토글
    $("#toggle").click(function(){
        $(this).toggleClass("ex");            
        sw = $(this).hasClass("ex");
        console.log("f");
		if(sw == true){
			$(this).text("취소");
			$("#pr").css("display","block");
			$("#tf").val("t");
			if("${record}"=="[]"){
				member();
			}
		}else{
			$(this).text("개인기록");
			$("#pr").css("display","none");
			$("#start").empty();
			$("#tf").val("");
		}
        
    });
    
  //개인기록 멤버정보 불러오기
	function member(){
		var url="./member";
		var data = {};
		data.t_idx = t_idx;
		reqServer(url,data);
	}
	
	
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
	
	//개인기록그리기
	function printList(list){
		console.log(list);
		var content = "";
		for(var i=0; i<list.length; i++){
			content +="<tr class='borderTop'><td>"+list[i].m_name
			+"</td><td><input type='text' name='p_goal[]' value='0'/></td>"
            +"<td><input type='text' name='p_assist[]' value='0'/></td>"
            +"<td><input type='text' name='p_shoot[]' value='0'/></td>"
            +"<td><input type='text' name='p_poul[]' value='0'/></td>"
            +"<td><input type='text' name='p_warning[]' value='0'/></td>"
            +"<td><input type='text' name='p_off[]' value='0'/></td>"
            +"<td><input type='text' name='p_ck[]' value='0'/></td>"
            +"<td><input type='text' name='p_pk[]' value='0'/></td>"
            +"<td><input type='text' name='p_offside[]' value='0'/></td>"
            +"<td><input type='text' name='p_effectshot[]' value='0'/></td>"
            +"<td><input type='checkbox' onclick='chk("+i+")' name='chk[]' value='"
            +list[i].m_idx+"'/><input type='hidden' name='set[]' value=''/></td></tr>";
		}
		$("#start").empty();
		$("#start").append(content);
	}
	
	
	
	//submit체크
	function CheckForm(f){
		console.log("for"+f.elements['set[]'].length);
		if(sw==true){
			for(var i=0; i<f.elements['set[]'].length; i++){
				var rr = f.elements['set[]'][i].value;
				console.log(rr);
				if(f.elements['set[]'][i].value==""){
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
		$("#content img").attr("src","#");
		var text = $("#content").html();
		$("input[name=j_content]").val(text);
		console.log($("input[name=j_content]").val());
		
	    return true; 
	}
	//리셋
	function html() {
		$("#content").empty();
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