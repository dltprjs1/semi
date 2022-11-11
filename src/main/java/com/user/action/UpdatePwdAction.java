package com.user.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.chall.controller.Action;
import com.chall.controller.ActionForward;
import com.user.model.UserDAO;

public class UpdatePwdAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws IOException, Exception {
		// 비밀번호 재설정 페이지에서 넘어온 비밀번호로 user_member 테이블의 해당 회원 비밀번호를 수정하는 비즈니스 로직.
		
		String mem_email = request.getParameter("mem_email").trim();
		String rePwd = request.getParameter("rePwd").trim();
		
		UserDAO dao = UserDAO.getinstance();
		
		// 해당 이메일 정보를 가진 회원의 비밀번호를 수정하는 메소드 호출.
		int check = dao.updatePwd(mem_email, rePwd);
		
		PrintWriter out = response.getWriter();
		
		ActionForward forward = new ActionForward();
		
		if(check > 0) {
			 forward.setRedirect(false);
			 forward.setPath("user/member_login.jsp");			
		}else {
			out.println("<script>");
			out.println("alert('비밀번호 재설정 실패')");
			out.println("history.back()");
			out.println("</script>");			
		}
		
		return forward;
	}

}
