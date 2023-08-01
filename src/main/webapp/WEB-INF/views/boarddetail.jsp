<%@page import="com.movie.board.MovieBoard"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="resources/css/detailboard.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We"
	crossorigin="anonymous">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="inputcontent">
		<h1 style="color: white;" align="center">게시글 정보</h1>

		<table class="rwd-table">
			<tr>
				<td style="color: white;">제목</td>
				<td style="color: white;">${mb3.b_title}</td>

			</tr>
			<tr>
				<td style="color: white;">작성자</td>
				<td style="color: white;">${mb3.b_writter}</td>

			</tr>
			<tr>
				<td style="color: white;">작성 시간</td>
				<td style="color: white;">${mb3.b_when}</td>

			</tr>
			<tr>
				<td style="color: white;">내용</td>
				<td style="color: white;">${mb3.b_content}</td>

			</tr>
		</table>
	</div>
	<p>
	<form id="signupForm" action="reply.write${mb3.b_no}" method="post">
		<table class="rwd-table">
			<tr>
				<td><input type="hidden" name="b_no" value="${mb3.b_no}"></td>
				<td><input type="hidden" name="r_writter" value="${m_id}"></td>

				<td>
					<div class="input-group mb-3">
						<span class="input-group-text" id="basic-addon1">${m_id } </span>
						<input name="r_content" id="r_content" placeholder="댓글 내용"
							onfocus="this.placeholder = ''">
					</div>
				</td>
				<td>

					<button style="padding: 5px;" style="float: right;" type="submit"
						class="btn btn-light">등록</button>
				</td>
			</tr>
		</table>
	</form>

	<table class="rwd-table">
		<c:forEach var="r" items="${rs }">
			<tr>
				<td>
					<h6 style="color: white;">${r.r_writter }
						: ${r.r_content } <a href="delete_reply${r.r_no}">삭제</a>
					</h6>



				</td>


			</tr>
		</c:forEach>
	</table>



	<p>
		<%
			String m_id = (String) session.getAttribute("m_id");
			String b_writter = (String) session.getAttribute("mb3writter");

			if (m_id.equals(b_writter) || m_id.equals("dyj02056")) {
		%>
	
	<form action="updatego${mb3.b_no }">
		<button style="float: right;" type="submit" class="btn btn-secondary">
			수정</button>
	</form>
	&nbsp;
	<form action="movieboard_delete${mb3.b_no}">
		<button style="float: right;" type="submit" class="btn btn-secondary">
			삭제</button>
	</form>
	&nbsp;
	<form action="Board">
		<button style="float: right;" type="submit" class="btn btn-secondary">
			목록</button>
	</form>
	<%
		} else {
	%>
	<form action="Board">
		<button>목록</button>
	</form>
	<%
		}
	%>



</body>
</html>