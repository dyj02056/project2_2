<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE
html>
<html>
<head>
<link rel="stylesheet" href="resources/css/board.css">
<link rel="stylesheet" href="resources/css/information.css">
 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">
<meta charset="UTF-8">
<title>Board</title>
</head>
<body>

<h1 class="titleH1" style="color: white;" align="center"> Board</h1>

	<div>

		
		<p>
		<table class="rwd-table">
		<tbody>
		<tr>

				<td>
					<h2 >번호</h2>
				</td>
				<td>

					<h2 style="color: white;"> 제목</h2>
				<td>
					<h2 style="color: white;">작성자</h2>
				</td>
				<td>
					<h2 style="color: white;">날짜</h2>
				</td>

			</tr>
		
			

			
				<c:forEach var="mb" items="${mbs }">
					<tr>
						<td>
							<h3 style="color: white;">${mb.b_no }</h3>
						</td>
						<td><a href="detailMovieBoard${mb.b_no }" 
								style="text-decoration-line: none;">
								<h3 style="color: white;">${mb.b_title }</h3>
						</a></td>
						
						<td>
							<h3 style="color: white;">${mb.b_writter }</h3>
						</td>
						<td>
							<h3 style="color: white;">${mb.b_when }</h3>
						</td>

					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>




	<form action="writeBoard">
	<button style="float: right;" type="submit" class="btn btn-secondary">게시글 작성하기</button>
		
	</form>
</body>
</html>