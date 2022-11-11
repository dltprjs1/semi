package com.cs.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.chall.controller.Action;
import com.chall.controller.ActionForward;
import com.cs.model.CScenterDAO;

public class CSPrivateQListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws IOException, Exception {
		
		int pq_user_no = Integer.parseInt(request.getParameter("pq_user_no").trim());
    	System.out.println("CS_pq_list.jsp에서 넘겨준 session 정보 >>> 유저 번호: " +pq_user_no);
    	int page = Integer.parseInt(request.getParameter("page").trim());
    	System.out.println("CS_pq_list에서 넘겨준 page 정보 >>> " + page);
    	int rowsize = Integer.parseInt(request.getParameter("rowsize").trim());
    	System.out.println("CS_pq_list에서 넘겨준 rowsize 정보 >>> "+rowsize);
    	int block = Integer.parseInt(request.getParameter("block").trim());
    	System.out.println("CS_pq_list에서 넘겨준 block 정보 >>> "+block);
    	
		CScenterDAO dao = CScenterDAO.getinstance();
		int totalRecord = dao.getPQCount(pq_user_no);

		int allPage = (int)Math.ceil(totalRecord / (double)rowsize);
		System.out.println("allPage값"+allPage);
		int startBlock = (((page -1 ) / block) * block + 1);
		System.out.println("startBlock값"+startBlock);
		int endBlock = (((page -1 ) / block) * block + block);
		if (endBlock > allPage) {
			endBlock = allPage;
		}
		System.out.println("endBlock값"+endBlock);
    	
    	// getPagedPQList 메서드 완성 후 메서드 교체
    	String str = dao.getPagedPQList(page, rowsize, pq_user_no);
    
    	str +="<allPage>"+allPage+"</allPage>";
    	str +="<startBlock>"+startBlock+"</startBlock>";
    	str +="<endBlock>"+endBlock+"</endBlock>";
    	
    	str += "</PQNAs>";
    	
    	System.out.println(str);
    	
    	PrintWriter out = response.getWriter();
    	out.println(str);
    		
		return null;
	} 

}

