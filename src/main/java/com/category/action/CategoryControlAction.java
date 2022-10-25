package com.category.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.category.medel.CategoryDAO;
import com.category.medel.CategoryDTO;
import com.chall.controller.Action;
import com.chall.controller.ActionForward;

public class CategoryControlAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)throws IOException, Exception {
		
		CategoryDAO dao = CategoryDAO.getInstance();
		List<CategoryDTO> list = dao.getCategoryList();
		request.setAttribute("list",list);
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("category/category_List.jsp");
		return forward;
	}

}
