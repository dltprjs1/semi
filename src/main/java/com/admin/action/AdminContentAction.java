package com.admin.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.admin.model.AdminDAO;
import com.admin.model.AdminDTO;
import com.chall.controller.Action;
import com.chall.controller.ActionForward;

public class AdminContentAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String admin_name = request.getParameter("admin_name").trim();
		AdminDAO dao = AdminDAO.getInstance();
		AdminDTO content = dao.getAdminContent(admin_name);
		request.setAttribute("content",content);
		ActionForward forward = new ActionForward();
		PrintWriter out = response.getWriter();
		
		forward.setRedirect(false);
		forward.setPath("admin/admin_checkId.jsp");
		
		return forward;
	}

}
