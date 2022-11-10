package com.user.action;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.chall.controller.Action;
import com.chall.controller.ActionForward;
import com.chall.model.ChallJoinDAO;
import com.chall.model.ChallJoinDTO;
import com.chall.model.ChallProofDAO;
import com.user.model.UserDTO;

public class ChallContent implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws IOException, Exception {
		response.setContentType("text/html; charset=UTF-8");
		HttpSession session = request.getSession();
		
		// 챌린지 정보 받아오기
		int chall_num = (Integer) session.getAttribute("chall_num");
		ChallJoinDAO join_dao = ChallJoinDAO.getInstance();
		ChallJoinDTO chall_dto = join_dao.getChallContent(chall_num);
		request.setAttribute("challContent", chall_dto);
		
		// 개설자 정보 받아오기
		int createrNum = chall_dto.getChall_creater_num();
		UserDTO user_dto = join_dao.getMemInfo(createrNum);
		request.setAttribute("userInfo", user_dto);
		
		// 참가 여부 정보 받아오기(챌린지 상세페이지 들어갔을 때 참가한 챌린지인지 체크)
		int mem_num = (Integer) session.getAttribute("memberNum");
		ChallProofDAO proof_dao = ChallProofDAO.getInstance();
		int checkJoin = proof_dao.checkJoin(chall_num, mem_num);
		request.setAttribute("checkJoin", checkJoin);	// 1-정보있음(버튼:'참가완료') / 2-정보없음(버튼:'참가하기')
		System.out.println("checkJoin >>> "+checkJoin);
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("user/member_challContent.jsp");
		return forward;
	}

}
