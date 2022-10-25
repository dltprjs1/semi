package com.user.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.chall.controller.Action;
import com.chall.controller.ActionForward;
import com.chall.model.UserDAO;

public class KakaoLoginOkAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws IOException, Exception {
		// 로그인 폼 페이지에서 카카오 로그인으로 넘어온 사용자 정보를 DB에 회원으로 저장하는 메소드.
		
		String name = request.getParameter("name").trim();
		String email = request.getParameter("email").trim();
		
		UserDAO dao = UserDAO.getinstance();
		
		// 카카오 이메일로 DB에 존재하는 회원인지 확인하는 메소드 호출
		String savedUser = dao.savedUserCheck(email);
		
		ActionForward forward = new ActionForward();
		
		PrintWriter out = response.getWriter();
		
		if (savedUser=="yes") {	// 이미 있는 회원이라면 세션 객체 생성
			
			// 세션 객체 생성
			HttpSession session = request.getSession();	
			
			// 세션 정보 받아오기 
			session.setAttribute("userId",email );	// 카카오가 주는 임시 아이디??로 받아오는 방법 생각해보기
			session.setAttribute("userName", name);

			forward.setRedirect(false);
			
			// 메인 페이지로 이동
			forward.setPath("main.jsp");
			
		}else { // 없는 회원이라면 추가
			
			// 회원가입 메소드 호출 (회원번호,아이디,이름,비번,나이,연락처,주소,가입날짜,이메일)
		
		}
		
		return forward;
	}

}
