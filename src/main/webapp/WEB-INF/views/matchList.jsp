<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>매칭 게시판</title>
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
									<input type="text" size="20" />
									<button>검색</button>
								</td>
							</tr>
						</table>
					</div>
					<div class="matchList">
						<table class="table table-hover totalTable">
							<thead>
								<tr>
									<th>순번</th>
									<th>글쓴이</th>
									<th>제목</th>
									<th>조회 수</th>
									<th>상태</th>
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
							<tr >
								<td colspan="6" id="paging">
									<div id="pagenation">
						
									</div>
								</td>
							</tr>
						</table>
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
		
		$("document").ready(function(){
			listCall(currPage);
		});
		
		$("#pagePerNum").change(function(){
			listCall(currPage);
		});
		
		function listCall(currPage){
			var url="./rest/listCall";
			var data={};
			data.page=currPage;
			data.pagePerNum=$("#pagePerNum").val();
			reqServer(url, data);
		}
		
		
		function reqServer(url, data){
			console.log(url);
			$.ajax({
				url:url,
				type:"post",
				data:data,
				dataType:"JSON",
				success:function(data){
					console.log(data);
					if(url=="./rest/listCall"){
						printList(data.jsonList.list);
						currPage=data.currPage;
						/* printPaging(data.totalCount, data.totalPage); */
					}else if(url=="./rest/delete"){
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
				+"<td>"+list[i].mch_title;+"</td>"
				+"<td>"+list[i].mch_vcount+"</td>"
				+"<td>"+list[i].mch_state+"</td>";
			}
			
			$("#list").empty();
			$("#list").append(content);
		}
	
	/* //플러그인 사용
	function printPaging(count, page){
		console.log("전체 게시물:"+count);
		console.log("전체 페이지:"+page);
		console.log("현재 페이지:"+currPage);
		console.log($("#pagenation"));
		
		$("#pagenation").paginate({
			count 		: page, //전체 페이지 수
			start 		: currPage, //어느 페이지 부터 시작인가
			display     : 5, //몇 개의 페이지까지 보여줄 것인가
			border					: true,
			border_color			: '#BEF8B8',
			text_color  			: '#68BA64',
			background_color    	: '#E3F2E1',	
			border_hover_color		: '#68BA64',
			text_hover_color  		: 'black',
			background_hover_color	: '#CAE6C6', 
			rotate      : false,
			images		: false,
			mouse		: 'press',
			onChange : function(currPage){
				listCall(currPage);
			}
		});

	} */
	</script>
</html>