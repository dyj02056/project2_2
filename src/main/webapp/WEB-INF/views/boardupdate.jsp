<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="resources/css/detailboard.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We"
	crossorigin="anonymous">
<title>Insert title here</title>
</head>
<body>
	<div>
		<h1 class="titleH1">게시글 수정</h1>
		<form method="post" action="updateMovieBoard${mb2.b_no }"> 
			<table class="rwd-table">
				<tr>

					<td>
						<div class="input-group mb-3">
							<span class="input-group-text" id="basic-addon1">제목 </span> 
							<input value="${mb2.b_title }"
								name="b_title"  >
						</div>
					</td>
				</tr>
				<tr>
					<td>
						<div class="input-group">
							<span class="input-group-text">게시글 내용</span>
							<textarea name="b_content" class="form-control"
								cols="20" aria-label="With textarea" style="resize: none;" >
								${mb2.b_content } </textarea>
						</div>
					</td>
				</tr>
			</table>
			<button 
			style="float: right;" type="submit" class="btn btn-secondary">수정
				완료</button>
		</form>
	</div>
	<!-- 
	<form method="post" action="updateMovieBoard${mb2.b_no }">
		<div>게시물 제목</div>
		<div>
			<input name="b_title" value="${mb2.b_title }">
		</div>
		<div>게시물 내용</div>
		<div>
			<input name="b_content" value="${mb2.b_content }">
		</div>
		<div>
			<button type="submit">수정 완료</button>
		</div>
	</form>
	 -->
	


</body>
</html>