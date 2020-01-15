<%@page import="model.MemberBean"%>
<%@page import="java.util.List"%>
<%@page import="model.MemberDAO"%>
<%@page import="com.sun.swing.internal.plaf.metal.resources.metal"%>
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
		MemberDAO memberDAO = new MemberDAO();
		List<MemberBean> list = memberDAO.selectAllMember();
	%>
	<h2 align="center">모든 회원 정보 보기</h2>
	<table align="center" width="800" border="1">
		<tr height="50">
			<td align="center" width="150">아이디</td>
			<td align="center" width="250">이메일</td>
			<td align="center" width="200">전화번호</td>
			<td align="center" width="200">취미</td>
		</tr>
		<%
			for (MemberBean member : list) {
		%>
		<%-- 	<jsp:useBean id="bean" class="model.Member">
			<jsp:setProperty name="bean" property="id" value="<%=member.getId() %>" />
			<jsp:setProperty name="bean" property="email" value="<%=member.getEmail() %>" />
			<jsp:setProperty name="bean" property="tel" value="<%=member.getTel() %>" />
			<jsp:setProperty name="bean" property="job" value="<%=member.getJob() %>" />
			<jsp:setProperty name="bean" property="info" value="<%=member.getInfo() %>" />
			<jsp:setProperty name="bean" property="age" value="<%=member.getAge() %>" />
			<jsp:setProperty name="bean" property="hobby" value="<%=member.getHobby() %>" />
			<jsp:setProperty name="bean" property="pass1" value="<%=member.getPass1() %>" />
		</jsp:useBean>
		
		<tr height="50">
			<td align="center" width="150"><jsp:getProperty name="bean" property="id"/></td>
			<td align="center" width="150"><jsp:getProperty name="bean" property="email"/></td>
			<td align="center" width="150"><jsp:getProperty name="bean" property="tel"/></td>
			<td align="center" width="150"><jsp:getProperty name="bean" property="hobby"/></td>
		</tr>
 --%>
		<tr height="50">
			<td align="center" width="150"><a
				href="MemberInfo.jsp?id=<%=member.getId()%>"><%=member.getId()%></a></td>
			<td align="center" width="250"><%=member.getEmail()%></td>
			<td align="center" width="200"><%=member.getTel()%></td>
			<td align="center" width="200"><%=member.getHobby()%></td>
		</tr>
		<%
			}
		%>
	</table>
</body>
</html>