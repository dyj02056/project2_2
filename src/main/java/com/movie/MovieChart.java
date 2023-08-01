package com.movie;

public class MovieChart {
    private String movieNm;
    private int salesAmount;
    private String date;

    // Getters and Setters

    // 생성자
    public MovieChart(String movieNm, int salesAmount, String date) {
        this.movieNm = movieNm;
        this.salesAmount = salesAmount;
        this.date = date;
    }
}
