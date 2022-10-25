package com.user.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.chall.controller.Action;
import com.chall.controller.ActionForward;
import com.chall.model.ChallCategoryDAO;
import com.chall.model.ChallCategoryDTO;

public class GetCategoryAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws IOException, Exception {
		
		ChallCategoryDAO dao = ChallCategoryDAO.getinstance();
		List<ChallCategoryDTO> list = dao.getCategoryList();
		request.setAttribute("categoryList", list);
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("user/member_challJoin_5.jsp");
		
		return forward;
	}

}
