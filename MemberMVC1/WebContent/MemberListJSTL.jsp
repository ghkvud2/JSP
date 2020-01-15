<%@page import="model.MemberBean"%>
<%@page import="java.util.List"%>
<%@page import="model.MemberDAO"%>
<%@page import="com.sun.swing.internal.plaf.metal.resources.metal"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
		request.setAttribute("list", list);
	%>
	<h2 align="center">모든 회원 정보 보기</h2>
	<table align="center" width="800" border="1">
		<tr height="50">
			<td align="center" width="150">아이디</td>
			<td align="center" width="250">이메일</td>
			<td align="center" width="200">전화번호</td>
			<td align="center" width="200">취미</td>
		</tr>
		<c:forEach var="memberBean" items="${list}">
			<tr height="50">
				<td align="center" width="150"><a
					href="MemberInfo.jsp?id=${memberBean.id }">${memberBean.id}</a></td>
				<td align="center" width="250">${memberBean.email }</td>
				<td align="center" width="200">${memberBean.tel }</td>
				<td align="center" width="200">${memberBean.hobby }</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>