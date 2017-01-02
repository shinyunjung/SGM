<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>팀관리 페이지</title>
		<script src="https://code.jquery.com/jquery-3.1.0.min.js"></script>
		<script src="../../main/resources/bootstrap/js/bootstrap.js"></script>
		<link rel="stylesheet" type="text/css" href="../../main/resources/bootstrap/css/bootstrap.css" />
		<style>
			.manager{
				margin-left: 10%;
			}
			th{
				text-align: center;
			}
			#popup{
	     	 position:absolute; 
			z-index:2;
			width: 50%;
			height: 53px;
			background-color:#f5f5f5;
			display:none;
		}
		
		#myimporm{
	        text-align: right;
	        width: 20%;
		}
		#myimporm{
		  padding-bottom: 10px;
		   width: 100%;
		   height: 100%;
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
						<legend>팀 정보</legend>
					</fieldset>
					<div class="manager">
						<jsp:include page="../../resources/include/manager.jsp" />
					</div>
				</div>	
				
				<!-- 두 번째 구역 -->
				<div class="col5 content">
					<div id="popup">
					<!-- 아이디 -->	
						<table id="myimporm">
			  			<tr>
			  				<th>아이디</th>
			  				<td class=infoId></td>
			  				<th>성명</th>
			  				<td class="infoName"></td>
			  			</tr>
			  			<tr>
			  				<th>성별</th>
			  				<td class="infoGender"></td>
			  				<th>생년월일</th>
			  				<td class="infoAge"></td>
			  			</tr>
			  			<tr>
			  				<th>핸드폰</th>
			  				<td class="infoPhun"></td>
			  				<th>이메일</th>
			  				<td class="infoEmail"></td>
			  			</tr>
			  			<tr>
			  				<td colspan="4" class="center"><button class="infoDel">취소</button></td>
			  			</tr>
			  		</table>
					</div>
					<table width="100%">
							<tr>
								<td class="left">
									게시물 갯수 : 
									<select id="pagePerNum">
										<option value="10">10</option>
										<option value="20">20</option>
										<option value="30">30</option>
										<option value="40">40</option>
									</select>
								</td>
								<td class="right">
									<input type="text" size="20" class="input"/>
									<button onclick="Search()">검색</button>
								</td>
							</tr>
							<tr>
								<td>
								</td>
							</tr>
						</table>
					<div class="teamManager">
						<table class="table table-hover">
							<thead>
								<tr>
									<th>NO</th>
									<th>팀명</th>
									<th>지역</th>
									<th>대표</th>
									<th>해체</th>
								</tr>
							</thead>
							<tbody id="list">
								<tr>
									<td>0</td>
									<td>OOO</td>
									<td>OOOOO</td>
									<td>0</td>
									<td>해체</td>
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
			var pagePerNum=$("#pagePerNum").val();
			var currPage=1;//현재 페이지
			var totalPage=1;
			var search=false;
			var input = "";
			var idx="${sessionScope.userIdx}";
			var msg="";
			msg="${msg}";
			
			if(msg!=""){
				alert(msg);
			}
			
			$("document").ready(function(){
				searchCall(currPage);
			});
			
			$("#pagePerNum").change(function(){
				pagePerNum=$("#pagePerNum").val();
				currPage=1;
				searchCall(currPage);
			});
			
			
			function Search(){
				var url="../../main/manager/teamSearch";
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
					var url="../../main/manager/teamSearchCall";
					var data={};
					search=true;
					console.log($(".input").val());
					if($(".input").val()!=""){
						console.log("검색");
						input=$(".input").val();
						$(".input").val("");	
					}
					data.input=input;
					console.log(input);
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
						if(url=="../../main/manager/teamSearch"){
							if(data.count!=0){
								console.log(data.count);
								searchCall(1);
							}else{
								alert("검색 결과가 없습니다.");
							}
						}
						else if(url=="../../main/manager/teamSearchCall"){
							console.log("검색 종료");
							printList(data.jsonList.list);
							currPage=data.currPage;
							totalPage=data.totalPage;
							printPaging(data.totalCount, data.totalPage); 
						}else if(url=="../../main/manager/memberInfo"){
							console.log("대표 정보");
							printInfo(data.info);
						}else if(url=="../../main/manager/teamDelete"){
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
				content+="<tr>"
					+"<td>"+list[i].t_idx+"</td>"
					+"<td>"+list[i].t_name+"</td>"
					+"<td>"+list[i].t_area+"</td>"
					+"<td><a href='#' onclick='memberInfo("+list[i].u_idx+")' >"+list[i].m_name+"</a></td>"
					+"<td>"+"<a href='#' onclick='teamDelete("+list[i].t_idx+")'>해체</a></td>"
					+"</tr>";
				}
				
				$("#list").empty();
				$("#list").append(content);
				logoId();
			}
		
		
		
		 //페이지 그리기
		function printPaging(count, page){
			var totalRange=page/5;
			var totalEnd=0;
			
			console.log("전체 게시물:"+count);
			console.log("전체 페이지:"+page);
			console.log("현재 페이지:"+currPage);
			
			if(currPage>page){
				currPage=page;
				searchCall(currPage);
			}
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
		 
		 
	//대표 정보
	function memberInfo(idx){
		var url="../../main/manager/memberInfo";
		var data={};
		data.idx=idx;
		reqServer(url, data);
	}
	
	
	//대표정보 그리기
	function printInfo(data){
		$("#popup").css("display","block");
		$(".infoId").html(data.u_id);
		$(".infoName").html(data.u_name);
		$(".infoGender").html(data.u_gender);
		$(".infoEmail").html(data.u_mail);
		$(".infoAge").html(data.u_age);
		$(".infoPhun").html(data.u_phnum);
		$(".teamManager").css("display","none");
	}
	$(".infoDel").click(function(){
		$(".infoId").html("");
		$(".infoName").html("");
		$(".infoGender").html("");
		$(".infoEmail").html("");
		$(".infoAge").html("");
		$(".infoPhun").html("");
		$("#popup").css("display","none");
		$(".teamManager").css("display","block");
	});
	
	function teamDelete(idx){
		var url="../../main/manager/teamDelete";
		data={};
		data.idx=idx;
		reqServer(url, data);
	}
</script>
</html>