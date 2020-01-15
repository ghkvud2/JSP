package com.board.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.board.model.bean.BoardBean;
import com.board.util.DBClose;
import com.board.util.DBConnection;
import com.board.util.PageNavigator;

public class BoardDAOImpl implements BoardDAO {

	private static BoardDAOImpl boardDAOImpl;

	static {
		boardDAOImpl = new BoardDAOImpl();
	}

	private BoardDAOImpl() {
	}

	public static BoardDAOImpl getInstance() {
		if (boardDAOImpl == null)
			boardDAOImpl = new BoardDAOImpl();
		return boardDAOImpl;
	}

	@Override
	public void deleteBoard(int num) {

		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = DBConnection.getConnection();
			String sql = "delete from board where num=?";
			pstmt = conn.prepareStatement(sql);
			int idx = 1;
			pstmt.setInt(idx++, num);
			pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBClose.close(conn, pstmt);
		}
	}

	@Override
	public void updateBoard(BoardBean boardBean) {

		Connection conn = null;
		PreparedStatement pstmt = null;

		try {
			conn = DBConnection.getConnection();
			String sql = "update board set subject=?, content=? where num=?";
			pstmt = conn.prepareStatement(sql);
			int idx = 1;
			pstmt.setString(idx++, boardBean.getSubject());
			pstmt.setString(idx++, boardBean.getContent());
			pstmt.setInt(idx++, boardBean.getNum());
			pstmt.executeUpdate();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(conn, pstmt);
		}

	}

	@Override
	public void replyBoard(BoardBean boardBean) {

		Connection conn = null;
		PreparedStatement pstmt = null;

		// 우선적으로 부모 글의 [글 그룹], [글 스텝], [글 레벨] 값을 읽어드린다.
		int ref = boardBean.getRef();
		int re_step = boardBean.getRe_step();
		int re_level = boardBean.getRe_level();

		try {
			conn = DBConnection.getConnection();
			// 부모 글보다 큰 [글 레벨]의 값을 전부 1씩 증가시킨다.
			String levelSQL = "update board set re_level = re_level+1 where ref=? and re_level > ?";
			pstmt = conn.prepareStatement(levelSQL);
			pstmt.setInt(1, ref);
			pstmt.setInt(2, re_level);
			pstmt.executeUpdate();

			String sql = "insert into board values(board_num_seq.nextval,?,?,?,?,sysdate,?,?,?,0,?)";
			pstmt = conn.prepareStatement(sql);
			int idx = 1;
			pstmt.setString(idx++, boardBean.getWriter());
			pstmt.setString(idx++, boardBean.getEmail());
			pstmt.setString(idx++, boardBean.getSubject());
			pstmt.setString(idx++, boardBean.getPassword());
			pstmt.setInt(idx++, boardBean.getRef());
			pstmt.setInt(idx++, boardBean.getRe_step() + 1);
			pstmt.setInt(idx++, boardBean.getRe_level() + 1);
			pstmt.setString(idx++, boardBean.getContent());
			pstmt.executeUpdate();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(conn, pstmt);
		}
	}

	@Override
	public BoardBean getOneBoard(int num) {

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		BoardBean boardBean = new BoardBean();

		try {

			conn = DBConnection.getConnection();
			// 조회수 증가시키는 SQL
			String readSQL = "update board set readcount = readcount+1 where num=?";
			pstmt = conn.prepareStatement(readSQL);
			pstmt.setInt(1, num);
			pstmt.executeUpdate();

			// 게시글 하나 가져오는 SQL
			String sql = "select * from board where num=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			if (rs.next()) {

				boardBean.setNum(rs.getInt("num"));
				boardBean.setWriter(rs.getString("writer"));
				boardBean.setEmail(rs.getString("email"));
				boardBean.setSubject(rs.getString("subject"));
				boardBean.setPassword(rs.getString("password"));
				boardBean.setReg_date(rs.getDate("reg_date").toString());
				boardBean.setRef(rs.getInt("ref"));
				boardBean.setRe_step(rs.getInt("re_step"));
				boardBean.setRe_level(rs.getInt("re_level"));
				boardBean.setReadcount(rs.getInt("readcount"));
				boardBean.setContent(rs.getString("content"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(conn, pstmt, rs);
		}
		return boardBean;

	}

	@Override
	public List<BoardBean> getAllBoard(int startRow, int endRow) {

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<BoardBean> list = new ArrayList<>();

		try {

			String sql = "select B.* " + 
					"from (" + 
					"    select rownum as rnum, A.* " + 
					"    from (" + 
					"        select * " + 
					"        from board" + 
					"        order by ref desc, re_step asc, re_level asc) A " + 
					"    where rownum <= ?) B " + 
					" where B.rnum >= ? ";
			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, endRow);
			pstmt.setInt(2, startRow);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				BoardBean boardBean = new BoardBean();
				boardBean.setNum(rs.getInt("num"));
				boardBean.setWriter(rs.getString("writer"));
				boardBean.setEmail(rs.getString("email"));
				boardBean.setSubject(rs.getString("subject"));
				boardBean.setPassword(rs.getString("password"));
				boardBean.setReg_date(rs.getDate("reg_date").toString());
				boardBean.setRef(rs.getInt("ref"));
				boardBean.setRe_step(rs.getInt("re_step"));
				boardBean.setRe_level(rs.getInt("re_level"));
				boardBean.setReadcount(rs.getInt("readcount"));
				boardBean.setContent(rs.getString("content"));
				list.add(boardBean);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBClose.close(conn, pstmt, rs);
		}
		return list;

	}

	@Override
	public void writeBoard(BoardBean boardBean) {

		int ref = 0; // 글 그룹, 쿼리를 실행해 가장 큰 ref값에 +1을 더해주면 됨
		int re_step = 1; // 새 글은 무조건 1이다.
		int re_level = 1;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {

			// ref 최대값을 가져오기 위한 SQL문 실행
			String refSQL = "select max(ref) from board";
			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(refSQL);
			rs = pstmt.executeQuery();
			if (rs.next())
				ref = rs.getInt(1) + 1;

			// board에 데이터 삽입
			String sql = "insert into board(num, writer, subject, email, password, reg_date, ref, re_step, re_level, readcount, content) ";
			sql += "values (board_num_seq.nextval, ?,?,?,?,sysdate,?,?,?,0,?)";
			pstmt = conn.prepareStatement(sql);

			int idx = 1;
			pstmt.setString(idx++, boardBean.getWriter());
			pstmt.setString(idx++, boardBean.getSubject());
			pstmt.setString(idx++, boardBean.getEmail());
			pstmt.setString(idx++, boardBean.getPassword());
			pstmt.setInt(idx++, ref);
			pstmt.setInt(idx++, re_step);
			pstmt.setInt(idx++, re_level);
			pstmt.setString(idx++, boardBean.getContent());
			pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBClose.close(conn, pstmt, rs);
		}

	}

	@Override
	public PageNavigator getPageNavigator(int currentPage) {

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		PageNavigator pageNavigator = new PageNavigator();
		int totalCount = 0;
		try {
			conn = DBConnection.getConnection();

			String sql = "select count(*) from board";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if (rs.next())
				totalCount = rs.getInt(1);

			pageNavigator.setCurrentPage(currentPage);
			pageNavigator.setTotalCount(totalCount);

		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			DBClose.close(conn, pstmt, rs);
		}
		pageNavigator.makePaging();
		return pageNavigator;
	}

}
