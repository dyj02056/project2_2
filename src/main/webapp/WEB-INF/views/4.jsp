<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>
<link rel="stylesheet" href="resources/css/boardLayout.css">
<script type="text/javascript" src="resources/js/jQuery.js"></script>
<script type="text/javascript" src="resources/js/e1.js"></script>
<script type="text/javascript">
</script>
</head>
<body>
	<h1 class="titleH1">추천게시판</h1>
	<table id="reviewTBL" class="boardTBL" border="1">
		<tr>
			<th class="tblTh">제목(차 종 입력)</th>
			<th class="tblTh">작성자</th>
			<th class="tblTh">작성시간</th>
		</tr>
	</table>
	<table id="paging" class="searchpaging" border="1">
		<tr>
			<c:forEach var="i" begin="1" end="${pageNum }" step="1">
				<td><a href="freeboard?page=${i }">${i }</a></td>
			</c:forEach>
		</tr>
	</table>
	<button id="writeBtn" onclick="ReviewboardLoginCheck();">글쓰기</button>
</body>
</html>