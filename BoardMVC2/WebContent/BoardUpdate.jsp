<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<h1 align="center">글 수정하기</h1>

	<form action="update.do" method="post">
	<input type="hidden" name="dbpassword" value="${boardBean.password }">
	<input type="hidden" name="num" value="${boardBean.num }">
		<input type="hidden" name="num" value="${boardBean.num }">
		<table align="center" width="600" border="1" bordercolor="gray">

			<tr height="40">
				<td align="center" width="120">작성자</td>
				<td align="center" width="180">${boardBean.writer }</td>
				<td align="center" width="120">작성일</td>
				<td align="center" width="180">${boardBean.reg_date }</td>
			</tr>

			<tr height="40">
				<td align="center" width="120">제목</td>
				<td align="center" colspan="3">&nbsp;<input type="text"
					name="subject" size="65" value="${boardBean.subject }"></td>
			</tr>

			<tr height="40">
				<td align="center" width="120">비밀번호</td>
				<td align="center" colspan="3">&nbsp; <input type="password"
					name="password" size="65"></td>
			</tr>

			<tr height="40">
				<td align="center" width="120">글 내용</td>
				<td colspan="3" width="480">&nbsp;<textarea rows="12" cols="70"
						name="content" align="">${boardBean.content }</textarea></td>
			</tr>

			<tr height="40">
				<td align="center" colspan="4" size="55">
				<input type="submit" value="확인"> &nbsp; &nbsp; 
				<input type="reset" value="지우기"> &nbsp; &nbsp;
				<!-- 가끔씩 form 태그안에 button태그를 사용하면 
				무조건 submit이 되는 경우가 있는데 그때 type="button"을 추가해주면 된다.-->
				<button type="button" onclick="location.href='list.do?currentPage=1'">전체 글보기</button>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>