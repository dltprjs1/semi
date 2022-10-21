package com.admin.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.admin.model.AdminDAO;
import com.admin.model.AdminDTO;
import com.chall.controller.Action;
import com.chall.controller.ActionForward;

public class AdminFindPwdAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)throws IOException, Exception {
		String admin_name = request.getParameter("admin_name").trim();
		String admin_id = request.getParameter("admin_id").trim();
		AdminDAO dao = AdminDAO.getInstance();
		
		StringBuffer temp = new StringBuffer();
		Random rnd = new Random();
		for (int i = 0; i < 10; i++) {
			int rIndex = rnd.nextInt(3);
			switch (rIndex) {
			case 0:
				// a-z
				temp.append((char) ((int) (rnd.nextInt(26)) + 97));
				break;
			case 1:
				// A-Z
				temp.append((char) ((int) (rnd.nextInt(26)) + 65));
				break;
			case 2:
				// 0-9
				temp.append((rnd.nextInt(10)));
				break;
			}
		}
		String key = temp.toString();
		System.out.println(key);
		ActionForward forward = new ActionForward();
		int res = dao.makingpwd(admin_name,admin_id,key);
		PrintWriter out = response.getWriter();
		if(res > 0) {
			AdminDTO content = dao.getAdminContent(admin_name);
			request.setAttribute("key", key);
			request.setAttribute("content",content);
			forward.setRedirect(false);
			forward.setPath("admin/admin_sending_pwd.jsp");
		}else if(res == -1) {
			out.println("<script>");
			out.println("alert('존재하지 않는 아이디입니다.')");
			out.println("history.back()");
			out.println("</script>");
		}else {
			out.println("<script>");
			out.println("alert('아이디와 이름이 일치하지 않습니다.')");
			out.println("history.back()");
			out.println("</script>");
		}
		return forward;
	}

}
