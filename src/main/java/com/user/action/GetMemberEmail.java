package com.user.action;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.json.JSONParser;
import org.json.simple.JSONObject;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.user.model.UserDAO;

@WebServlet("/getMemberEmail.do")
public class GetMemberEmail extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public GetMemberEmail() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 비밀번호 찾기 페이지2(member_fidPwd_2.jsp) 폼페이지에서 ajax로 넘어온 아이디가 
		// DB 회원 테이블에 존재하면 해당 회원의 이메일 주소를 넘겨주는 비즈니스 로직. 
	    
			String id = request.getParameter("mem_id").trim();
			
			UserDAO dao = UserDAO.getinstance();
			
			// user_member 테이블에서 해당 id를 가진 해당 사용자의 이메일 주소를 가져오는 메소드 호출.
			String mem_email = dao.getMemberEmail(id);
			
	        Map<String, String> map = new HashMap<>();
	        map.put("mem_email", mem_email);
	        
	        JSONObject jsonObj = new JSONObject(map);

	        response.getWriter().print(jsonObj.toString());
	}
}