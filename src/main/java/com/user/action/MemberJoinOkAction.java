package com.user.action;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.chall.controller.Action;
import com.chall.controller.ActionForward;

public class MemberJoinOkAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws IOException, Exception {
		// 회원가입 폼 페이지에서 넘어온 정보를 DB에 추가하고 로그인 페이지로 이동하는 비즈니스 로직.
		
		return null;
	}

}
