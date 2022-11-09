package com.user.action;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.user.model.UserDAO;

@WebServlet("/joinCheckId.do")
public class JoinCheckId extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public JoinCheckId() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 아이디 중복 검사
		// 회원가입 (member_join.jsp) 폼페이지에서 ajax로 넘어온 아이디가 DB 회원 테이블에 존재하면 1, 존재하지 않으면 0을 응답하는 비즈니스 로직.
		
		String id = request.getParameter("id").trim();
		
		UserDAO dao = UserDAO.getinstance();
		
		int count = dao.joinCheckId(id);
		
		
        Map<String, Integer> map = new HashMap<>();
        
        map.put("count", count);
        
        JSONObject jsonObj = new JSONObject(map);

        response.getWriter().print(jsonObj.toString());		
		
		
	}

}
