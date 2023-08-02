<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보</title>
 <link rel="stylesheet" href="resources/css/information.css">
</head>
<body>
    <h1 class="titleH1" style="color: white; font-weight: 700;"
        align="center">MemberInfo</h1>
    <table class="menuTBL">


    </table>

    <table class="boardTBL">
        <tr>
            <td>아이디 : ${member.m_id}</td>
        </tr>
    </table>




    <table class="boardTBL">
        <tr>
            <td>비밀번호 : ${member.m_password}</td>
        </tr>
    </table>

    <table class="boardTBL">
        <tr>
            <td>이름 : ${member.m_name}</td>
        </tr>
    </table>

    <table class="boardTBL">
        <tr>
            <td>이메일 : ${member.m_email}</td>
        </tr>
    </table>



</body>
</html>