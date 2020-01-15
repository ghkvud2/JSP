/* 게시판 */
CREATE TABLE board (
	num NUMBER, /* 글번호 */
	writer VARCHAR2(50), /* 글쓴이 */
	email VARCHAR2(50), /* 이메일 */
	subject VARCHAR2(100), /* 글제목 */
	password VARCHAR2(15), /* 비밀번호 */
	reg_date DATE, /* 작성날짜 */
	ref NUMBER, /* 글그룹 */
	re_step NUMBER, /* 글스텝 */
	re_level NUMBER, /* 글레벨 */
	readcount NUMBER, /* 조회수 */
	content CLOB /* 글내용 */
);

CREATE SEQUENCE board_num_seq START WITH 1 INCREMENT BY 1;

COMMENT ON TABLE board IS '게시판';

COMMENT ON COLUMN board.num IS '글번호';

COMMENT ON COLUMN board.writer IS '글쓴이';

COMMENT ON COLUMN board.email IS '이메일';

COMMENT ON COLUMN board.subject IS '글제목';

COMMENT ON COLUMN board.password IS '비밀번호';

COMMENT ON COLUMN board.reg_date IS '작성날짜';

COMMENT ON COLUMN board.ref IS '글그룹';

COMMENT ON COLUMN board.re_step IS '글스텝';

COMMENT ON COLUMN board.re_level IS '글레벨';

COMMENT ON COLUMN board.readcount IS '조회수';

COMMENT ON COLUMN board.content IS '글내용';