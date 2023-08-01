<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Chart</title>
<link rel="stylesheet" href="resources/css/boardLayout.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We"
	crossorigin="anonymous">
<script type="text/javascript" src="resources/js/jQuery.js"></script>
<script type="text/javascript" src="resources/js/e1.js"></script>
<script type="text/javascript">
	
</script>
</head>
<body>



<form name="SearchForm" action="search" method="get">
	<div class="input-group mb-3">
		
			<input name="movie_search" type="text" class="form-control"
				placeholder="input keyword" aria-label="Recipient's username"
				aria-describedby="button-addon2">
			<button class="btn btn-outline-secondary" type="submit"
				id="button-addon2">Search</button>
		
	</div>
</form>


	<div>
		<div id="subcontent"><jsp:include page="${subcontentPage }" />

		</div>
	</div>




</body>
</html>