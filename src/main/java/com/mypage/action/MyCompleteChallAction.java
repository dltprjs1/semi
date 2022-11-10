package com.mypage.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.chall.controller.Action;
import com.chall.controller.ActionForward;
import com.chall.model.ChallengeDTO;
import com.mypage.model.MyChallDAO;

public class MyCompleteChallAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws IOException, Exception {
		// 참가했던 챌리지 중 챌린지 상태가 '완료'인 챌린지 목록을 DB로부터 불러와서 뷰페이지로 넘겨주는 비즈니스 로직.
		
		HttpSession session = request.getSession();	
		int member_num = (int) session.getAttribute("memberNum");
		
		MyChallDAO dao = MyChallDAO.getinstance();
		
		// 해당 회원이 참가했던, 챌린지 상태가 '완료'인 챌린지 목록을 반환하는 메소드 호출.
		List<ChallengeDTO> list = dao.getCompelteChallList(member_num);		
		
		return null;
	}

}
