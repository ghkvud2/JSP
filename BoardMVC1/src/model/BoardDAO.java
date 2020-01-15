package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class BoardDAO {

	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	// DBCP 사용하는 메소드
	public void getConnection() {

		try {
			Context initCtx = new InitialContext();
			Context envCtx = (Context) initCtx.lookup("java:comp/env");
			DataSource dataSource = (DataSource) envCtx.lookup("jdbc/pool");
			conn = dataSource.getConnection();

		} catch (NamingException | SQLException e) {
			e.printStackTrace();
		}
	}

	public int getAllCount() {

		getConnection();
		int count = 0;
		try {
			String sql = "select count(*) from board";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if (rs.next())
				count = rs.getInt(1);
			rs.close();
			pstmt.close();
			conn.close();

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return count;
	}

	public void deleteBoard(int num) {

		getConnection();
		try {
			String sql = "delete from board where num=?";
			pstmt = conn.prepareStatement(sql);
			int idx = 1;
			pstmt.setInt(idx++, num);

			pstmt.executeUpdate();
			pstmt.close();
			conn.close();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public void updateBoard(BoardBean boardBean) {

		getConnection();

		try {
			String sql = "update board set subject=?, content=? where num=?";
			pstmt = conn.prepareStatement(sql);
			int idx = 1;
			pstmt.setString(idx++, boardBean.getSubject());
			pstmt.setString(idx++, boardBean.getContent());
			pstmt.setInt(idx++, boardBean.getNum());

			pstmt.executeUpdate();
			pstmt.close();
			conn.close();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	// 답변 게시글을 저장하는 메소드
	public void replyBoard(BoardBean boardBean) {

		// 우선적으로 부모 글의 [글 그룹], [글 스텝], [글 레벨] 값을 읽어드린다.
		int ref = boardBean.getRef();
		int re_step = boardBean.getRe_step();
		int re_level = boardBean.getRe_level();

		getConnection();

		try {

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

			pstmt.close();
			conn.close();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	// 하나의 게시글을 select하는 메소드
	public BoardBean getOneBoard(int num) {

		BoardBean boardBean = new BoardBean();
		getConnection();
		try {

			// 조회수 증가시키는 SQL
			String readSQL = "update board set readcount = readcount+1 where num=?";
			pstmt = conn.prepareStatement(readSQL);
			pstmt.setInt(1, num);
			pstmt.executeUpdate();
			pstmt.close();
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
			pstmt.close();
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return boardBean;
	}


	public List<BoardBean> getAllBoard(int startRow, int endRow) {
		
		getConnection();
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
			pstmt.close();
			conn.close();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

	// 새로운 글 DB에 저장하기
	public void insertBoard(BoardBean boardBean) {

		int ref = 0; // 글 그룹, 쿼리를 실행해 가장 큰 ref값에 +1을 더해주면 됨
		int re_step = 1; // 새 글은 무조건 1이다.
		int re_level = 1;

		getConnection();

		try {

			// ref 최대값을 가져오기 위한 SQL문 실행
			String refSQL = "select max(ref) from board";
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
			pstmt.close();
			conn.close();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

}
