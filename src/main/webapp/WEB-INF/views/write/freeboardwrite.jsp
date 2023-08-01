<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/boarddetailLayout.css">
<script type="text/javascript">
	document.addEventListener('keydown', function(event) {
		if (event.keyCode === 13) {
			event.preventDefault();
		}
		;
	}, true);
</script>
</head>
<body>
	<p class="headerP">자유게시판</p>
	<form action="board.writeFreeboard" id="freeboardwriteForm"
		onsubmit="return boardWriteCheck();">
		<div id="title">
			<table class="titlesection">
				<tr>
					<td><input class="writeinput" autocomplete="off" id="f_title"
						placeholder="제목을 입력하세요" name="f_title"></td>
				</tr>
			</table>
		</div>
		<div id="information">
			<table class="informationsection">
				<tr>
					<td><input name="f_writer" value="${m_id }"></td>
				</tr>
			</table>
		</div>
		<div id="content">
			<table class="contentsection" border="1">
				<tr>
						<td><textarea class="writeinput"
						autocomplete="off" id="f_detail" placeholder="내용을 입력하세요"
						name="f_detail"></textarea></td>
				</tr>
			</table>
			<p>
				<button>글쓰기</button>
			</p>
		</div>
	</form>
</body>
</html>