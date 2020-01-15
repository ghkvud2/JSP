<%@page import="model.BoardBean"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<h2 align="center">전체 글 보기</h2>

	<%
		//[전체 글 보기]에 페이징 처리 구현
		BoardDAO boardDAO = new BoardDAO();
		List<BoardBean> list = new ArrayList<BoardBean>();
		//1. 화면에 보여질 페이지 개수를 지정
		int pageSize = 10;

		//2. 현재 페이지 값을 읽어옴
		//BoardList.jsp를 최초로 호출하거나 수정 및 삭제 후 넘어오면 pageNum은 null이므로 1페이지부터 보여줘야한다.
		String pageNum = request.getParameter("pageNum");
		
		if (pageNum == null)
			pageNum = "1";

		int totalCount = boardDAO.getAllCount(); //3. 전체 글의 갯수를 저장하는 변수
		int number = 0; //4. 페이지 넘버링 변수
		int currentPage = Integer.parseInt(pageNum); //5. 현재 보고자 하는 페이지
		
		//6. 현재 페이지를 보여줄 시작 번호를 지정
		int startRow = (currentPage - 1) * pageSize + 1;
		int endRow = currentPage * pageSize;
		
		number = totalCount - (currentPage - 1) * pageSize;
		list = boardDAO.getAllBoard(startRow, endRow);
	%>
	<table align="center" width="800" border="1">
		<tr height="40">
			<td align="right" colspan="5">
				<button onclick="location.href='BoardWriteForm.jsp'">글 쓰기</button>
			</td>
		</tr>
		<tr height="40">
			<td width="50" align="center">번호</td>
			<td width="350" align="center">제목</td>
			<td width="150" align="center">작성자</td>
			<td width="150" align="center">작성일</td>
			<td width="100" align="center">조회수</td>
		</tr>
		<%
			for (BoardBean boardBean : list) {
		%>
		<tr height="40">
			<td width="50" align="center"><%=number--%></td>
			<td width="350" align="left"><a
				href="BoardInfo.jsp?num=<%=boardBean.getNum()%>"
				style="text-decoration: none"> <%
 			if (boardBean.getRe_step() > 1) {
 				for (int i = 0; i < (boardBean.getRe_step() - 1) * 3; i++) {
 			%> &nbsp; <%
 				}
 			}
 			%> <%=boardBean.getSubject()%></td>
			<td width="150" align="center"><%=boardBean.getWriter()%></td>
			<td width="150" align="center"><%=boardBean.getReg_date()%></td>
			<td width="100" align="center"><%=boardBean.getReadcount()%></td>
		</tr>
		<%
			}
		%>
	</table>
	<p align="center">
		<!-- JSP 하단에 페이징 처리 -->
		<%
			if (totalCount > 0) {
				//pageSize로 딱 나누어 떨어졌을 때는 몫을, 나머지가 있을 경우에는 (몫 + 1)의 값
				int totalPage = totalCount / pageSize + (totalCount % pageSize == 0 ? 0 : 1);

				//시작 페이지 숫자를 설정한다.
				int pageBlock = 10;
				int startPage = 1;
				if (currentPage % pageBlock != 0) {
					startPage = (int) (currentPage / pageBlock) * pageBlock + 1;
				} else {
					startPage = (int) (currentPage / pageBlock - 1) * pageBlock + 1;
				}

				int endPage = startPage + pageBlock - 1; //화면에 보여질 마지막 페이지 숫자
				if (endPage > totalPage)
					endPage = totalPage;

			if (startPage > pageBlock) {
		%>
		<a href="BoardList.jsp?pageNum=<%=startPage - pageBlock%>">[이전]</a>
		<%
			}
				for (int i = startPage; i <= endPage; i++) {
		%>
		<a href="BoardList.jsp?pageNum=<%=i%>">[<%=i%>]
		</a>
		<%
			}
				if (endPage < totalPage) {
		%>
		<a href="BoardList.jsp?pageNum=<%=startPage + pageBlock%>">[다음]</a>
		<%
			}
		}
		%>
	
</body>
</html>