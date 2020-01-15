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
		int num = Integer.parseInt(request.getParameter("num").trim());
		BoardDAO boardDAO = new BoardDAO();
		BoardBean boardBean = boardDAO.getOneBoard(num);
	%>
	<h2 align="center">게시글 보기</h2>
	<table align="center" width="600" border="1" bordercolor="gray">
		<tr height="40">
			<td align="center" width="120">글 번호</td>
			<td align="center" width="180"><%=boardBean.getNum()%></td>
			<td align="center" width="120">조회수</td>
			<td align="center" width="180"><%=boardBean.getReadcount()%></td>
		</tr>

		<tr height="40">
			<td align="center" width="120">작성자</td>
			<td align="center" width="180"><%=boardBean.getWriter()%></td>
			<td align="center" width="120">작성일</td>
			<td align="center" width="180"><%=boardBean.getReg_date()%></td>
		</tr>

		<tr height="40">
			<td align="center" width="120">이메일</td>
			<td align="center" colspan="3"><%=boardBean.getEmail()%></td>
		</tr>

		<tr height="40">
			<td align="center" width="120">제목</td>
			<td align="center" colspan="3"><%=boardBean.getSubject()%></td>
		</tr>

		<tr height="80">
			<td align="center" width="120">글 내용</td>
			<td align="center" colspan="3"><%=boardBean.getContent()%></td>
		</tr>

		<tr height="40">
			<td align="center" colspan="4"><input type="button"
				value="답변 쓰기"
				onclick="location.href='BoardReplyForm.jsp?num=<%=boardBean.getNum()%>&ref=<%=boardBean.getRef()%>&re_step=<%=boardBean.getRe_step()%>&re_level=<%=boardBean.getRe_level()%>'">&nbsp;
				&nbsp; <input type="button" value="수정하기"
				onclick="location.href='BoardUpdateForm.jsp?num=<%=boardBean.getNum()%>'">&nbsp;
				&nbsp; <input type="button" value="삭제하기"
				onclick="location.href='BoardDeleteForm.jsp?num=<%=boardBean.getNum()%>'">&nbsp;
				&nbsp; <input type="button" value="목록보기"
				onclick="location.href='BoardList.jsp?num=<%=boardBean.getNum()%>'">
			</td>
		</tr>
	</table>
</body>
</html>