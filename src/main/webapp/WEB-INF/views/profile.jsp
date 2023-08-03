<%@page import="com.movie.MovieApiUtil"%>
<%@page import="com.movie.MovieApiUtil2"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.parser.JSONParser"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.io.InputStreamReader"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.net.HttpURLConnection"%>
<%@page import="java.net.URL"%>
<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보</title>
<link rel="stylesheet" href="resources/css/movie.css">
<link rel="stylesheet" href="resources/css/information.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We"
	crossorigin="anonymous">
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
	<table>
		<c:forEach var="mm" items="${mml }">
			<c:set var="mm_name" value="${mm.mm_name}" />
			<c:set var="mml" value="${mml} " />
			<%
				String mm_name = (String) pageContext.getAttribute("mm_name");
					String imageUrl = MovieApiUtil2.getImageUrlFromTitle(mm_name);

					
					if (imageUrl == null) {
						imageUrl = "https://img.freepik.com/premium-photo/cinema-clap-film-roll-blue-studio-background_241146-2364.jpg";
					}else if (mm_name.equals("더 문")){
						imageUrl="resources/img/themoon.jpg";
					}else if (mm_name.equals("기생충")){
						imageUrl="resources/img/parasite1.webp";
					}

					String trailerLink = MovieApiUtil2.getTrailerLinkFromTitle(mm_name);
			%>
			<div class="movie-card top-movie-card"
				style="float: right; margin: 10px;">
				<a href="<%=trailerLink%>" target="_blank"> <img
					src="<%=imageUrl%>" alt="<%=mm_name%>" width="200" height="300">
				</a>
				<h2 style="padding: 4px;">
					<%=mm_name%></h2>
<!-- 
<form action="mymovie_delete">
					<input type="hidden" name="mm_name" value="${mm.mm_name} " />
					<button type="submit" class="btn btn-danger">삭제</button>
				</form>
 -->
				



			</div>
		</c:forEach>
	</table>


</body>
</html>