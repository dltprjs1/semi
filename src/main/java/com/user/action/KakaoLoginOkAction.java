package com.user.action;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.chall.controller.Action;
import com.chall.controller.ActionForward;
import com.user.model.UserDAO;

public class KakaoLoginOkAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws IOException, Exception {
		// 카카오 로그인 인증 성공 후 인가 코드를 받았음. 그 코드로 엑세스 토큰을 받는 과정.
		// 토큰을 받아야 카카오 사용자 정보를 요청할 수 있음.
		
		// 인가 코드 받아오기.
		String auth_code = request.getParameter("code");
		UserDAO dao = UserDAO.getinstance();
		
		// POST 방식으로 key=value 데이터를 요청(카카오에게).
		
		// 카카오에서 액세스 토큰 받아오는 메소드 호출.
		String access_token = dao.getAccessToken(auth_code);
		
		// 카카오 사용자 정보를 받아오는 메소드 호출
		HashMap<String, Object> kakao_account = dao.getKakaoUserInfo(access_token);
		
		/*
		 * // 나중에 로그인 시 참고 session.setAttribute("userId", userInfo.get("id"));
		 * session.setAttribute("name", userInfo.get("name"));
		 */
		
		System.out.println(kakao_account);
		return null;
	}

}