<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import= "healthbbs.HealthBbs" %>
<%@ page import = "healthbbs.HealthBbsDAO" %>
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
	<%
	String userID = null;
	if (session.getAttribute("userID") != null) {
		userID = (String) session.getAttribute("userID");
	}
	int bbsID = 0;
	if(request.getParameter("bbsID") != null) {
		bbsID = Integer.parseInt(request.getParameter("bbsID"));
	}
	if( bbsID ==0) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('유효하지 않은 글입니다.')");
		script.println("location.href = 'healthbbs.jsp'");
		script.println("</script>");
	}
	HealthBbs healthbbs = new HealthBbsDAO().getBbs(bbsID);
	%>
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
		<a clss="navbar-brand" href="#">양티</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
		aria-expanded="false" aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id ="navbarNavDropdown">
			<ul class="navbar-nav">
				<li class="nav-item"><a class="nav-link" href="main.jsp">메인
				</a>
				</li>
				<li class="nav-item active"><a class="nav-link" href="#">게시판<span class="sr-only">(current)</span></a></li>
				<li class="nav-item"><a class="nav-link" href="#"></a></li>
				<li class="nav-item"><a class="nav-link" href="#"></a></li>
			</ul>
		</div>	
	</nav>

	<div class="container">
		<div class="row">
			<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
				<thead>
					<tr>
						<th colspan="3" style="background-color: #eeeeee; text-align: center;">게시판 글 보기</th>
					</tr>
				<tbody>
					<tr>
						<td style="width : 20%;">글 제목</td>
						<td colspan="2"><%= healthbbs.getBbsTitle() %></td>
					</tr>
					<tr>
						<td>작성자</td>
						<td colspan="2"><%= healthbbs.getUserID() %></td>
					</tr>
					<tr>
						<td>작성일자</td>
						<td colspan="2"><%= healthbbs.getBbsDate().substring(0,11) + healthbbs.getBbsDate().substring(11,13) + "시" + healthbbs.getBbsDate().substring(14,16) + "분" %></td>
					</tr>
					<tr>
						<td>내용</td>
						<td colspan="2" style="min-height : 200px; text-align: left;"><%= healthbbs.getBbsContent() %></td>
					</tr>
				</tbody>				
			</table>
			<a href="healthbbs.jsp" class="btn btn-primary">목록</a>
			<%
				if(userID != null && userID.equals(healthbbs.getUserID())) {
			%>
				<a href="update.jsp?bbsID=<%= bbsID %>" class="btn btn-primary">수정</a>
				<a onclick="return confirm('정말로 삭제하시겠습니까?')" href="deleteAction.jsp?bbsID=<%= bbsID %>" class="btn btn-primary">삭제</a>
			<%
				}
			%>
			<input type="submit" class="btn btn-primary pull-right" value = "글쓰기">
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