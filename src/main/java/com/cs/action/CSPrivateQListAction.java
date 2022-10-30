package com.cs.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.chall.controller.Action;
import com.chall.controller.ActionForward;
import com.cs.model.CScenterDAO;

public class CSPrivateQListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws IOException, Exception {
		
		int pq_user_no = Integer.parseInt(request.getParameter("pq_user_no").trim());
    	System.out.println(pq_user_no);
    
    	CScenterDAO dao = CScenterDAO.getinstance();
    	String str = dao.getPQList(pq_user_no);
    	System.out.println(str);
    	
    	PrintWriter out = response.getWriter();
    	out.println(str);
    			
		return null;
	}

}