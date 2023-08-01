<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/input.css">
</head>
<body>
	<div class="inputcontent">
	
	
		<h1>로그인</h1>
		<form action="member.login" id="loginForm" method="post"
			onsubmit="return loginCheck();">
			<table>
				<tr>
					<td><input name="m_id" id="loginID" placeholder="아이디"></td>
				</tr>
				<tr>
					<td><input name="m_password" type="password" id="loginPW"
						autocomplete="off" placeholder="비밀번호"></td>
				</tr>
				<tr>
					<td><button>로그인</button></td>
				</tr>
			</table>
		</form>
		<p>
			<a href="signup"><button>회원가입</button></a>
		</p>
	</div>
	<div class="loginfail">
		<h1>로그인에 실패했습니다</h1>
		<h1>아이디 및 비밀번호를 확인하세요</h1>
	</div>
</body>
</html>