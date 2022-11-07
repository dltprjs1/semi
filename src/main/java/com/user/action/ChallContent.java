package com.user.action;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.chall.controller.Action;
import com.chall.controller.ActionForward;
import com.chall.model.ChallJoinDAO;
import com.chall.model.ChallJoinDTO;
import com.user.model.UserDTO;

public class ChallContent implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws IOException, Exception {
		response.setContentType("text/html; charset=UTF-8");
		HttpSession session = request.getSession();
		int chall_num = (Integer) session.getAttribute("chall_num");
		ChallJoinDAO dao = ChallJoinDAO.getInstance();
		ChallJoinDTO chall_dto = dao.getChallContent(chall_num);
		request.setAttribute("challContent", chall_dto);
		
		int createrNum = chall_dto.getChall_creater_num();
		UserDTO user_dto = dao.getMemInfo(createrNum);
		request.setAttribute("userInfo", user_dto);
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("user/member_challContent.jsp");
		return forward;
	}

}
