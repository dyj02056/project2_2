$(document).ready(function() {
  // Homepage 클릭 시
  $("a[href='main']").on("click", function(e) {
    e.preventDefault(); // 기본 동작 중단 (페이지 이동 방지)
    loadPage("home.jsp"); // 페이지 로드 함수 호출
  });

  // Information 클릭 시
  $("a[href='Information']").on("click", function(e) {
    e.preventDefault();
    loadPage("Information.jsp");
  });

  // BoxOffice 클릭 시
  $("a[href='BoxOffice']").on("click", function(e) {
    e.preventDefault();
    loadPage("boxOffice.jsp");
  });

  // Movie Search 클릭 시
  $("a[href='3']").on("click", function(e) {
    e.preventDefault();
    loadPage("movieSearch.jsp");
  });

  // Movie chart 클릭 시
  $("a[href='2']").on("click", function(e) {
    e.preventDefault();
    loadPage("movieChart.jsp");
  });

  // Freeboard 클릭 시
  $("a[href='4']").on("click", function(e) {
    e.preventDefault();
    loadPage("freeboard.jsp");
  });

  // MovieChart 클릭 시
  $("a[href='moviechart']").on("click", function(e) {
    e.preventDefault();
    loadPage("movieChart.jsp");
  });
});

// 페이지를 로드하는 함수
function loadPage(pageName) {
  $("#maincontent").fadeOut(200, function() {
    // 페이지가 사라진 후, 새로운 페이지를 로드하고 나타냅니다.
    $("#maincontent").load(pageName, function() {
      $("#maincontent").fadeIn(200); // 페이지가 나타납니다.
    });
  });
}