<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
		<form  method="post" action="updateMovieBoard${mb2.b_no }">
			<div>게시물 제목</div>
			<div><input name="b_title" value="${mb2.b_title }" ></div>
			<div>게시물 내용</div>
			<div><input name="b_content" value="${mb2.b_content }"></div>
			<div>
				<button type="submit">수정 완료</button>
			</div>
		</form>
		
	
</body>
</html>