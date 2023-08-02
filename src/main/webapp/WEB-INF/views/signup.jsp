<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <title>회원가입</title>
    <link rel="stylesheet" href="resources/css/input.css">
    <style>
        .error-msg {
            color: red;
            font-size: 12px;
            margin-left: 10px;
            display: inline-block;
        }
        h1 {
            font-size: 24px;
            color: white;
        }
    </style>
    <script type="text/javascript">
        
    var existingIds = ["aaaa1234", "sw12345", "so12345"];
        function showPasswordCheckMsg() {
            var password = document.getElementById("m_pw").value;
            var passwordConfirm = document.getElementById("m_pwchk").value;
            var passwordMsg = document.getElementById("passwordMsg");
            var msg = document.getElementById("pwCheckMsg");
            
            if (password === passwordConfirm) {
                passwordMsg.innerHTML = "비밀번호가 일치합니다.";
                passwordMsg.style.color = "white";
                msg.innerHTML = "";
            } else {
                passwordMsg.innerHTML = "비밀번호가 일치하지 않습니다.";
                passwordMsg.style.color = "red";
            }
        }
        function checkId() {
            var m_id = document.getElementById("m_id").value;
            var idPattern = /^[a-z0-9].{4,14}$/;
            var idMsg = document.getElementById("idMsg");
            if (!idPattern.test(m_id)) {
                idMsg.innerHTML = "영소문자+숫자, 영소문자, 숫자 5~15자만 사용 가능합니다.";
                return false;
            } else {
            	idMsg.innerHTML = "아이디가 올바르게 작성되었습니다.";
                idMsg.style.color = "white";
            }
            if (existingIds.includes(m_id)) {
                idMsg.innerHTML = "이미 사용 중인 아이디입니다. 다른 아이디를 입력해주세요.";
                idMsg.style.color = "red";
                return false;
            } else {
            	idMsg.innerHTML = "아이디가 올바르게 작성되었습니다.";
                idMsg.style.color = "white";
            }
            return true;
        }
        function checkEmail() {
            var m_email = document.getElementById("m_email").value;
            var emailPattern = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
            var emailMsg = document.getElementById("emailMsg");
            if (!emailPattern.test(m_email)) {
                emailMsg.innerHTML = "올바른 이메일 형식이 아닙니다.";
                return false;
            } else {
            	 emailMsg.innerHTML = "이메일이 올바르게 작성되었습니다.";
                 emailMsg.style.color = "white";
            }
            return true;
        }
        function signupCheck() {
           
            return checkId() && checkEmail();
        }
    </script>
</head>
</head>
<body>
	<div class="inputcontent">
        <h1 color= "white">Sign</h1>
        <form id="signupForm" action="member.reg" onsubmit="return signupCheck();">
            <table>
                <tr>
                    <td>
                        <input name="m_id" id="m_id" pattern="^[a-z0-9].{4,14}$"
                               title="영소문자+숫자, 영소문자, 숫자 5~15자만 사용 가능합니다." placeholder="아이디" autocomplete="off" onblur="checkId();">
                        <span class="error-msg" id="idMsg"></span>
                    </td>
                </tr>
                <tr>
                    <td>
                        <input type="password" name="m_password" id="m_pw" placeholder="비밀번호" autocomplete="off" onkeyup="showPasswordCheckMsg();">
                    </td>
                </tr>
                <tr>
                    <td>
                        <input type="password" id="m_pwchk" placeholder="비밀번호 확인" autocomplete="off" onkeyup="showPasswordCheckMsg();">
                        <span class="error-msg" id="passwordMsg"></span>
                    </td>
                </tr>
                <tr>
                    <td><input name="m_name" id="m_name" placeholder="이름"></td>
                </tr>
                <tr>
                    <td>
                        <input name="m_email" id="m_email" placeholder="이메일" onblur="checkEmail();">
                        <span class="error-msg" id="emailMsg"></span>
                    </td>
                </tr>
                <tr>
                    <td><button onclick="return checkId() && checkEmail();">Sign</button></td>
                </tr>
            </table>
        </form>
    </div>
</body>
</html>