package com.board.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.board.factory.BoardActionFactory;
import com.board.util.MovePage;

@WebServlet("*.do")
public class BoardController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doAction(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		doAction(request, response);
	}

	protected void doAction(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String path = "";
		String root = request.getContextPath();
		String uri = request.getRequestURI();
		String act = uri.substring(root.length());

		if ("/list.do".equals(act)) {
			path = BoardActionFactory.getBoardListAction().action(request, response);
			MovePage.forward(path, request, response);

		} else if ("/move_list.do".equals(act)) {
			path = "BoardList.jsp";
			MovePage.forward(path, request, response);

		} else if ("/write.do".equals(act)) {
			path = BoardActionFactory.getBoardWriteAction().action(request, response);
			MovePage.redirect(path, response);

		} else if ("/move_write.do".equals(act)) {
			path = "BoardWrite.jsp";
			MovePage.redirect(path, response);

		} else if ("/info.do".equals(act)) {
			path = BoardActionFactory.getBoardInfoAction().action(request, response);
			MovePage.forward(path, request, response);

		} else if ("/move_info.do".equals(act)) {
			path = "BoardInfo.jsp";
			MovePage.forward(path, request, response);

		} else if ("/delete.do".equals(act)) {
			path = BoardActionFactory.getBoardDeleteAction().action(request, response);
			MovePage.redirect(path, response);

		} else if ("/move_delete.do".equals(act)) {
			BoardActionFactory.getBoardInfoAction().action(request, response);
			path = "BoardDelete.jsp";
			MovePage.forward(path, request, response);

		} else if ("/move_error.do".equals(act)) {
			path = "BoardPassError.jsp";
			MovePage.redirect(path, response);

		} else if ("/reply.do".equals(act)) {
			path = BoardActionFactory.getBoardReplyAction().action(request, response);
			MovePage.forward(path, request, response);
			
		} else if ("/move_reply.do".equals(act)) {
			path = "BoardReply.jsp";
			MovePage.forward(path, request, response);
			
		} else if ("/update.do".equals(act)) {
			path = BoardActionFactory.getBoardUpdateAction().action(request, response);
			MovePage.forward(path, request, response);
			
		} else if ("/move_update.do".equals(act)) {
			BoardActionFactory.getBoardInfoAction().action(request, response);
			path = "BoardUpdate.jsp";
			MovePage.forward(path, request, response);
		}

	}

}
