package com.category.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.category.medel.CategoryDAO;
import com.category.medel.CategoryDTO;
import com.category.medel.SubDTO;
import com.chall.controller.Action;
import com.chall.controller.ActionForward;

public class CategoryModifyAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)throws IOException, Exception {
		
		int category_num = Integer.parseInt(request.getParameter("category_num").trim());
		CategoryDAO dao = CategoryDAO.getInstance();
		CategoryDTO content11 = dao.getCategoryContent(category_num);
		List<SubDTO> list = dao.getsub_list(category_num);
		request.setAttribute("content11",content11);
		request.setAttribute("list",list);
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("category/category_modify.jsp");
		return forward;
	}

}
