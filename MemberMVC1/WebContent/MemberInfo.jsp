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
	<table align="center" width="400" border="1">
		<tr height="50">
			<td align="center" width="150">아이디</td>
			<td width="250"><%=member.getId()%></td>
		</tr>
		<tr height="50">
			<td align="center" width="150">이메일</td>
			<td width="250"><%=member.getEmail()%></td>
		</tr>
		<tr height="50">
			<td align="center" width="150">전화번호</td>
			<td width="250"><%=member.getTel()%></td>
		</tr>
		<tr height="50">
			<td align="center" width="150">취미</td>
			<td width="250"><%=member.getHobby()%></td>
		</tr>
		<tr height="50">
			<td align="center" width="150">직업</td>
			<td width="250"><%=member.getJob()%></td>
		</tr>
		<tr height="50">
			<td align="center" width="150">나이</td>
			<td width="250"><%=member.getAge()%></td>
		</tr>
		<tr height="50">
			<td align="center" width="150">정보</td>
			<td width="250"><%=member.getInfo()%></td>
		</tr>
		<tr height="50">
			<td colspan="2" align="center">
				<button onclick="location.href='MemberUpdateForm.jsp?id=<%=id%>'">회원 수정</button> &nbsp; &nbsp;
				<button onclick="location.href='MemberDeleteForm.jsp?id=<%=id%>'">회원 삭제</button> &nbsp; &nbsp;
				<button onclick="location.href='MemberList.jsp'">목록 보기</button> &nbsp; &nbsp;
				<button onclick="location.href='MemberJoin.jsp'">회원 가입</button> &nbsp; &nbsp;
			</td>
		</tr>
	</table>
</body>
</html>