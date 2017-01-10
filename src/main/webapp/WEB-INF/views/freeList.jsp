<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<html>
   <head>
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <title>자유 게시판</title>
      <script src="https://code.jquery.com/jquery-3.1.0.min.js"></script>
      <script src="../../main/resources/bootstrap/js/bootstrap.js"></script>
      <link rel="stylesheet" type="text/css" href="../../main/resources/bootstrap/css/bootstrap.css" />
      <style>
         th{
            text-align: center;
         }
         .margin{
			margin: 0;
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
                  <legend>자유 게시판</legend>
               </fieldset>
            </div>
            
            <!-- 두 번째 구역 -->
            <div class="col5 content">   
               <div class="search">
                  <table class="table margin">
                     <tr>
                        <td class="left">
                           <button onclick="location.href='./freeWrite'">글작성</button>
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
										<option value="j_title">제목</option>
										<option value="j_content">내용</option>
										<option value="j_name">글쓴이</option>
									</select>
									<input type="text" size="20" class="input"/>
									<button onclick="Search()">검색</button>
								</td>
                     </tr>
                  </table>
               </div>
               <div id="freeList">
                  <table class="table table-hover center">
                     <thead>
                        <tr>
                           <th>순번</th>
                           <th>작성자</th>
                           <th>제목</th>
                           <th>작성일</th>
                           <th>조회 수</th>
                        </tr>
                     </thead>
                     <tbody id="list">
                        
                     </tbody>    
                  </table>
                
                 <div id="pagenation">
                  
                 </div>
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
   var type="j_title";
    
   f_listCall(currPage);
  
   
   $("#pagePerNum").change(function(){
	   f_listCall(currPage);
   });
   
  
   function Search(){
      console.log("검색");
		input=$(".input").val();
		var count=input.length;
		console.log(count);
		if(count>1){
			f_listCall(currPage);
		}else{
			alert("검색하실 단어는 2글자 이상이여야합니다.");
		}
   }
   
   
   function f_listCall(currPage){
      if(currPage>=1 && currPage<=totalPage){
         var url="../free/f_listCall";
         var data={};
         data.input=input;
			data.type=$(".type").val();	
			data.page=currPage;
			data.pagePerNum=$("#pagePerNum").val();
			data.j_category = "3";
			$(".input").val("");
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
            if(data.totalCount!=0){
               printList(data.jsonList.list);
               currPage=data.currPage;
               totalPage=data.totalPage;
               printPaging(data.totalCount, data.totalPage); 
            }else{
               alert("검색 결과가 없습니다.");
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
         +"<td>"+list[i].j_idx+"</td>"
         +"<td>"+list[i].j_name+"</td>"
         +"<td><a href='./freeDetail?idx="+list[i].totalIdx+"'>"+list[i].j_title+"</a></td>"
         +"<td>"+list[i].j_date+"</td>" 
         +"<td>"+list[i].j_vcount+"</td>"
         +"</tr>";
      }
      
      $("#list").empty();
      $("#list").append(content);
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
		content+="<li class='page-item first'><a href='#' onclick='f_listCall("+1+")'>First</a></li>"
		+"<li class='page-item prev'><a href='#' onclick='f_listCall("+(start-1)+")'> << </a></li> "
		+"<li class='page-item before'><a href='#' onclick='f_listCall("+pre+")'> < </a></li> ";
		for(var i=start; i<=end; i++){
			if(i<=page){
				if(currPage==i){
					content+="<li class='page-item active'><a href='#'><b>"+i+"</b></a></li>";	
				}else{
					content+="<li class='page-item'> <a href='#' onclick='f_listCall("+i+")'>"
					+i+"</a></li> ";
				}	
			}
		}
		content+="<li class='page-item after'><a href='#' onclick='f_listCall("+next+")'> > </a></li> "
		+"<li class='page-item next'> <a href='#' onclick='f_listCall("+(end+1)+")'> >> </a></li>"
		+"<li class='page-item last'><a href='#' onclick='f_listCall("+page+")'>Last</a></li>";	
	$("#pagenation").empty();
	$("#pagenation").append(content);
	
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