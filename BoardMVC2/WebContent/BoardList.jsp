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

	<c:if test="${empty list}">
		<script type="text/javascript">
			location.href="list.do?currentPage=1";
		</script>
	</c:if>
	
	<h2 align="center">전체 글 보기</h2>

	<table align="center" width="800" border="1">
		<tr height="40">
			<td align="right" colspan="5">
				<button onclick="location.href='move_write.do'">글 쓰기</button>
			</td>
		</tr>
		<tr height="40">
			<td width="50" align="center">번호</td>
			<td width="350" align="center">제목</td>
			<td width="150" align="center">작성자</td>
			<td width="150" align="center">작성일</td>
			<td width="100" align="center">조회수</td>
		</tr>

		<c:forEach var="boardBean" items="${list}">
			<tr height="40">
				<td width="50" align="center">${boardBean.num }</td>
				<td width="350" align="left">
				<c:forEach var="i" begin="1" end="${boardBean.re_step }">
					&nbsp;&nbsp;&nbsp;
				</c:forEach> 
				<a href="info.do?num=${boardBean.num}&currentPage=${pageNavigator.currentPage}" style="text-decoration: none">${boardBean.subject}</td>
				<td width="150" align="center">${boardBean.writer}</td>
				<td width="150" align="center">${boardBean.reg_date}</td>
				<td width="100" align="center">${boardBean.readcount}</td>
			</tr>
		</c:forEach>
	</table>
	<p align="center">

	<jsp:include page="BoardPaging.jsp">
		<jsp:param value="${pageNavigator.totalCount }" name="totalCount"/>
		<jsp:param value="${pageNavigator.startPage }" name="startPage"/>
		<jsp:param value="${pageNavigator.endPage }" name="endPage"/>
		<jsp:param value="${pageNavigator.totalPage }" name="totalPage"/>
		<jsp:param value="${pageNavigator.pageBlock }" name="pageBlock"/>
	</jsp:include>
</body>
</html>