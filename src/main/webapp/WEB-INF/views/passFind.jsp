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
		div.idFind{
			position:absolute;
			left:450px;
			top:300px;
		}
		table, td{
           border:2px solid;
           text-align: center;
           border-color:orange; 
        }
        tr{
        	text-align:center;
        }
		</style>
	</head>
	<body>
		<jsp:include page="../../resources/include/logo.jsp" />
		<jsp:include page="../../resources/include/nav.jsp" />
		<!-- ID찾기 -->
		<div class="idFind">
        <table>
            <tr id="idf"><h3>비밀번호찾기</h3></tr>
            <tr>
                <td><h3>ID</h3></td>
                <td id="nametext">
                    <input type="text"/>
                </td>
            </tr>
            <tr>
                <td><h3>Email</h3></td>
                <td>
                    <input type="text" id="emailtext"/>
                    <input type="button" value="인증번호 발송"/>
                </td>    
            </tr>
            <tr>
                <td><h3>인증번호</h3></td>
                <td>
                    <input type="text" id="cheaktext"/>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <input type="button" value="확인"/>
                </td>
            </tr>
        </table>
    </div>
	</body>
	<script></script>
</html>