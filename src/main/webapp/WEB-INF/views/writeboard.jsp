<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div>
		<h1 style="color: white;" align="center">게시글 작성</h1>
		<form id="signupForm" action="movieboard.reg" method="post">
			<table class="rwd-table">


				<tr>

					<td>
						<div class="input-group mb-3">
							<span class="input-group-text" id="basic-addon1">제목 </span>
							  <input name="b_title" id="b_title"
						placeholder="제목을 입력해 주세요" onfocus="this.placeholder = ''">
							</div>
							

					</td>
				</tr>

				<tr>
					<td>
						<div class="input-group">
							<span class="input-group-text">게시글 내용</span>
							<textarea name="b_content" id="b_content" class="form-control"
								aria-label="With textarea" style="resize: none;"
								placeholder="내용을 입력해 주세요" onfocus="this.placeholder = ''"></textarea>

						</div>
					</td>
				</tr>





			</table>
			<button style="float: right;" type="submit" class="btn btn-secondary">작성
				완료</button>
		</form>
	</div>
</body>
</html>