package com.user.action;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.chall.controller.Action;
import com.chall.controller.ActionForward;
import com.google.gson.JsonObject;
import com.user.model.UserDAO;


public class IdCheckAction implements Action{
	
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws IOException, Exception {
		
	// 비밀번호 찾기 페이지1(member_fidPwd.jsp) 폼페이지에서 ajax로 넘어온 아이디가 
	// DB 회원 테이블에 존재하는 지 중복 여부를 체크하는 비즈니스 로직. 

		String id = request.getParameter("id").trim();;
		
		System.out.println("ajax로 받은 id 값 : "+id);
		
		
		//UserDAO dao = UserDAO.getinstance();
		
		
		//dao.checkId();
		
		return null;
	}

}
