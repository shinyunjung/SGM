<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Insert title here</title>
		<script src="https://code.jquery.com/jquery-3.1.0.min.js"></script>
		<style>
		
			#logo{
				width: 1080px;
				text-align: center;
				font-size: large;
				display: inline-block;
				margin: 0 auto;
				margin-bottom: 20px;
			}
			
			.userMsg{
				width: 1080px;
				text-align: right;
			}
			#logoImg{
				width: 300px;
				height: 100px; 
			}
			.layer{
				width: auto;
				text-align: center;
			}
	
			.page {
				height: auto;
				width: 1080px;
				/* border: 1px solid; */
				display: inline-block;
				margin: 0 auto;
			} 
			.col2{
				width:20%;
				padding-top: 30px;
				border: 1px solid blue;
			}
			.col5{
				width: 60%;
				text-align: center;
				padding-left: 1%;
				padding-right: 1%;
				border: 1px solid red;
			}
			.col3{
				width: 20%;
				border: 1px solid ;
			}
		    
				
			.content {
				height: auto;
				/* border: 1px solid; */
	            float: left;
	    	}
			
		/**게시판 스타일**/
			.totalTable{
				width: 700px;
				text-align: center;
				border-bottom: 1px solid silver;
			}
			
		/**검색 스타일(글작성 없음)**/	
			#searchManager{
				width: 970px;
				text-align: right;
			}
		
		/**검색 스타일(글작성 있음)**/	
			#searchList{
				position: absolute;
				left: 270px; 
				width: 700px;
			}
			
		/**border 한방향 스타일**/
			.borderLeft{
				border-left: 1px solid;
			}
			.borderRight{
				border-right: 1px solid;
			}
			.borderBottom{
				border-bottom: 1px solid;
			}
			.borderTop{
				border-top: 1px solid;
			}	
			
		/**텍스트 위치 스타일**/
		.right{
			text-align: right;
		}
		.left{
			text-align: left;
		}
		.center{
			text-align: center;
		}	
		</style>
	</head>
	<body>
		<div class="layer">
			<div id="logo" >
				 <a href="../../main/index"><img id="logoImg" src="../../main/resources/include/img/logo.jpg" /></a>
			</div>
		</div>
	</body>
	<script>
		setInterval(function(){
			var url="../../main/match/playing";
			var data={};
			console.log("시간");
			InterServer(url, data);
		}, 20000);
		
		function InterServer(url, data){
			$.ajax({
				url:url,
				type:"post",
				data:data,
				dataType:"JSON",
				success:function(data){
					console.log(data);
					if(url=="../../main/match/playing"){
						console.log("현재 진행중 jsp");
						printPlaying(data.mchList);
					}
				},
				error:function(error){
					console.log(error);
				}
			});
		}
		
		
		function printPlaying(list){
			var i=0;
			setInterval(function(){
				if(i>list.length){
					i=0;
				}
				console.log("playingList");
				playingList(list, i);
				i++;
			}, 10000);
		}
		
		function playingList(list, num){
			console.log("경기 진행중인 시합"+num);
			var content="";
			content+="<tr>"
			+"<td>"+"dddd"+"</td>";
			+"</tr>";
			$("#nowGame").empty();
			$("#nowGame").append(content);
		}
	</script>
</html>