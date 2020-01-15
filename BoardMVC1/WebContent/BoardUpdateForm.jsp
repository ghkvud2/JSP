<%@page import="model.BoardBean"%>
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
		//해당 [글 번호]를 가지고 수정하게 될 게시글을 특정한다.
		int num = Integer.parseInt(request.getParameter("num"));

		//수정하게 될 게시글의 정보를 받아온다.
		BoardDAO boardDAO = new BoardDAO();

		//getOneBoard() 메소드는 조회수를 1증가시키기 때문에, 나중에 다시 조회수를 1 감소시켜준다.
		BoardBean boardBean = boardDAO.getOneBoard(num);
		boardBean.setReadcount(boardBean.getReadcount() - 1);
	%>
	<h1 align="center">글 수정하기</h1>

	<form action="BoardUpdateProc.jsp" method="post">
		<input type="hidden" name="num" value="<%=num%>">
		<table align="center" width="600" border="1" bordercolor="gray">

			<tr height="40">
				<td align="center" width="120">작성자</td>
				<td align="center" width="180"><%=boardBean.getWriter()%></td>
				<td align="center" width="120">작성일</td>
				<td align="center" width="180"><%=boardBean.getReg_date()%></td>
			</tr>

			<tr height="40">
				<td align="center" width="120">제목</td>
				<td align="center" colspan="3">&nbsp;<input type="text"
					name="subject" size="65" value="<%=boardBean.getSubject()%>"></td>
			</tr>

			<tr height="40">
				<td align="center" width="120">비밀번호</td>
				<td align="center" colspan="3">&nbsp; <input type="password"
					name="password" size="65"></td>
			</tr>

			<tr height="40">
				<td align="center" width="120">글 내용</td>
				<td colspan="3" width="480">&nbsp;<textarea rows="12" cols="70"
						name="content" align=""><%=boardBean.getContent()%></textarea></td>
			</tr>

			<tr height="40">
				<td align="center" colspan="4" size="55">
				<input type="submit" value="확인"> &nbsp; &nbsp; 
				<input type="reset" value="지우기"> &nbsp; &nbsp;
				<!-- 가끔씩 form 태그안에 button태그를 사용하면 
				무조건 submit이 되는 경우가 있는데 그때 type="button"을 추가해주면 된다.-->
				<button type="button" onclick="location.href='BoardList.jsp'">전체 글보기</button>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>