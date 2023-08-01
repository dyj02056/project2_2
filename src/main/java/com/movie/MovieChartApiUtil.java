package com.movie;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.stereotype.Component;

@Component
public class MovieChartApiUtil {
    private static final String KOBIS_API_KEY = "60a669096e82e1db6ebca9e5089fcf66";

    public List<MovieChart> getMovieList() {
        List<MovieChart> movies = new ArrayList<MovieChart>();

        try {
            String address = "http://www.kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json";
            address += "?key=" + KOBIS_API_KEY;
            address += "&targetDt=20230719"; // 원하는 날짜로 변경 가능

            URL url = new URL(address);
            HttpURLConnection connection = (HttpURLConnection) url.openConnection();
            connection.setRequestMethod("GET");

            BufferedReader reader = new BufferedReader(new InputStreamReader(connection.getInputStream()));
            StringBuilder sb = new StringBuilder();
            String line;
            while ((line = reader.readLine()) != null) {
                sb.append(line);
            }
            reader.close();

            JSONParser parser = new JSONParser();
            JSONObject jsonObject = (JSONObject) parser.parse(sb.toString());
            JSONObject boxOfficeResult = (JSONObject) jsonObject.get("boxOfficeResult");
            JSONArray dailyBoxOfficeList = (JSONArray) boxOfficeResult.get("dailyBoxOfficeList");

            for (Object obj : dailyBoxOfficeList) {
                JSONObject movieInfo = (JSONObject) obj;
                String movieNm = (String) movieInfo.get("movieNm");
                int salesAmount = Integer.parseInt((String) movieInfo.get("salesAmt"));
                String date = (String) movieInfo.get("targetDt");

                MovieChart movie = new MovieChart(movieNm, salesAmount, date);
                movies.add(movie);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return movies;
    }
}