<%@page import="org.springframework.beans.factory.annotation.Autowired"%>
<%@page import="com.movie.member.MemberDAO"%>
<%@page import="com.movie.member.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="resources/css/input.css">
<title>Insert title here</title>
</head>
<body>
<div class="inputcontent">
		<h1 style="color:white;">이메일 발송</h1>
		<form action="send.do" id="loginForm" method="get">
			<table>
				<tr>
					<td><input name="m_id"  placeholder="아이디"></td>
				</tr>
				<tr>
					<td><input name="receiveMail" 
						autocomplete="off" placeholder="이메일 "></td>
				</tr>
				<%
				
				
				String m2_id = (String)request.getAttribute("m2_id");
				String m2_password = (String)request.getAttribute("m2_password");
				String m2_name = (String)request.getAttribute("m2_name");
				String m2_email = (String)request.getAttribute("m2_email");
				System.out.println(m2_id);
				System.out.println(m2_password);
				System.out.println(m2_name);
				System.out.println(m2_email);
			%>
			
				<input type="hidden" name=senderMail value="swj8696@gmail.com" />
				<input type="hidden" name=subject value="Moviepedia info find result" />
				
				<tr>
					<td><button type="submit">이메일 발송</button></td>
				</tr>
				
			</table>
		</form>

		
	</div>
</body>
</html>