<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>
<link rel="stylesheet" href="resources/css/boarddetailLayout.css">
<script type="text/javascript" src="resources/js/jQuery.js"></script>
<script type="text/javascript">
	$(function(){
		const urlParams = new URLSearchParams(window.location.search);
		const r_no = urlParams.get('r_no');
		
		$.getJSON("board.reviewdetailJSON?r_no=" + r_no, function(data) {
			let title = $("<tr></tr>").append(
					$("<td></td>").text(data.reviewboard[0].r_title));
			$(".titlesection").append(title);

			let inf = $("<tr></tr>").append(
					$("<td></td>").text(data.reviewboard[0].r_writer),
					$("<td></td>").text(data.reviewboard[0].r_time));
			$(".informationsection").append(inf);

			let con = $("<tr></tr").append(
					$("<td></td>").text(data.reviewboard[0].r_detail));
			$(".contentsection").append(con);
		});
	});
</script>
</head>
<body>
	<p>자유 게시판</p>
	<div id="title">
		<table class="titlesection"></table>
	</div>
	<div id="information">
		<table class="informationsection"></table>
	</div>
	<div id="content">
		<table class="contentsection" border="1"></table>
		<p>
			<a href="reviewboard"><button>목록</button></a>
		</p>
	</div>
</body>
</html>