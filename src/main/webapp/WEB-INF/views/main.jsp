<%@page import="javax.servlet.jsp.tagext.TryCatchFinally"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<html>
<head>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<title>MovieProject</title>
<link rel="stylesheet" href="resources/css/layout.css">
<link rel="stylesheet" href="resources/css/headerLayout.css">
<script type="text/javascript" src="resources/js/jQuery.js"></script>
<script type="text/javascript" src="resources/js/e1.js"></script>
<script type="text/javascript" src="resources/js/ValidChecker.js"></script>
<script type="text/javascript"></script>
<style type="text/css">
body {
    background-color: #444444;
}
</style>
<style>
  
  #fixed-image {
    position: fixed;
    bottom: 20px;
    right: 20px;
    z-index: 9999;
    width: 150px;
    height: auto;
    cursor: pointer; 
  }
</style>
</head>
<body>
	<div id=smallheader>
		<jsp:include page="${topmenu }"></jsp:include>
	</div>
	<div id="header">
		<table id="headerTBL1">
			<tr>
				<td id="mainlogo"><a href="main">Homepage</a></td>
				<td><a href="Information">Manual</a></td>

				<td><a href="BoxOffice">BoxOffice</a></td>
				<td><a href="movieSearch">Movie Search</a></td>
				<td><a href="2">Movie chart</a></td>
				
				<%
				String m_id="";
				try{
					
					HttpSession hs = request.getSession();
					m_id = (String)hs.getAttribute("m_id");
					if(!m_id.equals("")){
						%>
						<td><a href="Board">FreeBoard</a></td>
						<% 
					}
					
				} catch(Exception e){
					e.printStackTrace();
				}
				
					%>
				
				
				
				


			</tr>
		</table>
	</div>
	<div id="article">
		<div id="maincontent">
			<jsp:include page="${contentPage }" />	
		</div>
	</div>
	<script>
		document.getElementById("fixed-image").addEventListener("click", function() {
			var url = "https://www.cgv.co.kr/";
			window.location.href = url;
		});
	</script>
	<a href="https://www.cgv.co.kr/" target="_blank">

	<img src="resources/img/11.png" id="fixed-image">

	
</body>
</html>
