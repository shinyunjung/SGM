<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>매칭 게시판</title>
		<script src="https://code.jquery.com/jquery-3.1.0.min.js"></script>
		<script src="../../main/resources/bootstrap/js/bootstrap.js"></script>
		<link rel="stylesheet" type="text/css" href="../../main/resources/bootstrap/css/bootstrap.css" />
		<style>
			th{
				border: 1px solid;
				text-align: center;
			}
			textarea{
				width: 100%;
				resize: none;
			}
			.search{
				border: 1px solid;
			}
			.title td{
				cursor: pointer;
			}
			.hide2{
				display: none;
			}
			.show2{
				display: table-row;
			}
			.msgContent{
				min-height: 150px;
			}
			#matchMsg{
				width: 500px;
				border: 1px solid;
				position: absolute;
				background-color: skyblue;
				top: 45%;
				left: 45%;
				display: none;
				z-index: 2;
			}
		</style>
	</head>
	<body>
		<jsp:include page="../../resources/include/logo.jsp" />
		<jsp:include page="../../resources/include/loginBox.jsp" />
		<jsp:include page="../../resources/include/nav.jsp" />
		<div class="layer">
			<div class="page">
				
				<!-- 첫 번째 구역 -->
				<div class="col2 content">
					<fieldset>
						<legend>쪽지함</legend>
					</fieldset>
				</div>
				
				<!-- 두 번째 구역 -->
				<div class="col5 content">	
					<div class="search">
						<table width="100%">
							<tr>
								<td class="left">
									게시물 갯수 : 
									<select id="pagePerNum">
										<option value="5">5</option>
										<option value="10">10</option>
										<option value="15">15</option>
										<option value="20">20</option>
									</select>
								</td>
								<td class="right">
									<select class="type">
										<option value="n_title">제목</option>
										<option value="n_content">내용</option>
										<option value="n_writer">보낸이</option>
									</select>
									<input type="text" size="20" class="input"/>
									<button onclick="Search()">검색</button>
								</td>
							</tr>
							<tr>
								<td>
								</td>
							</tr>
						</table>
					</div>
					<div class="noteList">
						<table class="table table-hover recruit">
							<thead class="center">
								<tr>
									<td><b>순번</b></td>
									<td><b>보낸이</b></td>
									<td><b>제목</b></td>
									<td><b>상태</b></td>
								</tr>
							</thead>
							<tbody id="list">
							</tbody>
						</table>
						<div id="paging">
									
						</div>
					</div>
				</div>
				
				<!-- 세 번째 구역 -->
				<div class="col3 content">
					광고 배너 공간
				</div>
				
				<!-- 수락 거절 div -->
				<div id="matchMsg">
					<form action="sendNote" method="post">
						<table class="matchMsg" width="100%">
							<tr>
								<td class="noteTitle center">신청 수락/거절 쪽지</td>
								<td class="right"><input type="button" onclick="delMsg()" value="X">
									<input type="text" name="noteIdx" class="hide2" value="" />
									<input type="text" name="mchIdx" class="hide2" value="" />
								</td>
							</tr>
							<tr class="center borderTop">
								<td class="borderRight sender" id="sender">
									보낸 이 : <input type="text" name="writer" value="${name}"  readonly/>
									<input type="hidden" name="writerIdx" value="${idx}" />
								 </td>
								<td class="sender">
									받는 이 : <input type="text" name="receiver" value=""  readonly/>
									<input type="text" class="hide2" name="receiverIdx" value="" />
									<input type="text" class="hide2" name="noteTitle" value="" />
									<input type="text" class="hide2" name="noteConfirm" value="" />
								</td>
							</tr>
							<tr class="borderTop">
								<td colspan="2">
									<br/>
									<div class="msg">
										<textarea class="noteContent" name="noteContent"></textarea>
									</div>
								</td>
							</tr>
							<tr>
								<td class="center borderTop" colspan="2" style="padding: 5px">
									<input type="submit" value="보내기" />
									<input type="button" onclick="delMsg()" value="취소" />
								</td>
							</tr>
						</table>
					</form>
				</div>
			</div>
		</div>
	</body>
	<script>
		var url="";
		var data={};
		var pagePerNum=$("#pagePerNum").val();
		var currPage=1;//현재 페이지
		var totalPage=1;
		var search=false;
		var input = "";
		var type="n_title";
		var idx="${idx}";
		var name="${name}";
		console.log(idx);
		
		var msg="";
		msg="${msg}";
		
		if(msg!=""){
			alert(msg);
		}
		
		searchCall(currPage);
		
		$("#pagePerNum").change(function(){
			pagePerNum=$("#pagePerNum").val();
			currPage=1;
			searchCall(currPage);
		});
		
		$(".type").change(function(){
			type=$(".type option:selected").val();
			console.log(type);
		});
		
		function Search(){
			var url="./search";
			var data={};
			if($(".input").val()!=""){
				console.log("검색");
				input=$(".input").val();
				$(".input").val("");	
			}
			var count=input.length;
			console.log(count);
			if(count>1){
				data.input=input;
				data.type=type;
				data.idx=idx;
				reqServer(url, data);	
			}else{
				alert("검색하실 단어는 2글자 이상이여야합니다.")
			}
		}
		
		
		function searchCall(currPage){
			if(currPage>=1 && currPage<=totalPage){
				var url="./searchCall";
				var data={};
				search=true;
				console.log($(".input").val());
				if($(".input").val()!=""){
					console.log("검색");
					input=$(".input").val();
					$(".input").val("");	
				}
				console.log(type);
				data.input=input;
				data.type=type;
				console.log(input);
				data.idx=idx;
				data.page=currPage;
				data.pagePerNum=$("#pagePerNum").val();
				reqServer(url, data);
			}
			
		}
		
		
		function deleteNote(idx){
			var url="./deleteNote";
			var data={};
			data.idx=idx;
			reqServer(url, data);
		}
		
		function reqServer(url, data){
			console.log(url);
			console.log(data);
			$.ajax({
				url:url,
				type:"post",
				data:data,
				dataType:"JSON",
				success:function(data){
					console.log(data);
					if(url=="./search"){
						if(data.count!=0){
							console.log(data.count);
							searchCall(1);
						}else{
							alert("검색 결과가 없습니다.");
						}
					}
					else if(url=="./searchCall"){
						console.log("검색 종료");
						printList(data.jsonList.list);
						currPage=data.currPage;
						totalPage=data.totalPage;
						printPaging(data.totalCount, data.totalPage); 
					}
					else if(url=="./deleteNote"){
						alert(data.msg);
						searchCall(currPage);
					}
				},
				error:function(error){
					console.log(error);
				}
		});
	}
		
	function printList(list){
		var content="";
		for(var i=0; i<list.length; i++){
			content+="<tr id='"+i+"'>"
				+"<td class='idx'>"+list[i].n_idx+"</td>"
				+"<td class='writer'>"+list[i].n_writer+"</td>"
				+"<td class='title'><a href='#' onclick='showContent("+i+")'>"+list[i].n_title+"</a></td>";
				if(list[i].n_confirm=="Stay"){
					content+="<td><a href='#' onclick='noDel()'>삭제N</a></td>";
				}else{
					content+="<td><a href='#' onclick='deleteNote("+list[i].n_idx+")'>삭제Y</a></td>";
				}
				content+="</tr>"
				+"<tr class='hide2'><td colspan='4' class='center'><div class='left msgContent'>"+list[i].n_content+"</div>";
				if(list[i].n_confirm=="Stay"){
					content+="<button class='btn' onclick='accept("+list[i].writer_idx+", "+i+", "+list[i].n_idx+", "+list[i].mch_idx+")'>수락</button> <button class='btn' onclick='refuse("+list[i].writer_idx+", "+i+", "+list[i].n_idx+", "+list[i].mch_idx+")'>거절</button></td>"
					+"</tr>";	
				}
			}
			
			$("#list").empty();
			$("#list").append(content);
			logoId();
		}
	
	function showContent(num){
		var article = (".show2");
		var myArticle =$("#"+num).next("tr");
		if(myArticle.hasClass("hide2")){
			$(article).removeClass('show2').addClass('hide2'); 
			$(myArticle).removeClass('hide2').addClass('show2');  
		}else{
			$(myArticle).removeClass('show2').addClass('hide2');
		}
	}
		
	
	function accept(idx, num, noteIdx, parentIdx){
		console.log(noteIdx+"/"+parentIdx);
		var receiver =$("#"+num).children(".writer").html();
		$("#matchMsg").css("display","block");
		$("input[name='noteIdx']").val(noteIdx);
		$("input[name='mchIdx']").val(parentIdx);
		$(".noteTitle").html("신청 수락");
		$("input[name='receiver']").val(receiver);
		$("input[name='receiverIdx']").val(idx);
		$("input[name='noteTitle']").val("신청쪽지의 대답이 왔습니다.");
		$(".noteContent").val("당신의 신청을 수락합니다.");
		$("input[name='noteConfirm']").val("Yes");
		
		
	}
	
	function refuse(idx, num, noteIdx, parentIdx){
		var receiver =$("#"+num).children(".writer").html();
		$("#matchMsg").css("display","block");
		$("input[name='noteIdx']").val(noteIdx);
		$("input[name='mchIdx']").val(parentIdx);
		$(".noteTitle").html("신청 거절");
		$("input[name='receiver']").val(receiver);
		$("input[name='receiverIdx']").val(idx);
		$("input[name='noteTitle']").val("신청쪽지의 대답이 왔습니다.");
		$(".noteContent").val("당신의 신청을 거절합니다.");
		$("input[name='noteConfirm']").val("No");
	}
	
	
	
	function delMsg(){
		$(".noteContent").val("");
		$("#matchMsg").css("display", "none");
	}
	
	
	function noDel(){
		alert("삭제를 하실려면 수락또는 거절을 하셔야 합니다.");
	}
	
	
	 //페이지 그리기
	function printPaging(count, page){
		var totalRange=page/5;
		var totalEnd=0;
		
		console.log("전체 게시물:"+count);
		console.log("전체 페이지:"+page);
		console.log("현재 페이지:"+currPage);
		
		/* if(currPage>page){
			currPage=page;
			searchCall(currPage);
		} */
		if(totalRange>1){
			totalEnd=page%5==0?
					(Math.floor(totalRange))*5:
					(Math.floor(totalRange)+1)*5;
			totalStart=Math.floor(totalEnd-4);	
		}else{
			totalStart=1;
			totalEnd=totalStart+4;
		}
		
		var start; //페이지 시작
		var end; //페이지 끝
		
		var pre=currPage-1;
		
		var next=currPage+1;
		
		//다음 페이지가 있는지 여부확인
		var range=(currPage/5);
		
		var content = "<ul class='pagination pagination-sm'>";
		
		console.log(range);
		if(range>1){//5페이지 넘었을 경우
			end=currPage%5==0?
					(Math.floor(range))*5:
					(Math.floor(range)+1)*5;
			start=Math.floor(end-4);
		}else{//5페이지 이하일 경우
			start=1;
			end=start+4;
		}
		console.log(start+"/"+end);
			content+="<li class='page-item first'><a href='#' onclick='searchCall("+1+")'>First</a></li>"
			+"<li class='page-item prev'><a href='#' onclick='searchCall("+(start-1)+")'> << </a></li> "
			+"<li class='page-item before'><a href='#' onclick='searchCall("+pre+")'> < </a></li> ";
			for(var i=start; i<=end; i++){
				if(i<=page){
					if(currPage==i){
						content+="<li class='page-item active'><a href='#'><b>"+i+"</b></a></li>";	
					}else{
						content+="<li class='page-item'> <a href='#' onclick='searchCall("+i+")'>"
						+i+"</a></li> ";
					}	
				}
			}
			content+="<li class='page-item after'><a href='#' onclick='searchCall("+next+")'> > </a></li> "
			+"<li class='page-item next'> <a href='#' onclick='searchCall("+(end+1)+")'> >> </a></li>"
			+"<li class='page-item last'><a href='#' onclick='searchCall("+page+")'>Last</a></li>";	
		$("#paging").empty();
		$("#paging").append(content);
		
		if(range<1){
			$(".first").addClass("disabled");
			$(".prev").addClass("disabled");
			if(currPage==1){
				$(".before").addClass("disabled");	
			}
		}
		if(end==totalEnd){
			$(".next").addClass("disabled");
			$(".last").addClass("disabled");
			if(currPage==page){
				$(".after").addClass("disabled");
			}
		}
		
	} 
	</script>
</html>