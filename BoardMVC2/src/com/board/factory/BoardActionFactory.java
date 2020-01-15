package com.board.factory;

import com.board.action.Action;
import com.board.action.BoardDeleteAction;
import com.board.action.BoardInfoAction;
import com.board.action.BoardListAction;
import com.board.action.BoardReplyAction;
import com.board.action.BoardUpdateAction;
import com.board.action.BoardWriteAction;

public class BoardActionFactory {

	private static Action boardDeleteAction;
	private static Action boardInfoAction;
	private static Action boardListAction;
	private static Action boardReplyAction;
	private static Action boardUpdateAction;
	private static Action boardWriteAction;

	static {
		boardDeleteAction = BoardDeleteAction.getInstance();
		boardInfoAction = BoardInfoAction.getInstance();
		boardListAction = BoardListAction.getInstance();
		boardReplyAction = BoardReplyAction.getInstance();
		boardUpdateAction = BoardUpdateAction.getInstance();
		boardWriteAction = BoardWriteAction.getInstance();
	}

	public static Action getBoardDeleteAction() {
		return boardDeleteAction;
	}

	public static Action getBoardInfoAction() {
		return boardInfoAction;
	}

	public static Action getBoardListAction() {
		return boardListAction;
	}

	public static Action getBoardReplyAction() {
		return boardReplyAction;
	}

	public static Action getBoardUpdateAction() {
		return boardUpdateAction;
	}

	public static Action getBoardWriteAction() {
		return boardWriteAction;
	}

}
