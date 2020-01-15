package com.board.model.service;

import java.util.List;

import com.board.model.bean.BoardBean;
import com.board.util.PageNavigator;

public interface BoardService {

	public void deleteBoard(int num);

	public void updateBoard(BoardBean boardBean);

	public void replyBoard(BoardBean boardBean);

	public void writeBoard(BoardBean boardBean);

	public BoardBean getOneBoard(int num);

	public List<BoardBean> getAllBoard(int startRow, int endRow);

	public PageNavigator getPageNavigator(int currentPage);
}
