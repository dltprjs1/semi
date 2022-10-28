package com.FAQ.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.FAQ.model.FAQDAO;
import com.chall.controller.Action;
import com.chall.controller.ActionForward;

public class FAQDeleteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)throws IOException, Exception {
		
		int faq_num = Integer.parseInt(request.getParameter("faq_num").trim());
		int page = Integer.parseInt(request.getParameter("page").trim());
		FAQDAO dao = FAQDAO.getInstance();
		int res = dao.deleteFAQ(faq_num);
		PrintWriter out = response.getWriter();
		ActionForward forward = new ActionForward();
		
		if(res > 0) {
			forward.setRedirect(true);
			forward.setPath("FAQ_control.do?page="+page);
		}else {
			out.println("<script>");
			out.println("alert('삭제 실패!')");
			out.println("history.back()");
			out.println("</script>");
		}
		return forward;
	}
}
