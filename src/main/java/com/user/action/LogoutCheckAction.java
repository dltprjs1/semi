package com.user.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.chall.controller.Action;
import com.chall.controller.ActionForward;
import com.user.model.UserDAO;
import com.user.model.UserDTO;

public class LogoutCheckAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// 로그아웃이라는 글자를 클릭하면 현재의 모든 정보(session)를 종료시켜주는 비즈니스 로직.
		
		HttpSession session = request.getSession();
		
		ActionForward forward = new ActionForward();
		
		// 현재 세션 사용중인 회원 번호 받아오기.
		int member_num = (int)session.getAttribute("memberNum");
		
		System.out.println("로그아웃 회원번호 >>> " + member_num);
		
		UserDAO dao = UserDAO.getinstance();
		
		UserDTO dto = dao.getMemberInfo(member_num);
		String kakaoAccount = dto.getKakaoAccount();
		
		System.out.println("현재 로그인 된 회원의 카카오 계정 연동 여부 : "+kakaoAccount);
		// 카카오로 로그인한 회원은 카카오 로그인 API에 따라 로그아웃 처리.
		if(kakaoAccount.equals("YES")) {	// 카카오 로그인한 회원인 경우
			
			// 카카오에서 받은 액세스 토큰 세션으로 가져오기.
			String access_token2 = request.getParameter("access_token");
			System.out.println("로그아웃할 때 getParameter로 받은 액세스 토큰 : "+access_token2);
			
			// 카카오 로그아웃하는 메소드 호출.
			dao.logoutWithKakao((String)session.getAttribute("access_token"));
			System.out.println("로그아웃할 때 세션으로 받은 액세스 토큰 : "+ (String)session.getAttribute("access_token"));
			session.invalidate();
			
			forward.setRedirect(false);
			forward.setPath("main.jsp");
						
		}else {	// 일반 회원인 경우
			
			// 현재 사용중인 모든 세션을 종료시키는 메소드.
			session.invalidate();
			
			forward.setRedirect(false);
			
			forward.setPath("main.jsp");
		}
		
		return forward;		
	}
}