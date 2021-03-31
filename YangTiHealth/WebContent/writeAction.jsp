<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import = "healthbbs.HealthBbsDAO" %>
<jsp:useBean id="healthbbs" class="healthbbs.HealthBbs" scope="page" />
<jsp:setProperty property="bbsTitle" name="healthbbs"/>
<jsp:setProperty property="bbsContent" name="healthbbs"/>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>양티의 운동 저장 홈페이지</title>

</head>
<body>
	<%
	String userID = null;
	if(session.getAttribute("userID") != null) {
		userID = (String) session.getAttribute("userID");
	}
	if(healthbbs.getBbsTitle() == null || healthbbs.getBbsContent() == null)
	{
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('입력이 안 된 사항이 있습니다.')");
		script.println("history.back()");
		script.println("</script>");
	} else {
		HealthBbsDAO healthbbsDAO = new HealthBbsDAO();
		int result = healthbbsDAO.write(healthbbs.getBbsTitle(), "3"/* userID */, healthbbs.getBbsContent());
		if(result == -1) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('글쓰기에 실패했습니다.')");
			script.println("history.back()");
			script.println("</script>");
		} else {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("location.href = 'healthBbs.jsp'");
			script.println("</script>");
		}
	}
		
		%>
</body>
</html>