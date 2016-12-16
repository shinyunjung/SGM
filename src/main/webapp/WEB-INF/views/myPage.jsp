<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>메인 페이지</title>
		<script src="https://code.jquery.com/jquery-3.1.0.min.js"></script>
		<script src="resources/bootstrap/js/bootstrap.js"></script>
		<link rel="stylesheet" type="text/css" href="resources/bootstrap/css/bootstrap.css" />
		<style>
			table, td{
          	 	border:2px solid;
           		text-align: center;
      
           		}
           	#myimporm{
           		position:absolute;
           		left:400px;
           		top:200px;
           	}	
           #butt{
                position:absolute;
           		left:460px;
           		top:350px;
               
           }
           #myteem{
               position:absolute;
           		left:50px;
           		top:390px;
               
           }
           #mypoint{
               position:absolute;
         		left:50px;
           		top:430px;
               
           }
           #mypoin{
           		width:150%;
           }
		
		</style>
	</head>
	<body>
		<jsp:include page="../../resources/include/logo.jsp" />
		<jsp:include page="../../resources/include/nav.jsp" />
		<!-- mypage -->
		<div id="myimporm">
        <table>
            <tr>
                <td>ID</td>
                <td class="cheak">
                </td>
            </tr>
            <tr>
                <td>성명</td>
                <td class="cheak">
                </td>    
            </tr>
            <tr>
                <td>생년월일</td>
                <td class="cheak">
                </td>
            </tr>
            <tr>
                <td>성별</td>
                <td class="cheak">
                </td>
            </tr>
            <tr>
                <td>핸드폰번호</td>
                <td class="cheak">
                </td>
            </tr>
            <tr>
                <td>Email</td>
                <td class="cheak">
                </td>
            </tr>
        </table>
    </div>    
        <br/>
        <br/>
    <div id="butt">    
        <tr>
       	<button>수정</button>
       	<button>탈퇴</button>
        </tr>
    </div>  
    <br/>
    <div id="myteem">
        <table>
            <tr>
				<td>내가 가입한 팀</td>
				<td class="myTime"><select name="myjointime"><br>
                    <option selected>?</option><br>
                    <option selected>?</option><br>
                    </select>
                </td>  
            </tr>    
        </table> 
    </div>
    <br/>
    <div id="mypoint">
        <table id="mypoin">
            <tr>
                <td>이름</td>
                <td>득점</td>
                <td>도움</td>
                <td>공격포인트</td>
                <td>슈팅</td>
                <td>파울</td>
                <td>경고</td>
                <td>퇴장</td>
                <td>코너킥</td>
                <td>패널티킬</td>
                <td>오프사이드</td>
                <td>유효슈팅</td>
            </tr>
            <tr>
                <td class="point">point</td>
                <td class="point">point</td>
                <td class="point">point</td>
                <td class="point">point</td>
                <td class="point">point</td>
                <td class="point">point</td>
                <td class="point">point</td>
                <td class="point">point</td>
                <td class="point">point</td>
                <td class="point">point</td>
                <td class="point">point</td>
                <td class="point">point</td>
            </tr>
        </table>
    </div>
	</body>
	<script></script>
</html>