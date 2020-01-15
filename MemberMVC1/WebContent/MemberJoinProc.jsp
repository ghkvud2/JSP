<%@page import="model.MemberDAO"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<%
		request.setCharacterEncoding("EUC-KR");
		String[] hobbys = request.getParameterValues("hobby");

		String textHobby = "";
		for (String hobby : hobbys)
			textHobby += hobby + " ";
	%>
	<jsp:useBean id="member" class="model.MemberBean">
		<jsp:setProperty name="member" property="*" />
		<jsp:setProperty name="member" property="hobby" value="<%=textHobby%>" />
	</jsp:useBean>

	<%
		MemberDAO memberDao = new MemberDAO();
		memberDao.insertMember(member);
		
		response.sendRedirect("MemberList.jsp");
	%>

</body>
</html>