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
	int num = Integer.parseInt(request.getParameter("num"));
	BoardDAO boardDAO = new BoardDAO();
	BoardBean boardBean = boardDAO.getOneBoard(num);
	boardBean.setReadcount(boardBean.getReadcount() - 1);
%>
<h1 align="center">글 삭제하기</h1>

	<form action="BoardDeleteProc.jsp" method="post">
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
				<td align="center" colspan="3">&nbsp;<%=boardBean.getSubject()%></td>
			</tr>

			<tr height="40">
				<td align="center" width="120">비밀번호</td>
				<td align="center" colspan="3">&nbsp; <input type="password" name="password" size="65"></td>
			</tr>

			<tr height="40">
				<td align="center" width="120">글 내용</td>
				<td colspan="3" width="480">&nbsp;
				<textarea rows="12" cols="70"
						name="content" align="" readonly="readonly"><%=boardBean.getContent()%></textarea></td>
			</tr>

			<tr height="40">
				<td align="center" colspan="4" size="55">
				<input type="submit" value="삭제"> &nbsp; &nbsp; 
				<!-- 가끔씩 form 태그안에 button태그를 사용하면 
				무조건 submit이 되는 경우가 있는데 그때 type="button"을 추가해주면 된다.-->
				<button onclick="location.href='BoardList.jsp'">전체 글보기</button>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>