<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>주간 관객수 그래프</title>
    <link rel="stylesheet" href="resources/css/moviechart.css">
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
</head>
<body>

	<h1 class="titleH1">Movies Weekly Chart</h1>
    
      <div class="container">
        <div id="movieChart" class="chart-container"></div>
    </div>

    <script>var movieData = [];
    function callApi(callback) {
        var xhr = new XMLHttpRequest();
        var url = "http://www.kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchWeeklyBoxOfficeList.json";
        var key = "60a669096e82e1db6ebca9e5089fcf66";
        var currentDate = new Date();
        var targetDate = new Date(currentDate.getTime() - 7 * 24 * 60 * 60 * 1000);
        var year = targetDate.getFullYear();
        var month = targetDate.getMonth() + 1;
        var day = targetDate.getDate();
        var targetDt = year + ("0" + month).slice(-2) + ("0" + day).slice(-2);
        url += "?key=" + key;
        url += "&targetDt=" + targetDt;
        url += "&weekGb=0";
        xhr.onreadystatechange = function() {
            if (xhr.readyState === 4 && xhr.status === 200) {
                var response = JSON.parse(xhr.responseText);
                var boxOfficeResult = response.boxOfficeResult;
                var weeklyBoxOfficeList = boxOfficeResult.weeklyBoxOfficeList;
                for (var i = 0; i < weeklyBoxOfficeList.length; i++) {
                    var movie = weeklyBoxOfficeList[i];
                    var movieTitle = movie.movieNm;
                    var weeklyAudience = parseInt(movie.audiAcc);
                    movieData.push([movieTitle, weeklyAudience]);
                }
                callback();
            }
        };
        xhr.open("GET", url, true);
        xhr.send();
    }
    google.charts.load('current', {'packages': ['bar']});
    google.charts.setOnLoadCallback(function() {
        callApi(function() {
            drawChart();
        });
    });

    function drawChart() {
        var data = new google.visualization.DataTable();
        data.addColumn('string', '영화 제목'); 
        data.addColumn('number', '누적 관객수 ');
        data.addRows(movieData);

        var options = {
                chart: {
                    title: '',
                    subtitle: ''
                },
                bars: 'vertical',
                is3D: true,
                vAxis: {
                    title: '',
                    minValue: 0,
                    textStyle: { color: 'red', fontSize: 12, bold: true }
                },
                hAxis: {
                    title: '영화 제목',
                    textStyle: { color: 'green', fontSize: 12, bold: true }
                },
                height: 700,
                fontSize: 20,
                legend: 'none',
                vAxis: { textStyle: { color: 'blue', fontSize: 14 } },
                hAxis: { textStyle: { color: 'black', bold: true, fontSize: 14 }, gridlines: { count: 0 } },
                chartArea: { left: 50, top: 30, width: '70%', height: '70%', backgroundColor: 'gray' },
                colors: ['yellow'],
                tooltip: { textStyle: { color: 'black', fontSize: 12, bold: true }, showColorCode: true }
            };

        var view = new google.visualization.DataView(data);
        view.setColumns([{
            type: 'string',
            label: '영화 제목',
            calc: function (dt, row) {
                var title = dt.getFormattedValue(row, 0);
                if (title.length > 7) {
                    var parts = title.match(/.{1,7}/g);
                    if (parts.length > 1) {
                        return parts.join('\n');
                    }
                }
                return title;
            }
        }, 1]);

        var chart = new google.charts.Bar(document.getElementById('movieChart'));
        chart.draw(view, google.charts.Bar.convertOptions(options));
    }
    </script>
</body>
</html>
