package com.review.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.chall.controller.Action;
import com.chall.controller.ActionForward;
import com.review.model.ReviewDAO;

public class ReviewGetChallAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws IOException, Exception {
		
		ReviewDAO dao = ReviewDAO.getinstance();
		String str = "";
		String keyword = request.getParameter("keyword").trim();
		System.out.println("키워드 >>> "+keyword);
		if (keyword.equals("null")) {
			str = dao.getChall();
		}else {
			str = dao.getChall(keyword);
		}
		
		System.out.println("getChall 결과 >>> "+ str);
		PrintWriter out = response.getWriter();
		out.println(str);
		
		/*
		 * ActionForward forward = new ActionForward();
		 * forward.setPath("review/review_getChall.jsp"); forward.setRedirect(false);
		 * 
		 * return forward;
		 */
		return null;
	}

}
