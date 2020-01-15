package com.board.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.board.model.bean.BoardBean;
import com.board.model.service.BoardServiceImpl;

public class BoardReplyAction implements Action {

	private static BoardReplyAction boardReplyAction;
	static {
		boardReplyAction = new BoardReplyAction();
	}

	private BoardReplyAction() {
	}

	public static BoardReplyAction getInstance() {

		if (boardReplyAction == null)
			boardReplyAction = new BoardReplyAction();

		return boardReplyAction;
	}
	
	
	@Override
	public String action(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		BoardBean boardBean = new BoardBean();
		boardBean.setNum(Integer.parseInt(request.getParameter("num")));
		boardBean.setRef(Integer.parseInt(request.getParameter("ref")));
		boardBean.setRe_step(Integer.parseInt(request.getParameter("re_step")));
		boardBean.setRe_level(Integer.parseInt(request.getParameter("re_level")));
		boardBean.setWriter(request.getParameter("writer"));
		boardBean.setSubject(request.getParameter("subject"));
		boardBean.setEmail(request.getParameter("email"));
		boardBean.setPassword(request.getParameter("password"));
		boardBean.setContent(request.getParameter("content"));
		BoardServiceImpl.getInstance().replyBoard(boardBean);
		
		return "list.do";
	}

}
