package com.board.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.board.model.bean.BoardBean;
import com.board.model.service.BoardServiceImpl;

public class BoardUpdateAction implements Action {

	private static BoardUpdateAction boardUpdateAction;
	static {
		boardUpdateAction = new BoardUpdateAction();
	}

	private BoardUpdateAction() {
	}

	public static BoardUpdateAction getInstance() {

		if (boardUpdateAction == null)
			boardUpdateAction = new BoardUpdateAction();

		return boardUpdateAction;
	}

	@Override
	public String action(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		int num = Integer.parseInt(request.getParameter("num"));
		int currentPage = Integer.parseInt(request.getParameter("currentPage"));
		String inputPassword = request.getParameter("password");
		String dbPassword = request.getParameter("dbpassword");

		BoardBean boardBean = new BoardBean();
		boardBean.setNum(num);
		boardBean.setSubject(request.getParameter("subject"));
		boardBean.setContent(request.getParameter("content"));

		if (dbPassword.equals(inputPassword)) {
			BoardServiceImpl.getInstance().updateBoard(boardBean);
			return "list.do?currentPage="+currentPage;
		} else {
			return "move_error.do";
		}
	}

}
