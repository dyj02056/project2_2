<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.jsp.tagext.TryCatchFinally"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<html>
<head>
  <meta charset="UTF-8">
  <title>Information</title>
  <link rel="stylesheet" href="resources/css/information.css">
  <script type="text/javascript" src="resources/js/jQuery.js"></script>
  <script type="text/javascript" src="resources/js/e1.js"></script>
  <style type="text/css">
    body {
      background-color: #444444;
    }
    .boardTBL {
      opacity: 0;
    }
    .boardTBL.appear {
      animation: fadeIn 1s ease forwards;
    }
    @keyframes fadeIn {
      to {
        opacity: 1;
      }
    }
  </style>
</head>
<body>

  <h1 class="titleH1">Manual</h1>

  <table class="boardTBL appear">
    <tr>
      <td>Login / Sign - 회원가입을 통해 개인정보를 DB에 저장하여 로그인이 가능</td>
    </tr>
  </table>

  <table class="boardTBL appear">
    <tr>
      <td>Ticket Image - 오른쪽 하단 티켓 이미지를 클릭시 CGV 영화 예매 페이지로 이동</td>
    </tr>
  </table>

  <table class="boardTBL appear">
    <tr>
      <td>BoxOffice - API를 활용 일간 박스오피스 데이터를 연결하여 순위, 매출, 개봉일을 보여주며 이미지 클릭시 예고편으로 이동</td>
    </tr>
  </table>

  <table class="boardTBL appear">
    <tr>
      <td>MovieSearch - 컨트롤러를 이용 연결된 DB에 키워드를 검색하여 키워드가 포함된 영화를 보여줍니다.</td>
    </tr>
  </table>

  <table class="boardTBL appear">
    <tr>
      <td>MovieChart - 박스오피스 영화의 주간 누적 관객수를 그래프로 시각화합니다.</td>
    </tr>
  </table>

  <table class="boardTBL appear">
    <tr>
      <td>Board - 로그인된 개인정보를 활용하여 게시판에 글을 남겨 관리자에게 문의 혹은 영화에 대한 평을 남길 수 있습니다.</td>
    </tr>
  </table>
</body>
</html>