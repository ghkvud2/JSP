<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<p align="center">
<c:if test="${param.totalCount > 0 }">
	<c:if test="${param.startPage > param.pageBlock}">
		<a href="list.do?currentPage=${param.startPage-param.pageBlock }">[이전]</a>
	</c:if>
	<c:forEach var="i" begin="${param.startPage }" end="${param.endPage }">
		<a href="list.do?currentPage=${i}">[${i }]
	</c:forEach>
	<c:if test="${param.endPage < param.totalPage }">
		<a href="list.do?currentPage=${param.startPage + param.pageBlock }">[다음]</a>
	</c:if>
</c:if>
</html>