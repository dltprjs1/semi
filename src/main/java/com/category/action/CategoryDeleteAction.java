package com.category.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.category.medel.CategoryDAO;
import com.chall.controller.Action;
import com.chall.controller.ActionForward;

public class CategoryDeleteAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)throws IOException, Exception {
		
		int category_num = Integer.parseInt(request.getParameter("category_num").trim());
		CategoryDAO dao = CategoryDAO.getInstance();
		int res = dao.deletecategory(category_num);
		ActionForward forward = new ActionForward();
		PrintWriter out = response.getWriter();
		if(res > 0) {
			forward.setRedirect(true);
			forward.setPath("category_control.do");
		}else {
			out.println("<script>");
			out.println("alert('삭제 실패!')");
			out.println("history.back()");
			out.println("</script>");
		}
		return forward;
	}
}
