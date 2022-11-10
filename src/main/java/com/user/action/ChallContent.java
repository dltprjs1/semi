package com.user.action;

import java.io.IOException;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.chall.controller.Action;
import com.chall.controller.ActionForward;
import com.chall.model.ChallJoinDAO;
import com.chall.model.ChallJoinDTO;
import com.google.gson.annotations.JsonAdapter;
import com.user.model.UserDTO;

import jdk.nashorn.internal.runtime.doubleconv.DtoaBuffer;

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
		
		/*
		 * Cookie ck_title = new Cookie("title", chall_dto.getChall_title()); Cookie
		 * ck_image = new Cookie("image", chall_dto.getChall_mainImage()); Cookie
		 * ck_cycle = new Cookie("cycle", chall_dto.getChall_cycle()); Cookie
		 * ck_duration = new Cookie("duration", chall_dto.getChall_duration());
		 * 
		 * 
		 * 
		 * ck_title.setMaxAge(60*60*24); ck_image.setMaxAge(60*60*24);
		 * ck_cycle.setMaxAge(60*60*24); ck_duration.setMaxAge(60*60*24);
		 * 
		 * response.addCookie(ck_title); response.addCookie(ck_image);
		 * response.addCookie(ck_cycle); response.addCookie(ck_duration);
		 */
		
		return forward;
	}

}
