// 일간 매출 점유율 그래프 그리기
var dailyChartCtx = document.getElementById('dailySalesChart').getContext('2d');
var dailyChart = new Chart(dailyChartCtx, {
    type: 'pie',
    data: {
        labels: dailySalesData.labels,
        datasets: [{
            label: '일간 매출 점유율',
            data: dailySalesData.values,
            backgroundColor: dailySalesData.colors,
            borderWidth: 1
        }]
    }
});

// 주간 매출 점유율 그래프 그리기
var weeklyChartCtx = document.getElementById('weeklySalesChart').getContext('2d');
var weeklyChart = new Chart(weeklyChartCtx, {
    type: 'bar',
    data: {
        labels: weeklySalesData.labels,
        datasets: [{
            label: '주간 매출 점유율',
            data: weeklySalesData.values,
            backgroundColor: weeklySalesData.colors,
            borderWidth: 1
        }]
    },
    options: {
        scales: {
            y: {
                beginAtZero: true
            }
        }
    }
});