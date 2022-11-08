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

public class MyOngoingChallAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws IOException, Exception {
		// 나의 진행중인 챌린지 목록을 DB로부터 불러와서 뷰페이지로 넘겨주는 비즈니스 로직.
		
		HttpSession session = request.getSession();	
		int member_num = (int) session.getAttribute("memberNum");
		
		MyChallDAO dao = MyChallDAO.getinstance();

		// 현재 페이지에 해당하는 게시물을 가져오는 메소드 호출.
		List<ChallengeDTO> list = dao.getOngoingChallList(member_num);
		
		request.setAttribute("List", list);

		ActionForward forward = new ActionForward();
		
		forward.setRedirect(false);
		
		forward.setPath("member_myOngoingChallOk.do");		
		//forward.setPath("mypage/member_myOngoingChall.jsp");		
		
		return forward;
	}
}
