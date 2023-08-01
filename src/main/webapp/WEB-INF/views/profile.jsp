<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>회원정보</title>
    <link rel="stylesheet" href="resources/css/information.css">
</head>
<body>
    <table class="menuTBL">
    <tr>
      <td align="center" style="font-size: 32px;">회원정보</td>
    </tr>
      </table>

        <table class="boardTBL">
        <tr>
            <td>아이디:</td>
            <td>${member.m_id}</td>
        </tr>
        </table>
		



            <table class="boardTBL">
        <tr>
            <td>비밀번호:</td>
            <td>${member.m_password}</td>
        </tr>
        </table>

        <table class="boardTBL">
        <tr>
            <td>이름:</td>
            <td>${member.m_name}</td>
        </tr>
        </table>

        <table class="boardTBL">
        <tr>
            <td>이메일:</td>
            <td>${member.m_email}</td>
        </tr>
        </table>


    </table>
</body>
</html>