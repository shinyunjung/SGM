<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Insert title here</title>
		<script src="https://code.jquery.com/jquery-3.1.0.min.js"></script>
		<script src="resources/bootstrap/js/bootstrap.js"></script>
		<link rel="stylesheet" type="text/css" href="resources/bootstrap/css/bootstrap.css" />
        <style>
        	table, td{
        		border:1px solid;
        		text-align:center;
        	}
            #div1{
                position: absolute;
                left:270px;
                top:200px;
                width: 305px;
                height: 185px;
            }
            #div2{
                position: absolute;
                left:480px;
                top:200px;
                width: 605px;
                height: 605px;
            }
            #embulls{
                width:200px;
                height:345px;
            }
            
            input[type='text']{
				width:95%;
				height:100%;
			}
			h3{
				font-size:20px;
			}	
        </style>
    </head>
    <body>
   		<jsp:include page="../../resources/include/logo.jsp" />
		<jsp:include page="../../resources/include/nav.jsp" />
        <div id="div1">
        <table id="embulls">
            <tr>
                <td>
                	엠블럼등록
                </td>
            </tr>
            <tr height="20px">
                <td>
                    <button>앰블럼등록</button>
                </td>
            </tr>
        </table>
        </div>
        <div id="div2">
        <table>
            <tr>
                <td colspan="2"><h3>팀생성</h3></td>
            </tr>
            <tr>
                <td><h3>팀명</h3></td>
                <td>
                    <input type="text"/>
                </td>    
            </tr>
            <tr>
                <td><h3>지역</h3></td>
                <td>
                    <input type="text"/>
                </td>
            </tr>
            <tr>
                <td><h3>주 요일</h3></td>
                <td>
					월:<input type="radio" name="week" value="월"/>
					화:<input type="radio" name="week" value="화"/>
					수:<input type="radio" name="week" value="수"/>
					목:<input type="radio" name="week" value="목"/>
					금:<input type="radio" name="week" value="금"/>
					토:<input type="radio" name="week" value="토"/>
					일:<input type="radio" name="week" value="일"/>
                </td>
            </tr>
            <tr>
                <td><h3>시간</h3></td>
                <td>
                    <input type="text"/>
                </td>
            </tr>
            <tr>
                <td><h3>연령대</h3></td>
                <td>
                    <input type="text"/>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <input type="button" value="팀만들기"/>
                    <input type="button" value="취소"/>
                </td>
            </tr>
        </table>
        </div>
    </body>
</html>