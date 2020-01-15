package com.board.model.service;

import java.util.List;

import com.board.model.bean.BoardBean;
import com.board.model.dao.BoardDAOImpl;
import com.board.util.PageNavigator;

public class BoardServiceImpl implements BoardService {

	private static BoardServiceImpl boardServiceImpl;

	static {
		boardServiceImpl = new BoardServiceImpl();
	}

	private BoardServiceImpl() {
	}

	public static BoardServiceImpl getInstance() {
		if (boardServiceImpl == null)
			boardServiceImpl = new BoardServiceImpl();
		return boardServiceImpl;
	}

	@Override
	public void deleteBoard(int num) {
		BoardDAOImpl.getInstance().deleteBoard(num);
	}

	@Override
	public void updateBoard(BoardBean boardBean) {
		BoardDAOImpl.getInstance().updateBoard(boardBean);
	}

	@Override
	public void replyBoard(BoardBean boardBean) {
		BoardDAOImpl.getInstance().replyBoard(boardBean);
	}

	@Override
	public void writeBoard(BoardBean boardBean) {
		BoardDAOImpl.getInstance().writeBoard(boardBean);
	}

	@Override
	public BoardBean getOneBoard(int num) {
		return BoardDAOImpl.getInstance().getOneBoard(num);
	}

	@Override
	public List<BoardBean> getAllBoard(int startRow, int endRow) {
		return BoardDAOImpl.getInstance().getAllBoard(startRow, endRow);
	}

	@Override
	public PageNavigator getPageNavigator(int currentPage) {
		return BoardDAOImpl.getInstance().getPageNavigator(currentPage);
	}

}
