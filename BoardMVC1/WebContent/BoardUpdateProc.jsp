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
	<!-- BoardUpdateForm.jsp에서 넘어오는 값을 받는다. -->
	<jsp:useBean id="boardBean" class="model.BoardBean">
		<jsp:setProperty name="boardBean" property="*" />
	</jsp:useBean>

	<%
		BoardDAO boardDAO = new BoardDAO();

		//우선 해당 게시글의 비밀번호가 일치하는지 확인한다.
		String inputPassword = boardBean.getPassword();
		String dbPassword = boardDAO.getOneBoard(boardBean.getNum()).getPassword();
		
		//비밀번호가 일치하면 수정된 내용을 DB에 반영한다.
		if (inputPassword.equals(dbPassword)) {
			boardDAO.updateBoard(boardBean);
			response.sendRedirect("BoardList.jsp");
		} else {
	%>
			<!-- 패스워드가 일치하지 않으면 이전 페이지로 이동 -->
			<script type="text/javascript">
				alert("패스워드가 일치하지 않습니다.");
				history.go(-1);
			</script>
	<%
		}
	%>

	%>
</body>
</html>