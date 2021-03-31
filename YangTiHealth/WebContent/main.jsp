<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>양티의 운동 저장 홈페이지</title>

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css"
	integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l"
	crossorigin="anonymous">
</head>
<body>

	<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
		<a clss="navbar-brand" href="#">양티</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
		aria-expanded="false" aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id ="navbarNavDropdown">
			<ul class="navbar-nav">
				<li class="nav-item active"><a class="nav-link" href="main.jsp">메인<span class="sr-only">(current)</span>
				</a>
				</li>
				<li class="nav-item"><a class="nav-link" href="./healthBbs.jsp">게시판</a></li>
				<li class="nav-item"><a class="nav-link" href="#"></a></li>
				<li class="nav-item"><a class="nav-link" href="#"></a></li>
			</ul>
		</div>	
	</nav>
	<div class ="jumbotron" style="position: relative; left: 400px; width: 700px;">
		<h1 class="display-4">양티의 헬스 기록 홈페이지</h1>
		<p class = "lead"></p>
		<hr class="my-4">
		<p></p>
		<a class="btn btn-primary btn-lg" href= "#" role="button">더 알아보기</a>
	</div>
	
	<div class="card bg-light mt-3">
	<div class="card-header bg-light">
		<div class="row">
			<div class="col-8 text-left">1</div>
			<div class="col-4 text-right">
				2<span style="color : red;">3</span>
			</div>
		</div>
	</div>
	<div class="card-body">
		<h5 class="card-title">
			6
		</h5>
		<p class="card-text">7</p>
		<div class="row">
			<div class="col-9 text-left">
				7<span style="color: red;">8</span>
				9<span style="color: red;">10</span>
				11<span style="color: red;">12</span>
				<span style="color: green;">(추천 : test)</span>
			</div>
			<div class="col-3 text-right">
				<a onclick="return confirm('추천하시겠습니까?')" href="#">추천</a>
				<a onclick="return confirm('삭제하시겠습니까?')" href="#">삭제</a>
			</div>
		</div>
	</div>
	</div>
	
	
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
		integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns"
		crossorigin="anonymous"></script>	
</body>
</html>