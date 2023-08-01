<%@page import="java.util.ArrayList"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.io.InputStreamReader"%>
<%@page import="java.net.HttpURLConnection"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.parser.JSONParser"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.net.URL"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Chart</title>

<link rel="stylesheet" href="resources/css/boardLayout.css">
<script type="text/javascript" src="resources/js/jQuery.js"></script>
<script type="text/javascript" src="resources/js/e1.js"></script>
<script type="text/javascript"></script>
</head>
<body>
	<h1 class="titleH1">영화 조회</h1>
	<table id="transferTBL" class="boardTBL" border="1">
		<%
			try {

				String key = "60a669096e82e1db6ebca9e5089fcf66";

				String address = "http://www.kobis.or.kr/kobisopenapi/webservice/rest/movie/searchMovieList.json";
				address += "?key=" + key;
				address += "&itemPerPage=" + Integer.toString(100);

				// BeaverHttpClient 
				URL u = new URL(address);
				HttpURLConnection huc = (HttpURLConnection) u.openConnection();

				InputStream is = huc.getInputStream();

				InputStreamReader isr = new InputStreamReader(is, "UTF-8");
				BufferedReader br = new BufferedReader(isr);

				String line = null;
				StringBuffer sb = new StringBuffer();
				while ((line = br.readLine()) != null) {
					sb.append(line);
				}

				String result = sb.toString();
				// System.out.println(result);
				JSONParser jp = new JSONParser();
				JSONObject jo = (JSONObject) jp.parse(result);

				JSONObject bor = (JSONObject) jo.get("movieListResult");
				JSONArray dbol = (JSONArray) bor.get("movieList");

				for (int i = 0; i < dbol.size(); i++) {
					JSONObject obj = (JSONObject) dbol.get(i);
					String movieNm = (String) obj.get("movieNm");
					String repGenre = (String) obj.get("repGenreNm");

					
		%>

		
			<%=movieNm%><p>
		

		<%
			

				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		%>



	</table>

</body>
</html>