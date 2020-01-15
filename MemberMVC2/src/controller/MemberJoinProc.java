package controller;

import java.io.IOException;
import java.util.Arrays;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.MemberBean;
import model.MemberDAO;

@WebServlet("/MemberJoinProc.do")
public class MemberJoinProc extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		MemberBean memberBean = new MemberBean();
		memberBean.setId(request.getParameter("id"));
		memberBean.setPass1(request.getParameter("pass1"));
		memberBean.setPass2(request.getParameter("pass2"));
		memberBean.setEmail(request.getParameter("email"));
		memberBean.setTel(request.getParameter("tel"));
		memberBean.setInfo(request.getParameter("info"));
		memberBean.setAge(request.getParameter("age"));
		memberBean.setJob(request.getParameter("job"));
		String[] hobby = request.getParameterValues("hobby");
		memberBean.setHobby(Arrays.toString(hobby));

		String pass1 = request.getParameter("pass1");
		String pass2 = request.getParameter("pass2");
		if (pass1.equals(pass2)) {
			MemberDAO memberDAO = new MemberDAO();
			memberDAO.insertMember(memberBean);
			RequestDispatcher disp = request.getRequestDispatcher("MemberListProc.do");
			disp.forward(request, response);
		} else {
			request.setAttribute("msg", "패스워드가 일치하지 않습니다.");
			RequestDispatcher disp = request.getRequestDispatcher("LoginError.jsp");
			disp.forward(request, response);
		}
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("EUC-KR");
		doGet(request, response);
	}
}
