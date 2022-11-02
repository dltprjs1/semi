package com.FAQ.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.FAQ.model.FAQDAO;
import com.FAQ.model.FAQDTO;
import com.chall.controller.Action;
import com.chall.controller.ActionForward;

public class FAQUpdateAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)throws IOException, Exception {
		
		int faq_num = Integer.parseInt(request.getParameter("faq_num").trim());
		String faq_title = request.getParameter("faq_title").trim();
		String faq_content = request.getParameter("faq_content").trim();
		int faq_category_num = Integer.parseInt(request.getParameter("faq_category_num").trim());
		int page = Integer.parseInt(request.getParameter("page").trim());
		FAQDTO dto = new FAQDTO();
		
		dto.setFaq_num(faq_num);
		dto.setFaq_title(faq_title);
		dto.setFaq_content(faq_content);
		dto.setFaq_category_num(faq_category_num);
		
		FAQDAO dao = FAQDAO.getInstance();
		
		int res = dao.updateFAQ(dto);
		PrintWriter out = response.getWriter();
		ActionForward forward = new ActionForward();
		if(res > 0) {
			forward.setRedirect(true);
			forward.setPath("FAQ_control.do?faq_num="+faq_num+"&page="+page);
		}else {
			out.println("<script>");
			out.println("alert('수정 실패!')");
			out.println("history.back()");
			out.println("</script>");
		}
		return forward;
	}
}
