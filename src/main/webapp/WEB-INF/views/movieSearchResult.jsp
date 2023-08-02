<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.net.URLEncoder"%>
<%@ page import="java.io.BufferedReader"%>
<%@ page import="java.io.InputStreamReader"%>
<%@ page import="java.net.HttpURLConnection"%>
<%@ page import="org.json.simple.JSONArray"%>
<%@ page import="org.json.simple.JSONObject"%>
<%@ page import="org.json.simple.parser.JSONParser"%>
<%@ page import="java.io.InputStream"%>
<%@ page import="java.net.URL"%>
<%@ page import="java.util.Calendar"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="com.movie.MovieApiUtil"%>
<%@ page import="com.movie.MovieApiUtil2"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Movie Search Result</title>
<link rel="stylesheet" href="resources/css/movie.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We"
	crossorigin="anonymous">
<script type="text/javascript" src="resources/js/jQuery.js"></script>
<script type="text/javascript" src="resources/js/e1.js"></script>
<script type="text/javascript"></script>

</head>
<body>


	<div class="container">
		<%
			try {
				String movie_search = request.getParameter("movie_search");

				String key = "60a669096e82e1db6ebca9e5089fcf66";
				String title = URLEncoder.encode(movie_search);
				String address = "http://www.kobis.or.kr/kobisopenapi/webservice/rest/movie/searchMovieList.json";
				address += "?key=" + key;
				address += "&movieNm=" + title;

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

				JSONParser jp = new JSONParser();
				JSONObject jo = (JSONObject) jp.parse(result);

				JSONObject bor = (JSONObject) jo.get("movieListResult");
				JSONArray dbol = (JSONArray) bor.get("movieList");

				for (int i = 0; i < dbol.size(); i++) {
					JSONObject obj = (JSONObject) dbol.get(i);
					String movieNm = (String) obj.get("movieNm");
					String openDt = (String) obj.get("openDt");
					String genreAlt = (String) obj.get("genreAlt");


					String imageUrl = MovieApiUtil.getImageUrlFromTitle(movieNm);
					if (imageUrl == null) {
						imageUrl = "https://img.freepik.com/premium-photo/cinema-clap-film-roll-blue-studio-background_241146-2364.jpg";
					}

					String trailerLink = MovieApiUtil.getTrailerLinkFromTitle(movieNm);
		%>
		<div class="movie-card top-movie-card">
			<a href="<%=trailerLink%>" target="_blank"> <img
				src="<%=imageUrl%>" alt="<%=title%>" width="200" height="300">
			</a>
			<h2 style="padding: 4px;">
				<%=movieNm%></h2>
			<div class="movie-info">
				<p class="movie-release-date">
					개봉일:<%=openDt%></p>
				<p class="movie-release-date">
					장르:<%=genreAlt%></p>
			</div>
		</div>
		<%
			}
			} catch (Exception e) {
				e.printStackTrace();
			}
		%>
	</div>
</body>
</html>
