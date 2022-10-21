package com.admin.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.admin.model.AdminDAO;
import com.admin.model.AdminDTO;
import com.chall.controller.Action;
import com.chall.controller.ActionForward;

public class AdminListAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		AdminDAO dao = AdminDAO.getInstance();
		List<AdminDTO> list = dao.getAdminList();
		request.setAttribute("list",list);
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("admin/admin_find_id.jsp");
		return forward;
	}
}
