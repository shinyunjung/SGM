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
						<legend>매칭 게시판</legend>
					</fieldset>
				</div>
				
				<!-- 두 번째 구역 -->
				<div class="col5 content">	
					<div class="search">
						<table width="100%">
							<tr>
								<td class="left">
									<button onclick="mchWrite()">글작성</button>
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
										<option value="mch_title">제목</option>
										<option value="mch_content">내용</option>
										<option value="mch_name">글쓴이</option>
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
					<div class="matchList">
						<table class="table table-hover totalTable">
							<thead class="center">
								<tr>
									<td><b>순번</b></td>
									<td><b>글쓴이</b></td>
									<td><b>제목</b></td>
									<td><b>조회 수</b></td>
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
		var type="mch_title";
		var idx="${sessionScope.userIdx}";
		var msg="";
		msg="${msg}";
		
		if(msg!=""){
			alert(msg);
		}
		
		$("document").ready(function(){
			listCall(currPage);
		});
		
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
			var url="../match/search";
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
				reqServer(url, data);	
			}else{
				alert("검색하실 단어는 2글자 이상이여야합니다.")
			}
		}
		
		
		function searchCall(currPage){
			if(currPage>=1 && currPage<=totalPage){
				var url="../match/searchCall";
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
				data.page=currPage;
				data.pagePerNum=$("#pagePerNum").val();
				reqServer(url, data);
			}
			
		}
		
		function listCall(currPage){
			if(currPage>=1 && currPage<=totalPage){
				var url="../match/listCall";
				var data={};
				data.page=currPage;
				data.pagePerNum=$("#pagePerNum").val();
				reqServer(url, data);
			}
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
					if(url=="../match/listCall"){
						printList(data.jsonList.list);
						currPage=data.currPage;
						totalPage=data.totalPage;
						printPaging(data.totalCount, data.totalPage); 
					}
					else if(url=="../match/search"){
						if(data.count!=0){
							console.log(data.count);
							searchCall(1);
						}else{
							alert("검색 결과가 없습니다.");
						}
					}
					else if(url=="../match/searchCall"){
						console.log("검색 종료");
						printList(data.jsonList.list);
						currPage=data.currPage;
						totalPage=data.totalPage;
						printPaging(data.totalCount, data.totalPage); 
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
			content+="<tr>"
				+"<td>"+list[i].mch_idx+"</td>"
				+"<td>"+list[i].mch_name+"</td>"
				+"<td><a href='../match/matchDetail?idx="+list[i].mch_idx+"&userIdx="+idx+"'>"+list[i].mch_title+"</a></td>"
				+"<td>"+list[i].mch_vcount+"</td>"
				+"<td>"+list[i].mch_state+"</td>"
				+"</tr>";
			}
			
			$("#list").empty();
			$("#list").append(content);
			logoId();
		}
	
	function mchWrite(){
		if(idx!=""){
			var userIdx="${sessionScope.userIdx}";
			console.log(userIdx);
			location.href="../../main/match/memberCheck?idx="+userIdx; 
		}else{
			alert("로그인이 필요한 권한입니다.");
		}
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