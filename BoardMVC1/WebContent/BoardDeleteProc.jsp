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
	<jsp:useBean id="boardBean" class="model.BoardBean">
		<jsp:setProperty name="boardBean" property="*" />
	</jsp:useBean>

	<%
		BoardDAO boardDAO = new BoardDAO();

		String inputPassword = request.getParameter("password");
		String dbPassword = boardDAO.getOneBoard(boardBean.getNum()).getPassword();
		if (inputPassword.equals(dbPassword)) {
			boardDAO.deleteBoard(boardBean.getNum());
			response.sendRedirect("BoardList.jsp");
		} else {
	%>
			<script type="text/javascript">
				alert("패스워드가 일치하지 않습니다.");
				history.go(-1);
			</script>
	<%
		}
	%>

</body>
</html>