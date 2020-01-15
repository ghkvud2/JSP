<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<body>
	<h2 align="center">게시글 보기</h2>
	<table align="center" width="600" border="1" bordercolor="gray">
		<tr height="40">
			<td align="center" width="120">글 번호</td>
			<td align="center" width="180">${boardBean.num }</td>
			<td align="center" width="120">조회수</td>
			<td align="center" width="180">${boardBean.readcount }</td>
		</tr>

		<tr height="40">
			<td align="center" width="120">작성자</td>
			<td align="center" width="180">${boardBean.writer }</td>
			<td align="center" width="120">작성일</td>
			<td align="center" width="180">${boardBean.reg_date }</td>
		</tr>

		<tr height="40">
			<td align="center" width="120">이메일</td>
			<td align="center" colspan="3">${boardBean.email }</td>
		</tr>

		<tr height="40">
			<td align="center" width="120">제목</td>
			<td align="center" colspan="3">${boardBean.subject }</td>
		</tr>

		<tr height="80">
			<td align="center" width="120">글 내용</td>
			<td align="center" colspan="3">${boardBean.content }</td>
		</tr>

		<tr height="40">
			<td align="center" colspan="4"><input type="button"
				value="답변 쓰기"
				onclick="location.href='move_reply.do?num=${boardBean.num}&ref=${boardBean.ref}&re_step=${boardBean.re_step}&re_level=${boardBean.re_level}'">&nbsp;
				&nbsp; <input type="button" value="수정하기" onclick="location.href='move_update.do?num=${boardBean.num }'">&nbsp;
				&nbsp; <input type="button" value="삭제하기" onclick="location.href='move_delete.do?num=${boardBean.num }'">&nbsp;
				&nbsp; <input type="button" value="목록보기" onclick="location.href='list.do?currentPage=1'"></td>
		</tr>
	</table>
</body>
</html>