package com.movie;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

public class MovieApiUtil2 {
	private static final String KAKAO_REST_API_KEY = "033fd4a2461bc83c71bebe7099063afa";
	private static final String KMDB_KEY = "7P7UOVW222627403S96C"; // 발급받은 클라이언트 ID로 변경
	private static final String DEFAULT_IMAGE_URL = "https://img.freepik.com/premium-photo/cinema-clap-film-roll-blue-studio-background_241146-2364.jpg";

	private static String searchDaumImage(String movieTitle) {
		
		try {
			String encodedTitle = java.net.URLEncoder.encode(movieTitle, "UTF-8");
			String apiUrl = "http://api.koreafilm.or.kr/openapi-data2/wisenut"
					+ "/search_api/search_json2.jsp?collection=kmdb_new2";
			apiUrl += "&ServiceKey=" + KMDB_KEY;
			apiUrl += "&detail=Y";
			apiUrl += "&title=" + encodedTitle;

			URL url = new URL(apiUrl);
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("GET");
			// conn.setRequestProperty("Authorization", "KakaoAK " + KAKAO_REST_API_KEY);

			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			StringBuilder sb = new StringBuilder();
			String line;
			while ((line = br.readLine()) != null) {
				sb.append(line);
			}
			br.close();
			// Data[] > Result[] > posters
			JSONParser jp = new JSONParser();
            JSONObject jsonObject = (JSONObject) jp.parse(sb.toString());
            JSONArray documents = (JSONArray) jsonObject.get("Data");
            String imgURL1;
            String[] imgURLs;
            ArrayList<String> imgURLs2 = new ArrayList<>();
            for (int i =0; i<documents.size(); i++) {
            	JSONObject array1 = (JSONObject) documents.get(i);
            	JSONArray result1 = (JSONArray) array1.get("Result");
            	for (int j=0; j<result1.size(); j++) {
            		JSONObject array2 = (JSONObject) result1.get(j);
            		String imgURL = array2.get("posters").toString();
            		
            		//System.out.println(imgURL);
            		imgURLs = imgURL.split("\\|");
            		for (String imgurl : imgURLs) {
            			imgURLs2.add(imgurl);
            		}
            	}
            	
            }
          return (imgURLs2.get(imgURLs2.size()-1));
		} catch (Exception e) {
			e.printStackTrace();
			return DEFAULT_IMAGE_URL;
		}
		
		
		
	}

	public static String getImageUrlFromTitle(String movieTitle) {

		String imageUrl = searchDaumImage(movieTitle);
		if (imageUrl == null || imageUrl.equals(DEFAULT_IMAGE_URL)) {

			imageUrl = DEFAULT_IMAGE_URL;
		}
		return imageUrl;
	}

	public static String getTrailerLinkFromTitle(String movieTitle) {
		try {
			String encodedTitle = java.net.URLEncoder.encode(movieTitle + " 예고편", "UTF-8");
			String apiUrl = "https://dapi.kakao.com/v2/search/vclip?query=" + encodedTitle;

			URL url = new URL(apiUrl);
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("GET");
			conn.setRequestProperty("Authorization", "KakaoAK " + KAKAO_REST_API_KEY);

			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			StringBuilder sb = new StringBuilder();
			String line;
			while ((line = br.readLine()) != null) {
				sb.append(line);
			}
			br.close();
			// Data > Result
			JSONParser jp = new JSONParser();
			JSONObject jsonObject = (JSONObject) jp.parse(sb.toString());
			JSONArray documents = (JSONArray) jsonObject.get("documents");
			if (documents.size() > 0) {
				JSONObject vclipInfo = (JSONObject) documents.get(0);
				String trailerLink = (String) vclipInfo.get("url");
				if (trailerLink != null) {
					return trailerLink;
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	public static String getDefaultImageUrl() {
		return DEFAULT_IMAGE_URL;
	}
}
