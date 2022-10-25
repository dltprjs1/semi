package com.question.action;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.chall.controller.Action;
import com.chall.controller.ActionForward;
import com.chall.model.UserDAO;
import com.chall.model.UserDTO;
import com.question.model.QuestionDAO;
import com.question.model.QuestionDTO;

public class QuestionContentAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)throws IOException, Exception {
		
		int p_q_num = Integer.parseInt(request.getParameter("p_q_num").trim());
		QuestionDAO dao = QuestionDAO.getInstance();
		QuestionDTO content = dao.getQuestionContent(p_q_num);
		
		request.setAttribute("content",content);
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("question/question_content.jsp");
		return forward;
	}

}
