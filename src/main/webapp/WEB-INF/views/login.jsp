<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>에브리보드</title>
<link rel="stylesheet" href="resources/css/input.css">
<style>
        h1 {
            font-size: 24px;
            color: white;
        }
    </style>
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
		<p>
			<a href="emailconfirm"><button>아이디 비밀번호 찾기</button></a>
		</p>
	</div>

</body>
</html>