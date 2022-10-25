package com.category.action;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.category.medel.CategoryDAO;
import com.category.medel.CategoryDTO;
import com.chall.controller.Action;
import com.chall.controller.ActionForward;

public class CategoryModifyAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)throws IOException, Exception {
		
		int category_num = Integer.parseInt(request.getParameter("category_num").trim());
		CategoryDAO dao = CategoryDAO.getInstance();
		CategoryDTO content11 = dao.getCategoryContent(category_num);
		request.setAttribute("content11",content11);
		System.out.println(content11.getCategory_code());
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("category/category_modify.jsp");
		return forward;
	}

}
