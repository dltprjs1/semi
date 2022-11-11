package com.review.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.chall.controller.Action;
import com.chall.controller.ActionForward;
import com.review.model.ReviewDAO;

public class ReviewInsertAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws IOException, Exception {
		int review_mem_num = Integer.parseInt(request.getParameter("mem_num").trim());
		int review_chall_num = Integer.parseInt(request.getParameter("review_chall_num").trim());
		int review_star = Integer.parseInt(request.getParameter("review_star").trim());
		String review_content = request.getParameter("review_content");
		
		ReviewDAO dao = ReviewDAO.getinstance();
		int result = dao.reviewInsert(review_mem_num, review_chall_num, review_star, review_content);
		
		PrintWriter out = response.getWriter();
		
		out.println(result);
		
		return null;
	}

}
