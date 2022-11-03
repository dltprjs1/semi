package com.FAQ.action;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.FAQ.model.FAQDAO;
import com.FAQ.model.FAQDTO;
import com.chall.controller.Action;
import com.chall.controller.ActionForward;

public class FAQModifyAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)throws IOException, Exception {
		
		int faq_num = Integer.parseInt(request.getParameter("faq_num").trim());
		FAQDAO dao = FAQDAO.getInstance();
		FAQDTO dto = dao.getFAQContent(faq_num);
		request.setAttribute("dto",dto);
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("FAQ/FAQ_update.jsp");
		return forward;
	}

}
