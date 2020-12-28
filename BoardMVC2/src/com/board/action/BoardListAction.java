package com.board.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.board.model.bean.BoardBean;
import com.board.model.service.BoardServiceImpl;
import com.board.util.PageNavigator;

public class BoardListAction implements Action {

	private static BoardListAction boardListAction;
	static {
		boardListAction = new BoardListAction();
	}

	private BoardListAction() {
	}

	public static BoardListAction getInstance() {

		if (boardListAction == null)
			boardListAction = new BoardListAction();

		return boardListAction;
	}

	@Override
	public String action(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String currentPageParameter = request.getParameter("currentPage");
		int currentPage = Integer.parseInt(currentPageParameter == null ? "1" : currentPageParameter);
		PageNavigator pageNavigator = BoardServiceImpl.getInstance().getPageNavigator(currentPage);
		int startRow = pageNavigator.getStartRow();
		int endRow = pageNavigator.getEndRow();
		List<BoardBean> list = BoardServiceImpl.getInstance().getAllBoard(startRow, endRow);
		request.setAttribute("list", list);
		request.setAttribute("pageNavigator", pageNavigator);
		return "move_list.do";
	}

}
