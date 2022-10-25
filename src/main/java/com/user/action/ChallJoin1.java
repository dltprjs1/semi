package com.user.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/challjoin1.do")
public class ChallJoin1 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ChallJoin1() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		response.setContentType("text/html; charset=UTF-8");
		
		PrintWriter out = response.getWriter();
		
		int user_no = 
			Integer.parseInt(request.getParameter("no").trim());
		
		int res = dao.deleteCustomer(user_no);
		
		out.println(res);
	}

}
