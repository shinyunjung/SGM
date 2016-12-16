<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>매칭 게시판</title>
		<script src="https://code.jquery.com/jquery-3.1.0.min.js"></script>
		<style>
			th{
				border: 1px solid;
				text-align: center;
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
						<legend>매칭 게시판</legend>
					</fieldset>
				</div>
				
				<!-- 두 번째 구역 -->
				<div class="col5 content">	
					<div class="search">
						<table width="100%">
							<tr>
								<td class="left">
									<button>글작성</button>
									게시물 갯수 : 
									<select id="pagePerNum">
										<option value="5">5</option>
										<option value="10">10</option>
										<option value="15">15</option>
										<option value="20">20</option>
									</select>
								</td>
								<td class="right">
									<input type="text" size="20" class="input"/>
									<button onclick="Search()">검색</button>
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
								<tr>
									<td>0</td>
									<td>OOO</td>
									<td>OOOOO</td>
									<td>0</td>
									<td>대기중</td>
								</tr>
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
		var currPage=1;//현재 페이지
		var totalPage=1;
		var search=false;
		var input = "";
		
		 $("document").ready(function(){
			listCall(currPage);
		}); 
		
		$("#pagePerNum").change(function(){
			if(search){
				searchCall(currPage);
			}else{
				listCall(currPage);
			}
		});
		
		function Search(){
			var url="../rest/search";
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
				reqServer(url, data);	
			}else{
				alert("검색하실 단어는 2글자 이상이여야합니다.")
			}
		}
		
		
		function searchCall(currPage){
			if(currPage>=1 && currPage<=totalPage){
				var url="../rest/searchCall";
				var data={};
				search=true;
				console.log($(".input").val());
				if($(".input").val()!=""){
					console.log("검색");
					input=$(".input").val();
					$(".input").val("");	
				}
				console.log(input);
				data.page=currPage;
				data.pagePerNum=$("#pagePerNum").val();
				data.input=input;
				reqServer(url, data);
			}
			
		}
		
		function listCall(currPage){
			if(currPage>=1 && currPage<=totalPage){
				var url="../rest/listCall";
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
					if(url=="../rest/listCall"){
						printList(data.jsonList.list);
						currPage=data.currPage;
						totalPage=data.totalPage;
						printPaging(data.totalCount, data.totalPage); 
					}
					else if(url=="../rest/search"){
						if(data.count!=0){
							searchCall(1);
						}else{
							alert("검색 결과가 없습니다.");
						}
					}
					else if(url=="../rest/searchCall"){
						console.log("검색 종료");
						printList(data.jsonList.list);
						currPage=data.currPage;
						totalPage=data.totalPage;
						printPaging(data.totalCount, data.totalPage); 
					}
					else if(url=="./rest/delete"){
						alert(data.msg);
						listCall(currPage);
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
				+"<td>"+list[i].mch_title+"</td>"
				+"<td>"+list[i].mch_vcount+"</td>"
				+"<td>"+list[i].mch_state+"</td>"
				+"</tr>";
			}
			
			$("#list").empty();
			$("#list").append(content);
		}
	
	
	
	 //페이지 그리기
	function printPaging(count, page){
		console.log("전체 게시물:"+count);
		console.log("전체 페이지:"+page);
		console.log("현재 페이지:"+currPage);

		var start; //페이지 시작
		var end; //페이지 끝
		
		var pre=currPage-1;
		
		var next=currPage+1;
		
		//다음 페이지가 있는지 여부확인
		var range=(currPage/5);
		
		var content="";
		
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
		if(search){
			content+="<a href='#' onclick='searchCall("+1+")'>처음</a> |"
			+" <a href='#' onclick='searchCall("+(start-1)+")'> << </a> "
			+"<a href='#' onclick='searchCall("+pre+")'> < </a> ";
			for(var i=start; i<=end; i++){
				if(i<=page){
					if(currPage==i){
						content+="<b>"+i+"</b>";	
					}else{
						content+=" <a href='#' onclick='searchCall("+i+")'>"
						+i+"</a> ";
					}	
				}
			}
			content+="<a href='#' onclick='searchCall("+next+")'> > </a> "
			+" <a href='#' onclick='searchCall("+(end+1)+")'> >> </a>"
			+"| <a href='#' onclick='searchCall("+page+")'>끝</a>";	
		}else{
			content+="<a href='#' onclick='listCall("+1+")'>처음</a> |"
			+" <a href='#' onclick='listCall("+(start-1)+")'> << </a> "
			+"<a href='#' onclick='listCall("+pre+")'> < </a> ";
			for(var i=start; i<=end; i++){
				if(i<=page){
					if(currPage==i){
						content+="<b>"+i+"</b>";	
					}else{
						content+=" <a href='#' onclick='listCall("+i+")'>"
						+i+"</a> ";
					}	
				}
			}
			content+="<a href='#' onclick='listCall("+next+")'> > </a> "
			+" <a href='#' onclick='listCall("+(end+1)+")'> >> </a>"
			+"| <a href='#' onclick='listCall("+page+")'>끝</a>";
		}
		
		$("#paging").empty();
		$("#paging").append(content);
	} 
	</script>
</html>