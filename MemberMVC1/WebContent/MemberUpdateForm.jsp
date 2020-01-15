<%@page import="model.MemberBean"%>
<%@page import="model.MemberDAO"%>
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
		String id = request.getParameter("id");
		MemberDAO memberDAO = new MemberDAO();
		MemberBean member = memberDAO.selectMember(id);
	%>
	<h2 align="center">회원정보 수정하기</h2>

	<table align="center" width="400" border="1">
		<form action="MemberUpdateProc.jsp" method="post">
			<input type="hidden" name="id" value="<%=id%>">
			<tr height="50">
				<td align="center" width="150">아이디</td>
				<td width="250"><%=member.getId()%></td>
			</tr>
			<tr height="50">
				<td align="center" width="150">이메일</td>
				<td width="250"><input type="email" name="email"
					value="<%=member.getEmail()%>"></td>
			</tr>
			<tr height="50">
				<td align="center" width="150">전화번호</td>
				<td width="250"><input type="tel" name="tel"
					value="<%=member.getTel()%>"></td>
			</tr>
			<tr height="50">
				<td align="center" width="150">비밀번호</td>
				<td width="250"><input type="password" name="pass1"></td>
			</tr>

			<tr height="50">
				<td align="center" colspan="2"><input type="submit"
					value="회원정보 수정">&nbsp;&nbsp;
		</form>
		<button onclick="location.href='MemberList.jsp'">회원 전체보기</button>
		</td>
		</tr>
	</table>

</body>
</html>