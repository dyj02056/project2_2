package com.movie;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

public class MovieApiUtil {
    private static final String KAKAO_REST_API_KEY = "033fd4a2461bc83c71bebe7099063afa"; // 발급받은 클라이언트 ID로 변경
    private static final String DEFAULT_IMAGE_URL = "https://img.freepik.com/premium-photo/cinema-clap-film-roll-blue-studio-background_241146-2364.jpg";

    private static String searchDaumImage(String movieTitle) {
        try {
            String encodedTitle = java.net.URLEncoder.encode(movieTitle, "UTF-8");
            String apiUrl = "https://dapi.kakao.com/v2/search/image?query=" + encodedTitle;

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

            JSONParser jp = new JSONParser();
            JSONObject jsonObject = (JSONObject) jp.parse(sb.toString());
            JSONArray documents = (JSONArray) jsonObject.get("documents");
            if (documents.size() > 0) {
                JSONObject imageInfo = (JSONObject) documents.get(0);
                String imageUrl = (String) imageInfo.get("image_url");
                if (imageUrl != null) {
                    return imageUrl;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return DEFAULT_IMAGE_URL;
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
