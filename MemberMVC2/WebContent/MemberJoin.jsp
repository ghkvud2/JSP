<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<h2 align="center">회원 가입</h2>
	<form action="MemberJoinProc.do" method="post">
		<table align="center" width="500" border="1">
			<tr height="50">
				<td width="150" align="center">아이디</td>
				<td width="350" align="center"><input type="text" name="id"
					size="40"></td>
			</tr>
			<tr height="50">
				<td width="150" align="center">패스워드</td>
				<td width="350" align="center"><input type="password"
					name="pass1" size="40"></td>
			</tr>
			<tr height="50">
				<td width="150" align="center">패스워드 확인</td>
				<td width="350" align="center"><input type="password"
					name="pass2" size="40"></td>
			</tr>
			<tr height="50">
				<td width="150" align="center">이메일</td>
				<td width="350" align="center"><input type="email" name="email"
					size="40"></td>
			</tr>
			<tr height="50">
				<td width="150" align="center">전화번호</td>
				<td width="350" align="center"><input type="tel" name="tel"
					size="40"></td>
			</tr>
			<tr height="50">
				<td width="150" align="center">당신의 관심분야</td>
				<td width="350" align="center"><input type="checkbox"
					name="hobby" value="골프">골프 &nbsp; &nbsp; <input
					type="checkbox" name="hobby" value="등산">등산 &nbsp; &nbsp; <input
					type="checkbox" name="hobby" value="조깅">조깅 &nbsp; &nbsp; <input
					type="checkbox" name="hobby" value="낚시">낚시 &nbsp; &nbsp;</td>
			</tr>
			<tr height="50">
				<td width="150" align="center">당신의 직업은</td>
				<td width="350" align="center"><select name="job">
						<option values="교사">교사</option>
						<option values="변호사">변호사</option>
						<option values="회사원">회사원</option>
				</select></td>
			</tr>
			<tr height="50">
				<td width="150" align="center">당신의 연령은</td>
				<td width="350" align="center"><input type="radio" name="age"
					value="10">10대 &nbsp; &nbsp; <input type="radio" name="age"
					value="20">20대 &nbsp; &nbsp; <input type="radio" name="age"
					value="30">30대 &nbsp; &nbsp; <input type="radio" name="age"
					value="40">40대 &nbsp; &nbsp;</td>
			</tr>
			<tr height="50">
				<td width="150" align="center">하고 싶은 말</td>
				<td width="350" align="center"><textarea rows="5" cols="40"
						name="info"></textarea></td>
			</tr>
			<tr height="50">
				<td colspan="2" align="center"><input type="submit"
					value="회원 가입"> <input type="reset" value="취소"></td>
			</tr>
		</table>
	</form>
</body>
</html>