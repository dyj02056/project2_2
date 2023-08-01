$(document).ready(function() {
	// 페이지 불러왔을 때 기능 추가
});

function signupCheck() { // 회원가입 유효성 검사
	if (isEmpty($("#m_id"))) {
		alert('아이디를 입력하세요');
		$("#m_id").focus();
		return false;
	} else if (isEmpty($("#m_pw"))) {
		alert('비밀번호를 입력하세요');
		$("#m_pw").focus();
		return false;
	} else if ($("#m_pw").val() != $("#m_pwchk").val()) {
		alert('확인 비밀번호가 일치하지 않습니다');
		$("#m_pwchk").val("");
		$("#m_pwchk").focus();
		return false;
	} else if (isEmpty($("#m_name"))) {
		alert('이름을 입력하세요');
		$("#m_name").focus();
		return false;
	} else {
		return true;
	}

}

function loginCheck() { // 로그인 유효성 검사
	if (isEmpty($("#loginID"))) {
		alert('아이디를 입력하세요');
		$('#loginID').focus();
		return false;
	} else if (isEmpty($("#loginPW"))) {
		alert('비밀번호를 입력하세요');
		$('#loginPW').focus();
		return false;
	} else {
		return true;
	}
}

function FreeboardLoginCheck() { // 자유게시판 글쓰기 로그인 체크
	let id = $("#loginuserID").text();
	if (id == '로그인하세요') {
		alert('로그인하시기 바랍니다.');
	} else {
		location.href = "Freeboardwrite";
	}
}


function boardWriteCheck() { // 자유 게시판 유효성 검사
	if (isEmpty($("#f_title"))) {
		alert('제목을 입력하세요');
		$("#f_title").focus();
		return false;
	} else if (isEmpty($("#f_detail"))) {
		alert('내용을 입력하세요');
		$("#f_detail").focus();
		return false;
	} else {
		return true;
	}

	}