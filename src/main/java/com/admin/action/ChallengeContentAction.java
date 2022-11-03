package com.admin.action;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.chall.controller.Action;
import com.chall.controller.ActionForward;
import com.chall.model.ChallengeDAO;
import com.chall.model.ChallengeDTO;

public class ChallengeContentAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)throws IOException, Exception {
		
		int chall_num = Integer.parseInt(request.getParameter("chall_num").trim());
		int page = Integer.parseInt(request.getParameter("page").trim());
		
		ChallengeDAO dao = ChallengeDAO.getinstance();
		ChallengeDTO content = dao.getChallengeContent(chall_num);
		request.setAttribute("content",content);
		request.setAttribute("page",page);
		
		ActionForward forward = new ActionForward();
		
		forward.setRedirect(false);
		forward.setPath("admin/admin_challenge_modify.jsp");
		return forward;
	}
	
}
