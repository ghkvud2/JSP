<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1 align="center">게시글 쓰기</h1>

	<form action="write.do" method="post">
		<table align="center" width="600" border="1" bordercolor="gray">

			<tr height="40">
				<td align="center" width="150">작성자</td>
				<td width="450"><input type="text" name="writer" size="55"></td>
			</tr>

			<tr height="40">
				<td align="center" width="150">제목</td>
				<td width="450"><input type="text" name="subject" size="55"></td>
			</tr>

			<tr height="40">
				<td align="center" width="150">이메일</td>
				<td width="450"><input type="email" name="email" size="55"></td>
			</tr>

			<tr height="40">
				<td align="center" width="150">비밀번호</td>
				<td width="450"><input type="password" name="password"
					size="55"></td>
			</tr>

			<tr height="40">
				<td align="center" width="150">글 내용</td>
				<td width="450"><textarea rows="15" cols="60" name="content"
						size="60"></textarea></td>
			</tr>

			<tr height="40">
				<td align="center" colspan="2" size="55">
				<input type="submit" value="확인"> &nbsp; &nbsp; 
				<input type="reset" value="지우기"> &nbsp; &nbsp; 
				<input type="button" onclick="location.href='list.do?currentPage=1'" value="전체 글보기"></td>
			</tr>
		</table>
	</form>
</body>
</html>