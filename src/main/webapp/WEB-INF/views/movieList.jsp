<%@page import="com.movie.MovieApiUtil2"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Chart</title>
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
	<h1 style="color: white; font-weight:700;" align="center">Box Office Movies</h1>

	<div class="container">
		<%
			try {
				SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
				Calendar c1 = Calendar.getInstance();
				c1.add(Calendar.DATE, -1);
				String strYesterday = sdf.format(c1.getTime());

				String key = "60a669096e82e1db6ebca9e5089fcf66";

				String address = "http://www.kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json";
				address += "?key=" + key;
				address += "&targetDt=" + strYesterday;

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
				br.close();

				String result = sb.toString();

				JSONParser jp = new JSONParser();
				JSONObject jo = (JSONObject) jp.parse(result);
				JSONObject bor = (JSONObject) jo.get("boxOfficeResult");
				JSONArray dbol = (JSONArray) bor.get("dailyBoxOfficeList");
				int count = 0; // 이미지 카운트 변수 추가
				HttpSession hs = request.getSession();
				for (int i = 0; i < dbol.size(); i++) {
					JSONObject obj = (JSONObject) dbol.get(i);
					String title = (String) obj.get("movieNm");
					
					String rank = (String) obj.get("rank");
					String salesShare = (String) obj.get("salesShare");
					String releaseDate = (String) obj.get("openDt");

					String imageUrl = MovieApiUtil2.getImageUrlFromTitle(title);
					if (imageUrl == null) {

						imageUrl = "https://img.freepik.com/premium-photo/cinema-clap-film-roll-blue-studio-background_241146-2364.jpg";
					}

					String trailerLink = MovieApiUtil.getTrailerLinkFromTitle(title);

					if (count < 5) {
		%>
		<div class="movie-card top-movie-card">
			<%
				} else {
			%>
			<div class="movie-card bottom-movie-card">
				<%
					}
							count++;
				%>

				<a href="<%=trailerLink%>" target="_blank"> <img
					src="<%=imageUrl%>" alt="<%=title%>" width="200" height="300">
				</a>
				<h2><%=title%></h2>
				<div class="movie-info">
					<p class="movie-rank">
						순위:
						<%=rank%></p>
					<p class="movie-sales-share">
						매출 점유율:
						<%=salesShare%>
						%
					</p>
					<p class="movie-release-date">
						개봉일:
						<%=releaseDate%></p>
				</div>

				<%
					
					String m_id = "";
							
							try {

								m_id = (String) hs.getAttribute("m_id");
								if (!m_id.equals("")) {
				%>
				<form action="mymovie.reg">
					<button style="padding: 5px;" style="float: right;" type="submit"
						class="btn btn-success">등록</button>
						<% hs.setAttribute("mm_name",title); %>

				</form>
				<%
					}

							} catch (Exception e) {
								e.printStackTrace();
							}
				%>

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
