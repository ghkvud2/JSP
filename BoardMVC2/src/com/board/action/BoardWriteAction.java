package com.board.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.board.model.bean.BoardBean;
import com.board.model.service.BoardServiceImpl;

public class BoardWriteAction implements Action {

	private static BoardWriteAction boardWriteAction;
	static {
		boardWriteAction = new BoardWriteAction();
	}

	private BoardWriteAction() {
	}

	public static BoardWriteAction getInstance() {

		if (boardWriteAction == null)
			boardWriteAction = new BoardWriteAction();

		return boardWriteAction;
	}

	@Override
	public String action(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		BoardBean boardBean = new BoardBean();
		boardBean.setWriter(request.getParameter("writer"));
		boardBean.setSubject(request.getParameter("subject"));
		boardBean.setEmail(request.getParameter("email"));
		boardBean.setPassword(request.getParameter("password"));
		boardBean.setContent(request.getParameter("content"));
		
		BoardServiceImpl.getInstance().writeBoard(boardBean);
		
		return "list.do";
	}

}
