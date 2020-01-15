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
	//BoardInfo.jsp에서 [답변 쓰기] 버튼을 눌렀을 때 넘어오는 데이터를 받는다.
	int num =Integer.parseInt(request.getParameter("num"));
	int ref =Integer.parseInt(request.getParameter("ref"));
	int re_step =Integer.parseInt(request.getParameter("re_step"));
	int re_level =Integer.parseInt(request.getParameter("re_level"));
%>


<h1 align="center">답변글 쓰기</h1>

	<form action="BoardReplyProc.jsp" method="post">
	<!-- 사용자로부터 데이터를 입력받지 않고 BoarReplyProc.jsp로 보낸다. -->
	<input type="hidden" name="num" value="<%=num %>">
	<input type="hidden" name="ref" value="<%=ref %>">
	<input type="hidden" name="re_step" value="<%=re_step %>">
	<input type="hidden" name="re_level" value="<%=re_level %>">
		
		<table align="center" width="600" border="1" bordercolor="gray">
			<tr height="40">
				<td align="center" width="150" >작성자</td>
				<td width="450"><input type="text" name="writer" size="55"></td>
			</tr>

			<tr height="40">
				<td align="center" width="150">제목</td>
				<td width="450"><input type="text" name="subject" value ="└[답변] "size="55"></td>
			</tr>

			<tr height="40">
				<td align="center" width="150">이메일</td>
				<td width="450"><input type="email" name="email" size="55"></td>
			</tr>

			<tr height="40">
				<td align="center" width="150">비밀번호</td>
				<td width="450"><input type="password" name="password" size="55"></td>
			</tr>

			<tr height="40">
				<td align="center" width="150">글 내용</td>
				<td width="450"><textarea rows="15" cols="60" name="content" size="60"></textarea></td>
			</tr>

			<tr height="40">
				<td align="center" colspan="2" size="55">
				<input type="submit" value="확인"> &nbsp; &nbsp; 
				<input type="reset" value="지우기"> &nbsp; &nbsp;
				<button onclick="location.href='BoardList.jsp'">전체 글보기</button>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>