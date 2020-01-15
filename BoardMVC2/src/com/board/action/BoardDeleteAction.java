package com.board.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.board.model.service.BoardServiceImpl;

public class BoardDeleteAction implements Action {

	private static BoardDeleteAction boardDeleteAction;
	static {
		boardDeleteAction = new BoardDeleteAction();
	}

	private BoardDeleteAction() {
	}

	public static BoardDeleteAction getInstance() {

		if (boardDeleteAction == null)
			boardDeleteAction = new BoardDeleteAction();

		return boardDeleteAction;
	}

	@Override
	public String action(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		int num = Integer.parseInt(request.getParameter("num"));
		String inputPassword = request.getParameter("password");
		String dbPassword = request.getParameter("dbpassword");
		if (dbPassword.equals(inputPassword)) {
			BoardServiceImpl.getInstance().deleteBoard(num);
			return "list.do";
		} else {
			return "move_error.do";
		}
	}

}
