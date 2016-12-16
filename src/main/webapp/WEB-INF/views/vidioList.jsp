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
			#vidioList{
				position: absolute;
				left: 270px;
				top: 290px;
			}
			.search{
				text-align: right;
			}
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
		<div class="col2">
		<h3>영상 게시판</h3>
		</div>
		<div class="col5">
			<table width="100%">
				<tr>
					<td><button>글작성</button></td>
					<td class="search">
						<button>검색</button>
						<input type="text" size="20" />
					</td>
				</tr>
			</table>
			<table class="table table-hover totalTable">
				<thead>
					<tr>
						<th>순번</th>
						<th>글쓴이</th>
						<th>제목</th>
						<th>조회 수</th>
					</tr>
				</thead>
				<tbody id="list">			
				<!-- 리스트가 출력될 영역 -->
				</tbody>
				<tr>
					<td colspan="4" id="paging">
						<div id="pagenation"></div>
					</td>
				</tr>
			</table>
			</div>
			<div class="col3"></div>
		</div>
		</div>
	</body>
	<script>
	var msg = "${msg}";
	console.log("msg : "+msg);
	if(msg != ""){
		alert(msg);
	}
	
	var currPage = 1;
	
	vidioList(currPage);
	
	$("#pagePerNum").change(function(){
		vidioList(currPage);
	});
	
	function vidioList(currPage){
		var url="./Vidio/vidioList";
		var data = {};
		data.page = currPage;
		data.pagePerNum = $("#pagePerNum").val();
		reqServer(url, data);
	}
	
	function reqServer(url, data){
		console.log(url);
		$.ajax({
			url:url,
			type:"post",
			data:data,
			dataType:"json",
			success:function(d){
				console.log(d)
				if(url == "./Vidio/vidioList"){
					printList(d.jsonList.list);
					currPage = d.currPage;
					printPaging(d.allCnt, d.page);
				}
			},
			error:function(e){
				console.log(e)
			}
		});
	}
	
	function printList(list){
		console.log(list);
		var content = "";
		for(var i=0; i<list.length; i++){
			content += "<tr>"
			+"<td>"+list[i].j_idx+"</td>"
			+"<td>"+list[i].j_name+"</td>"
			+"	<td>"
				+"<a href='./detail?idx="+list[i].j_idx+"'>"
				+list[i].j_title+"</a>";
			
			/*
			if(list[i].newFileName != null){
				content += "<img width='15px' src='resources/img/default.png'/>";
			}	
			*/
			content +="</td>"
			+"<td>"+list[i].j_vcount+"</td>"
			+"</tr>"
		}
		$("#list").empty();
		$("#list").append(content);
	}
	
	//페이지 그리기(플러그인 사용)
	function printPaging(allCnt, pageNum){
		console.log("전체 게시물 :"+allCnt );
		console.log("생성 가능 페이지 :"+pageNum );
		console.log("현재 페이지 :"+currPage);
		
		 $("#pagenation").paginate({
			count 		: pageNum,
			start 		: currPage,
			display     : 5,
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
			onChange	: function(page){
				listCall(page);
			} 
		});
		
	}
	
	</script>
</html>