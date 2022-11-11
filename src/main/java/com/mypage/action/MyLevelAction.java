package com.mypage.action;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.chall.controller.Action;
import com.chall.controller.ActionForward;
import com.mypage.model.MyChallDAO;
import com.user.model.UserDAO;
import com.user.model.UserDTO;

public class MyLevelAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws IOException, Exception {
		// 해당 회원의 레벨 정보를 가지고 뷰페이지로 이동하는 비즈니스 로직.
		
		HttpSession session = request.getSession();	
		int member_num = (int) session.getAttribute("memberNum");
		
		UserDAO dao = UserDAO.getinstance();
		
		// 회원 정보 불러오는 메소드 호출
		UserDTO dto = dao.getMemberInfo(member_num);
		
		int myXp= dto.getMem_xp();
		
		MyChallDAO myChallDao = MyChallDAO.getinstance();
		
		// 현재 레벨은?
		String myLevel = myChallDao.getPresentLevel(myXp);
		
		// 다음 레벨까지 남은 경험치는?
		int xpToNextLevel = myChallDao.getXpToNextLevel(myLevel,myXp); 
		
		
		request.setAttribute("xpToNextLevel", xpToNextLevel);
		request.setAttribute("myLevel", myLevel);
		request.setAttribute("dto", dto);
		
		ActionForward forward = new ActionForward();
		
		forward.setRedirect(false);
		
		forward.setPath("mypage/member_myLevel.jsp");
		
		return forward;
	}

}
