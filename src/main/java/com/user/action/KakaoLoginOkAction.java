package com.user.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.chall.controller.Action;
import com.chall.controller.ActionForward;
import com.user.model.UserDAO;

import com.user.model.UserDTO;

public class KakaoLoginOkAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws IOException, Exception {
		// 로그인 폼 페이지에서 카카오 로그인으로 넘어온 사용자 정보를 DB에 회원으로 저장하는 메소드.
		
		String kakaoId = request.getParameter("id").trim();
		String kakaoGender = request.getParameter("gender").trim();
		String kakaoEmail = request.getParameter("email").trim();
		String kakaoBirth = request.getParameter("birth").trim();
		String kakaoImg = request.getParameter("img").trim();
		
		UserDAO dao = UserDAO.getinstance();
		
		System.out.println("카카오 ID >>>"+kakaoId);
		
		// 카카오 이메일로 DB에 존재하는 회원인지 확인하는 메소드 호출
		String savedUser = dao.savedUserCheck(kakaoEmail);
		
		ActionForward forward = new ActionForward();
		
		PrintWriter out = response.getWriter();
		
		// 1. 받아온 사용자 정보(email)가 회원가입 되어 있는지 확인한다.
		if (savedUser=="yes") {	// 2. 챌린지 유저 DB에 email이 이미 있는 회원이라면?
			
			//3. 챌린지 계정과 카카오 계정이 연동되어 있는 지 확인.
			//4. 연동되어 있지 않다면 연동하기.
			
			
			// 세션 객체 생성
			HttpSession session = request.getSession();	
			
			// 세션 정보 받아오기 
			session.setAttribute("userId", kakaoEmail );
			session.setAttribute("userName", kakaoId);

			forward.setRedirect(false);
			
			// 메인 페이지로 이동
			forward.setPath("main.jsp");
			
		}else { // 5. 챌린지 유저 DB에 email이 이미 없는 회원이라면 회원가입.
			
			// dto 객체에 카카오 회원 정보 넣기
			UserDTO dto = new UserDTO();
			
		
			
/*			
			
			// 카카오 회원가입 메소드 호출
			UserDAO dao = UserDAO.getinstance();
			
			dao.insertKakaoMember();
*/			
			
			
		
		}
		
		return forward;
	}

}
