<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>장소목록 상세보기</title>
		<script src="https://code.jquery.com/jquery-3.1.0.min.js"></script>
		<script src="../../main/resources/bootstrap/js/bootstrap.js"></script>
		<link rel="stylesheet" type="text/css" href="../../main/resources/bootstrap/css/bootstrap.css" />
		<style>
		   .map_wrap {position:relative;width:100%;height:350px;}
		   .title {font-weight:bold;display:block;}
	  
		   #centerAddr {display:block;margin-top:2px;font-weight: normal;}
		   .bAddr {padding:5px;text-overflow: ellipsis;overflow: hidden;white-space: nowrap;}
		
			#replyZone{
			}
			#repleBox{
				width: 100%;
				padding: 10px;
			}
			.AD{
				width: 250px;
				position: absolute;
				left: 1000px;
				top: 270px;
				
			}
			.detailTable{
				width: 100%;
			}
			.subject{
				width: 60%;
			}
			.reple{
				text-align: left;
				width: 10%;
			}
			.data{
				width: 82%;
				padding: 10px;
			}
			.repleBtn{
				margin: 5px;
				width: 8%;
			}
			textarea{
				width: 100%;
				resize: none;
			}
			#img{
				width: 150px;
				height: 100px;
	            margin: 10px;
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
						<legend>장소목록</legend>
					</fieldset>
					<c:if test="${sessionScope.userId=='admin'}">
						<div class="manager">
							<jsp:include page="../../resources/include/manager.jsp" />
						</div>
					</c:if>
				</div>
				
				<!-- 두 번째 구역 -->
				<div class="col5 content">
				
					<table class="detailTable">
						<thead>
							<tr class="borderBottom">
								<td colspan="6">${detail.a_ground}</td>
							</tr>
							<tr class="borderBottom">
								<td>작성자</td>
								<td class="borderLeft">${detail.a_name}</td>
								<td class="borderLeft">DATE</td>
								<td class="borderLeft">${detail.a_date}</td>
								<td class="borderLeft">조회수</td>
								<td class="borderLeft">${detail.a_vcount}</td>
							</tr>
						</thead>
						<tbody>
							<tr class="borderBottom">
								<td>주소</td>
								<td colspan="5" class="borderLeft">
									${detail.a_address}
								</td>
							</tr>
							<tr class="borderBottom">
								<td colspan="2">
									<img id="img" alt="${detail.a_oldPicture}" src="../../main/resources/upload/${detail.a_newPicture}">
								</td>
								<td colspan="4" class="borderLeft">
									<div>
										${detail.a_content}
									</div>
								</td>
							</tr>
							<tr class="borderBottom">
								<td colspan="6">
									<div class="map_wrap">
  						  			<div id="map" style="width:100%;height:100%;position:relative;overflow:hidden;"></div>
    									<jsp:include page="../../resources/include/mapSearch.jsp" />
        							</div>
  								
								</td>
							</tr>
							<tr>
								<td class="reple"><a>댓글</a></td>
								<td colspan="5" class="right ">
									<button>등록</button> / <button>삭제</button>
								</td>
							</tr>
						</tbody>
					</table>
					
					<!-- 댓글 -->
					<div id="replyZone">
						<table id="repleBox" class="borderTop">
							<tr>
				
								<td class="data"><textarea rows="3"></textarea></td>
								<td class="repleBtn"><button id="go">등록</button></td>
							</tr>
						</table>
					</div>
					
				</div>
				<!-- 세 번째 구역 -->
				<div class="col3 content">
					<div id="ad">
					</div>
				</div>
			</div>
		</div>
	</body>
	<script>
	addMarker("${detail.a_lat}", "${detail.a_lng}");
	</script>		
					
					
</html>