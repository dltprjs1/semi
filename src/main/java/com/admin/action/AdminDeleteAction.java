package com.admin.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.admin.model.AdminDAO;
import com.chall.controller.Action;
import com.chall.controller.ActionForward;

public class AdminDeleteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)throws IOException, Exception {
		
		int mem_num = Integer.parseInt(request.getParameter("mem_num").trim());
		int page = Integer.parseInt(request.getParameter("page").trim());
		AdminDAO dao = AdminDAO.getInstance();
		int res = dao.deleteMember(mem_num);
		ActionForward forward = new ActionForward();
		PrintWriter out = response.getWriter();
		if(res > 0) {
			forward.setRedirect(true);
			forward.setPath("admin_control.do");
		}else {
			out.println("<script>");
			out.println("alert('삭제 실패!')");
			out.println("history.back()");
			out.println("</script>");
		}
		return forward;
	}
}
