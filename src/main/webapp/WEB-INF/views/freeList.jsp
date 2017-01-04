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
                  <legend>자유 게시판</legend>
               </fieldset>
            </div>
            
            <!-- 두 번째 구역 -->
            <div class="col5 content">   
               <div class="search">
                  <table>
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
                  <table class="table table-hover">
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
    $("document").ready(function(){
       f_listCall(currPage);
   }); 
   
   $("#pagePerNum").change(function(){
      f_searchCall(currPage);
   });
   
   $(".type").change(function(){
      type=$(".type option:selected").val();
      console.log(type);
   });
   
   function Search(){
      var url="../free/f_search";
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
   
   
   function f_searchCall(currPage){
      if(currPage>=1 && currPage<=totalPage){
         var url="../free/f_searchCall";
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
   
   function f_listCall(currPage){
      if(currPage>=1 && currPage<=totalPage){
         var url="../free/f_listCall";
         var data={};
         data.page=currPage;
         data.pagePerNum=$("#pagePerNum").val();
         data.j_category = "3";
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
            if(url=="../free/f_listCall"){
               printList(data.jsonList.list);
               currPage=data.currPage;
               totalPage=data.totalPage;
               printPaging(data.totalCount, data.totalPage); 
            }
            else if(url=="../free/f_search"){
               if(data.count!=0){
                  console.log(data.count);
                  f_searchCall(1);
               }else{
                  alert("검색 결과가 없습니다.");
               }
            }
            else if(url=="../free/f_searchCall"){
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
         +"<td>"+list[i].j_idx+"</td>"
         +"<td>"+list[i].j_name+"</td>"
         +"<td><a href='../free/freeDetail?j_idx="+list[i].j_idx+"'>"+list[i].j_title+"</a></td>"
         +"<td>"+list[i].j_date+"</td>" 
         +"<td>"+list[i].j_vcount+"</td>"
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
      content+="<a href='#' onclick='f_searchCall("+1+")'>처음</a> |"
      +" <a href='#' onclick='f_searchCall("+(start-1)+")'> << </a> "
      +"<a href='#' onclick='f_searchCall("+pre+")'> < </a> ";
      for(var i=start; i<=end; i++){
         if(i<=page){
            if(currPage==i){
               content+="<b>"+i+"</b>";
            }else{
               content+=" <a href='#' onclick='f_searchCall("+i+")'>"
               +i+"</a> ";
            }   
         }
      }
      content+="<a href='#' onclick='f_searchCall("+next+")'> > </a> "
      +" <a href='#' onclick='f_searchCall("+(end+1)+")'> >> </a>"
      +"| <a href='#' onclick='f_searchCall("+page+")'>끝</a>";   
   $("#paging").empty();
   $("#paging").append(content);
} 
   </script>
</html>