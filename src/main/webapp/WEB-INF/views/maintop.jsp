<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>

</head>
<body>
	 <table id="SmallheaderTBL1">
        <tr>
            <td id="loginuserID">${empty m_id ? '   ' : m_id}</td>
            <c:if test="${empty m_id}">
                <td><a href="login"><button id="login" class="maintopbutton">Login</button></a></td>
                <td><a href="signup"><button id="signup" class="maintopbutton">Sign</button></a></td>
            </c:if>
            <c:if test="${not empty m_id}">
                <td>님 환영합니다</td>
                
                <td><a href="profile"><button id="profile" class="maintopbutton">Mypage</button></a></td>   
                
                <td><a href="member.logout"><button id="logout" class="maintopbutton">Logout</button></a></td>

            </c:if>
        </tr>
    </table>
</body>
</html>