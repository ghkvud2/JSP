<%@page import="model.BoardDAO"%>
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
	%>
	<!-- 데이터를 한번에 받아올 수 있도록 useBean 액션태그 사용 -->
	<jsp:useBean id="boardBean" class="model.BoardBean">
		<jsp:setProperty name="boardBean" property="*" />
	</jsp:useBean>

	<%
		BoardDAO boardDAO = new BoardDAO();
		boardDAO.replyBoard(boardBean);
		response.sendRedirect("BoardList.jsp");
	%>
</body>
</html>