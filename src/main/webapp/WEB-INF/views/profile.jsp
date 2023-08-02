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
	<!-- 
	<table>
		<c:forEach var="mm" items="${mml }">
					<tr>
						<td>
							<h3 style="color: white;">${mm.mm_name }</h3>
						</td>
						

					</tr>
				</c:forEach>
	</table>
	 -->
	



</body>
</html>