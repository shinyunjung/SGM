<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<html>
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>메인 페이지</title>
	<script src="https://code.jquery.com/jquery-3.1.0.min.js"></script>
	<script src="resources/bootstrap/js/bootstrap.js"></script>
	<link rel="stylesheet" type="text/css" href="resources/bootstrap/css/bootstrap.css" />
	<style>
	.fieldset{
		background-color: #f5f5f5;
	  	border: 1px solid #e3e3e3;
	 	border-radius: 4px;
	 	text-align: center;
	}
	table{
		width: 100%;
	}
	th{
          text-align: right;
          padding-bottom: 10px;
          padding-right: 10px;
          width: 20%;
          /* border: 1px solid; */
       }
       td{
         padding-bottom: 10px;
          width: 20%;
         /*  border: 1px solid; */
       }
       
/* 	.form-group{
		margin-left: 20%;
	} */
	
	/* table, td{
         form-group border:2px solid;
          text-align: center;
       }
       td{
       	text-align:center;
       
       }
       .index{
       	width:200px;
       } */
       /* input[type='text']{
			width:60%;
			height:80%;
			
		} */
	/* .left{
		text-align:left;
		padding:10px;
	}	 */
	</style>
</head>
<body>
	<jsp:include page="../../resources/include/logo.jsp" />
	<jsp:include page="../../resources/include/nav.jsp" />
	<div class=" layer">
	<div class="page">
		<div class="col2 content">
		<!-- 배너 -->
		</div>
		<div class="col5 content"> 
            <div class="well bs-component">
			<form class="form-horizontal">
			  <fieldset>
			  	<legend>회원가입</legend>
			  		회원정보를 입력해 주세요. 모두 입력하셔야 가입이 가능합니다.
			  		<table class="cen">
			  			<tr>
			  			<td colspan="2">회원정보를 입력해 주세요. 모두 입력하셔야 가입이 가능합니다.
			  				</td>
			  			</tr>
			  			<tr>
			  				<th>아이디
			  				</th>
			  				<td colspan="3">
			  				<input type="text" class="form-control" placeholder="아이디">
			  				</td>
			  				<th>
			  				</th>
			  			</tr>
			  			<tr>
			  				<th>비밀번호
			  				</th>
			  				<td colspan="3">
			  				<input type="password" class="form-control" placeholder="비밀번호">
			  				</td>
			  				<th>
			  				</th>
			  			</tr>
			  			<tr>
			  				<th>비밀번호
			  				</th>
			  				<td colspan="3">
			  				<input type="password" class="form-control" placeholder="비밀번호">
			  				</td>
			  				<th>
			  				</th>
			  			</tr>
			  			<tr>
			  				<th>성명
			  				</th>
			  				<td colspan="3">
			  				<input type="text" class="form-control" placeholder="성명" >
			  				</td>
			  				<th>
			  				</th>
			  			</tr>
			  			<tr>
			  				<th>생년월일
			  				</th>
			  				<td>
			  					<select id="year"><option>- 선택하세요 -</option></select>
			  				</td>
			  				<td>
			  					<select id="month"><option>- 선택하세요 -</option></select>
			  				</td>
			  				<td>
			  					<select id="date"><option>- 선택하세요 -</option></select>
			  				</td>
			  				<th>
			  				</th>
			  			</tr>
			  			<tr>
			  				<th>성별
			  				</th>
			  				<td>
			  				<input type="radio" name="" /> 남자
			  				</td>
			  				<td>
			  				<input type="radio" name="" /> 여자
			  				</td>
			  				<td>
			  				</td>
			  				<th>
			  				</th>
			  			</tr>
			  			<tr>
			  				<th>email
			  				</th>
			  				<td colspan="3">
			  				<input type="email" class="form-control" placeholder="email" >
			  				</td>
			  				<th>
			  				</th>
			  			</tr>
			  			<tr>
			  				<th>인증번호
			  				</th>
			  				<td colspan="3">
			  				<input type="text" class="form-control" placeholder="인증번호" >
			  				</td>
			  				<th>
			  				</th>
			  			</tr>
			  			<tr>
			  				<th>
			  				</th>
			  				<td colspan="3">
			  				<button type="reset" class="btn btn-default">Cancel</button>
			        		<button type="submit" class="btn btn-primary">Submit</button>
			  				</td>
			  				<th>
			  				</th>
			  			</tr>
			  		</table>
			  		
			  </fieldset>
			</form>
			</div>
		</div>
		<div class="col3 content">      
		//배너
		</div>
		</div>
	</div>
	<jsp:include page="../../resources/include/footer.jsp" />
	
	<!-- ID찾기 -->
	<div class="joinform">
		<form action="join" method="post">    
           <table> 
			<tr>
				<td class="index"><h3>ID</h3></td>
				<td class="left">
					<input width="auto" type="text" name="userId"/>
                       <input type="button" name="cheak" value="중복확인"/>
				</td>
			</tr>
			<tr>
				<td class="index"><h3>PW</h3></td>
				<td class="left">
					<input  width="auto" type="text" name="userPass"/>
				</td>
			</tr>
               <tr>
                   <td class="index"><h3>확인</h3></td>
                   <td class="left">
                       <input  width="auto" type="text" name="userPass"/>
                   </td>
               </tr>
			<tr>
				<td class="index"><h3>성명</h3></td>
				<td class="left">
					<input  width="auto" type="text" name="userName"/>
				</td>
			</tr>
			<tr>
				<td class="index"><h3>생년월일</h3></td>
				<td class="birthday"><select name="user_birth_year"><br>
                       <option value="1942" selected>1942</option><br>
                       <option value="1943" selected>1943</option><br>
                       <option value="1944" selected>1944</option><br>
                       <option value="1945" selected>1945</option><br>
                       <option value="1946" selected>1946</option><br>        
                       <option value="1947" selected>1947</option><br>
                       <option value="1948" selected>1948</option><br>
                       <option value="1949" selected>1949</option><br>
                       <option value="1950" selected>1950</option><br>
                       <option value="1951" selected>1951</option><br>
                       <option value="1952" selected>1952</option><br>
                       <option value="1953" selected>1953</option><br>
                       <option value="1954" selected>1954</option><br>
                       <option value="1955" selected>1955</option><br>
                       <option value="1956" selected>1956</option><br>
                       <option value="1957" selected>1957</option><br>
                       <option value="1958" selected>1958</option><br>
                       <option value="1959" selected>1959</option><br>
                       <option value="1960" selected>1960</option><br>
                       <option value="1961" selected>1961</option><br>
                       <option value="1962" selected>1962</option><br>
                       <option value="1963" selected>1963</option><br>
                       <option value="1964" selected>1964</option><br>
                       <option value="1965" selected>1965</option><br>
                       <option value="1966" selected>1966</option><br>
                       <option value="1967" selected>1967</option><br>
                       <option value="1968" selected>1968</option><br>
                       <option value="1969" selected>1969</option><br>
                       <option value="1970" selected>1970</option><br>
                       <option value="1971" selected>1971</option><br>
                       <option value="1972" selected>1972</option><br>
                       <option value="1973" selected>1973</option><br>
                       <option value="1974" selected>1974</option><br>
                       <option value="1975" selected>1975</option><br>
                       <option value="1976" selected>1976</option><br>
                       <option value="1977" selected>1977</option><br>
                       <option value="1978" selected>1978</option><br>
                       <option value="1979" selected>1979</option><br>
                       <option value="1980" selected>1980</option><br>
                       <option value="1981" selected>1981</option><br>
                       <option value="1982" selected>1982</option><br>
                       <option value="1983" selected>1983</option><br>
                       <option value="1984" selected>1984</option><br>
                       <option value="1985" selected>1985</option><br>
                       <option value="1986" selected>1986</option><br>
                       <option value="1987" selected>1987</option><br>
                       <option value="1988" selected>1988</option><br>
                       <option value="1989" selected>1989</option><br>
                       <option value="1990" selected>1990</option><br>
                       <option value="1991" selected>1991</option><br>
                       <option value="1992" selected>1992</option><br>
                       <option value="1993" selected>1993</option><br>
                       <option value="1994" selected>1994</option><br>
                       <option value="1995" selected>1995</option><br>
                       <option value="1996" selected>1996</option><br>
                       <option value="1997" selected>1997</option><br>
                       <option value="1998" selected>1998</option><br>
                       <option value="1999" selected>1999</option><br>
                       <option value="2000" selected>2000</option><br>
                       <option value="2001" selected>2001</option><br>
                       <option value="2002" selected>2002</option><br>
                       <option value="2003" selected>2003</option><br>
                       <option value="2004" selected>2004</option><br>
                       <option value="2005" selected>2005</option><br>
                       <option value="2006" selected>2006</option><br>
                       <option value="2007" selected>2007</option><br>
                       <option value="2008" selected>2008</option><br>
                       <option value="2009" selected>2009</option><br>
                       <option value="2010" selected>2010</option><br>
                       <option value="2011" selected>2011</option><br>
                       <option value="2012" selected>2012</option><br>
                       <option value="2013" selected>2013</option><br>
                       <option value="2014" selected>2014</option><br>
                       <option value="2015" selected>2015</option><br>
                       <option value="2016" selected>2016</option><br>
           </select>
           년
           <select name="user_birth_month">
               <option value="1">1</option><br>
               <option value="2">2</option><br>
               <option value="3">3</option><br>
               <option value="4">4</option><br>
               <option value="5">5</option><br>
               <option value="6">6</option><br>
               <option value="7">7</option><br>
               <option value="8">8</option><br>
               <option value="9">9</option><br>
               <option value="10">10</option><br>
               <option value="11">11</option><br>
               <option value="12">12</option><br>
           </select>
           월
           <select name="user_birth_day"><br>
               <option value="1">1</option><br>
               <option value="2">2</option><br>
               <option value="3">3</option><br>
               <option value="4">4</option><br>
               <option value="5">5</option><br>
               <option value="6">6</option><br>
               <option value="7">7</option><br>
               <option value="8">8</option><br>
               <option value="9">9</option><br>
               <option value="10">10</option><br>
               <option value="11">11</option><br>
               <option value="12">12</option><br>
               <option value="13">13</option><br>
               <option value="14">14</option><br>
               <option value="15">15</option><br>
               <option value="16">16</option><br>
               <option value="17">17</option><br>
               <option value="18">18</option><br>
               <option value="19">19</option><br>
               <option value="20">20</option><br>
               <option value="21">21</option><br>
               <option value="22">22</option><br>
               <option value="23">23</option><br>
               <option value="24">24</option><br>
               <option value="25">25</option><br>
               <option value="26">26</option><br>
               <option value="27">27</option><br>
               <option value="28">28</option><br>
               <option value="29">29</option><br>
               <option value="30">30</option><br>
               <option value="31">31</option><br>
           </select>
           일
       </td>
   </tr>
			<tr>
				<td class="index"><h3>성별</h3></td>
				<td>
					남자:<input type="radio" name="gender" value="남"/>
					여자:<input type="radio" name="gender" value="여"/>
				</td>
			</tr>
			<tr> 
				<td class="index"><h3>email</h3></td>
				<td class="left">
					<input type="text" name="email"/>
                       <input type="button" name="mailcheak" value="인증받기"/>
				</td>
			</tr>
               <tr>
                   <td class="index"><h3>인증번호</h3></td>
                   <td class="left">
                       <input type="text" name="cheaknum"/>
                       <input type="button" name="finicheak" value="확인"/>
                   </td>
               </tr>
                 
			<tr>
				<td colspan="2">
					<input type="submit" name="join" value="회원가입"/>
					<input type="button" onclick="location.href='./'" value="홈으로"/>
				</td>
			</tr>
		</table>
	</form>  
   </div>
</body>
<script>
	function appendYear(){
		var date = new Date();
		var year = date.getFullYear();
		var selectValue = document.getElementById("year");
		var optionIndex = 0;
	
		for(var i=year-100;i<=year;i++){
				selectValue.add(new Option(i+"년",i),optionIndex++);                        
		}
	}
	
	
	function appendMonth(){
		var selectValue = document.getElementById("month"); 
		var optionIndex = 0;
	
		for(var i=1;i<=12;i++){
				selectValue.add(new Option(i+"월",i),optionIndex++);
		}
	}
	
	
	function appendDay(){
		var selectValue = document.getElementById("day");
		var optionIndex = 0;
	
		for(var i=1;i<=31;i++){
				selectValue.add(new Option(i+"일",i),optionIndex++);
		}
	} 
	
	/* $(function(){
		$('#year').numericOptions({from:2016,to:1942});
		$('#month').numericOptions({from:1,to:12,selectedInbex:5,namePadding:2});
		$('#date').numericOptions().datePulldown({year:$('#year'),month:$('#month'),valuePadding:2});
	});
	
	
	 var currDate = new Date(); // 현재 날짜 생성
 currDate=dateToYYYYMMDD(currDate);
 
 alert( currDate );
         //2016-04-25
}
 
 
//데이트 포멧 
function dateToYYYYMMDD(date){
    function pad(num) {
        num = num + '';
        return num.length < 2 ? '0' + num : num;
    }
    return date.getFullYear() + '-' + pad(date.getMonth()+1) + '-' + pad(date.getDate());
}
*/
</script>
</html>