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
		request.setCharacterEncoding("EUC-KR");
	%>

	<jsp:useBean id="member" class="model.MemberBean">
		<jsp:setProperty name="member" property="*" />
	</jsp:useBean>

	<%
		MemberDAO memberDAO = new MemberDAO();
		String pass1 = memberDAO.getPassword(member.getId());

		if (pass1.equals(member.getPass1())) {

			memberDAO.deleteMember(member);
			response.sendRedirect("MemberList.jsp");
		} else {
	%>
	<script type="text/javascript">
		alert("패스워드가 틀립니다. 다시 확인하세요");
		history.go(-1);
	</script>
	<%
		}
	%>
</body>
</html>