<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>영상 게시판</title>
		<script src="https://code.jquery.com/jquery-3.1.0.min.js"></script>
		<script src="resources/bootstrap/js/bootstrap.js"></script>
		<link rel="stylesheet" type="text/css" href="resources/bootstrap/css/bootstrap.css" />
		<style>
			th{
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
						<legend>영상 게시판</legend>
					</fieldset>
				</div>
				
				<!-- 두 번째 구역 -->
				<div class="col5 content">	
					<div class="search">
						<table width="100%">
							<tr>
								<td class="left"><button>글작성</button></td>
								<td class="right">
									<button>검색</button>
									<input type="text" size="20" />
								</td>
							</tr>
						</table>
					</div>
					<div id="freeList">
						<table class="table table-hover totalTable">
							<thead>
								<tr>
									<th>순번</th>
									<th>글쓴이</th>
									<th>제목</th>
									<th>조회 수</th>
									<th>평점</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>0</td>
									<td>OOO</td>
									<td>OOOOO</td>
									<td>0</td>
									<td>OOO</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
				
				<!-- 세 번째 구역 -->
				<div class="col3 content"></div>		
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
	var type="vidio_title";
	 $("document").ready(function(){
		listCall(currPage);
	}); 
	
	$("#pagePerNum").change(function(){
		searchCall(currPage);
	});
	
	$(".type").change(function(){
		type=$(".type option:selected").val();
		console.log(type);
	});
	
	function Search(){
		var url="../vidio/search";
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
			var url="../vidio/searchCall";
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
			var url="../vidio/listCall";
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
				if(url=="../vidio/listCall"){
					printList(data.jsonList.list);
					currPage=data.currPage;
					totalPage=data.totalPage;
					printPaging(data.totalCount, data.totalPage); 
				}
				else if(url=="../vidio/search"){
					if(data.count!=0){
						console.log(data.count);
						searchCall(1);
					}else{
						alert("검색 결과가 없습니다.");
					}
				}
				else if(url=="../vidio/searchCall"){
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
			+"<td>"+list[i].vid_idx+"</td>"
			+"<td>"+list[i].vid_name+"</td>"
			+"<td><a href='../vidio/vidioDetail?idx="+list[i].vid_idx+"'>"+list[i].vid_title+"</a></td>"
			+"<td>"+list[i].vid_vcount+"</td>"
			+"<td>"+list[i].vid_state+"</td>"
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
	$("#paging").empty();
	$("#paging").append(content);
} 
	</script>
</html>