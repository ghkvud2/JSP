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
	<!-- 게시글 작성한 데이터를 읽어들인다. -->
	<jsp:useBean id="boardBean" class="model.BoardBean">
		<jsp:setProperty name="boardBean" property="*" />
	</jsp:useBean>

	<%
		//데이터베이스로 빈 클래스를 전송
		BoardDAO boardDAO = new BoardDAO();

		//데이터 저장 메소드 호출
		boardDAO.insertBoard(boardBean);
	
		//전체 게시글 페이지로 이동
		response.sendRedirect("BoardList.jsp");
	%>

</body>
</html>