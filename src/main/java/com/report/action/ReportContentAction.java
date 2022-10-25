package com.report.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.chall.controller.Action;
import com.chall.controller.ActionForward;
import com.report.model.ReportDAO;
import com.report.model.ReportDTO;

public class ReportContentAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)throws IOException, Exception {
		
		String mem_id = request.getParameter("mem_id").trim();
		System.out.println(mem_id);
		ReportDAO dao = ReportDAO.getInstance();
		List<ReportDTO> list = dao.getReportContent(mem_id);
		request.setAttribute("list",list);
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("report/report_content.jsp");
		return forward;
	}

}
