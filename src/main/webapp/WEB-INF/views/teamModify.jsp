<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Insert title here</title>
		<script src="https://code.jquery.com/jquery-3.1.0.min.js"></script>
		<script src="resources/bootstrap/js/bootstrap.js"></script>
		<link rel="stylesheet" type="text/css" href="resources/bootstrap/css/bootstrap.css" />
		<style>
			.fil{
				height: 500px;
			}
			.img{
               border: 1px solid; 
				width: 170px;
				height: 220px;
                margin-left: 10px;
                margin-bottom: 10px; 
			}
			
			table{
			width: 100%;
			}
			#team th{
				text-align: right;
				padding-bottom: 5px;
				padding-right: 10px;
				width: 20%;
				/* border: 1px solid; */
			}
			#team td{
				padding-bottom: 10px;
				width: 60%;
				height: 36px;
				/*  border: 1px solid; */
			}
			#member td,th{
				text-align: center;
			}
			input[name="u_id"],
			input[name="m_name"],
			input[name="m_position"]{
				width: 80px;
			}
		</style>
	</head>
	<body>
		<jsp:include page="../../resources/include/logo.jsp" />
		<jsp:include page="../../resources/include/nav.jsp" />
		<div class="layer">
			<div class="page">
			<form class="form-horizontal"name="mainForm" id="mainForm" method="post">
				<!-- 첫 번째 구역 -->
				<div class="col3 content">
					<fieldset class="fil">
						<legend>팀 정보</legend>
					
						<div class="img">
							<img src="">
							사진
						</div>
						<input type="file" name="t_picture"/>
					</fieldset>
				</div>
				
				<!-- 두 번째 구역 -->
				<div class="col5 content">
				<div class="well bs-component">
			 	<fieldset>
			  	<legend>팀정보수정</legend>
			  		<table id="team">
			  			<tr>
			  				<th>팀명</th>
			  				<td></td>
			  				<td></td>
			  			</tr>
			  			<tr>
			  				<th>지역</th>
			  				<td>
			  					<select name="gu"></select>
			  				</td>
			  				<th></th>
			  			</tr>
			  			<tr>
			  				<th>모임요일</th>
			  				<td>
				  				<input type="checkbox" name="t_day" /> 월&nbsp;
				  				<input type="checkbox" name="t_day" /> 화&nbsp;
				  				<input type="checkbox" name="t_day" /> 수&nbsp;
				  				<input type="checkbox" name="t_day" /> 목&nbsp;
				  				<input type="checkbox" name="t_day" /> 금&nbsp;
				  				<input type="checkbox" name="t_day" /> 토&nbsp;
				  				<input type="checkbox" name="t_day" /> 일&nbsp;
			  				</td>
			  				<th></th>
			  			</tr>
			  			<tr>
			  				<th>모임시간</th>
			  				<td>
			  					<input type="time" class="form-control" value="" >
			  				</td>
			  				<th></th>
			  			</tr>
			  			<tr>
							<th>유형</th>
							<td><select name="mch_type"></select></td>
						</tr>
			  			<tr>
							<th>연령대</th>
							<td><select name="mch_age"></select></td>
						</tr>
			  			<tr>
			  				<th>유니폼색</th>
			  				<td>
			  					<input type="text" class="form-control" value="">
			  				</td>
			  				<th></th>
			  			</tr>
			  			<tr>
			  				<td colspan="3" style="text-align: center;">
			        		<button type="submit" class="btn btn-primary">등록</button>
			  				</td>
			  			</tr>
			  		</table>
			  </fieldset>
			</div>
			</div>
		</form>
			<div class="col5 content">
			<div class="member">
				-------------------------------------------------------------------------------------------------------------------------	
				<table class="table">
					<thead id="member">
						<tr>
							<th>멤버 리스트</th>
							<th colspan="6" >
							</th>
							<th>
								<button class="btn btn-default">추가</button>
							</th>
						</tr>
						<tr>
							<th>아이디</th>
							<th style="width: 100px;">이름</th>
							<th style="width: 100px;">포지션</th>
							<th>총점</th>
							<th>경기수</th>
							<th>등급</th>
							<th>삭제</th>
							<th>등록</th>
						</tr>
					</thead>
					<tbody class="mem">
						<tr>
							<td>아이디</td>
							<td>이름</td>
							<td>포지션</td>
							<td>총점</td>
							<td>경기수</td>
							<td>
								<select name="m_grade">
									<option value="멤버">멤버</option>
									<option value="대표">대표</option>
								</select>
							</td>
							<td><button class="btn btn-primary">삭제</button></td>
							<td><button class="btn btn-success">등록</button></td>
						</tr>
						<tr>
							<td>
								<input type="text" name="u_id">
							</td>
							<td>이름</td>
							<td>포지션</td>
							<td>총점</td>
							<td>경기수</td>
							<td>등급</td>
							<td><button class="btn btn-primary">삭제</button></td>
							<td><button class="btn btn-success">등록</button></td>
						</tr>
					</tbody>	
				</table>	
			</div>
		</div>
		</div>
		</div>			
		<jsp:include page="../../resources/include/footer.jsp" />		
	</body>
	<script>
	$(document).ready(function(){
		var frm = document.getElementById('mainForm');
		for (var i=0; i<10; i++) {
			frm['gu'].options[i] = new Option(i+1, i+1);
		}
		
		frm['mch_type'].options[0] = new Option('축구', '축구');
		frm['mch_type'].options[1] = new Option('풋살', '풋살');
		
		var no=0;
		for(var i=1; i<7; i++){
			for(var j=0; j<2; j++){
				var l = i+1;
				if(j<1){
					frm['mch_age'].options[no] = new Option(i+'0대', i+'0대');
				}else{
					frm['mch_age'].options[no] = new Option(i+'0대~'+l+'0대', i+'0대~'+l+'0대');
				}
				no++;
			}
		}
	});
	$(".btn-default").click(function(){
		$(".mem").append(
				"<tr><td><input type='text' name='u_id'></td>"
				+"<td><input type='text' name='m_name'></td>"
				+"<td><input type='text' name='m_position'></td>"
				+"<td>0</td>"
				+"<td>0</td>"
				+"<td><select name='m_grade'>"
				+"<option value='멤버'>멤버</option>"
				+"<option value='대표'>대표</option>"
				+"</select></td>"
				+"<td><button class='btn btn-primary'>삭제</button></td>"
				+"<td><button class='btn btn-success'>등록</button></td></tr>"
		);
	});
	$(".btn-primary").click(function(){
		/* 멤버번호가 존재하면 멤버 삭제 없으면 줄삭제 */
		
	});
	(".btn-success").click(function(){
		/* 멤버번호가 존재하면 아이디등록 없으면 멤버등록  */
	
	});
	</script>
</html>