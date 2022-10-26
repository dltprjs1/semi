package com.user.action;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.chall.controller.Action;
import com.chall.controller.ActionForward;
import com.user.model.UserDAO;
import com.user.model.UserDTO;

public class MemberJoinOkAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws IOException, Exception {
		// 회원가입 폼 페이지에서 넘어온 정보를 DB에 추가하고 로그인 페이지로 이동하는 비즈니스 로직.
		
		String member_id = request.getParameter("id").trim();
		String member_pwd = request.getParameter("pwd").trim();
		String member_name = request.getParameter("name").trim();
		int member_birth = Integer.parseInt(request.getParameter("birth").trim());
		String member_gender = request.getParameter("gender").trim();
		String emailId = request.getParameter("email_id").trim();
		String emailDomain = request.getParameter("email_domain").trim();
		String nationNo = request.getParameter("nationNo").trim();
		String phoneNo = request.getParameter("phoneNo").trim();
		String postcode = request.getParameter("postcode").trim();			// 우편번호
		String roadAddress = request.getParameter("roadAddress").trim();		// 도로명주소
		String jibunAddress = request.getParameter("jibunAddress").trim();	// 지번주소
		String extraAddress = request.getParameter("extraAddress").trim(); 	// 주소 참고항목(대략적인 분류)
		
		// 주소 합치기 : [우편번호] 도로명주소/지번주소/상세주소/참고항목(동)
		String  member_addr = "["+postcode+"]"+roadAddress+"/"+jibunAddress+"/"+extraAddress;
		
		// 이메일 합치기
		String member_email = emailId + "@"+ emailDomain;
		
		// 연락처 합치기
		String member_phone = nationNo +")"+ phoneNo;
		
		UserDTO dto = new UserDTO();
		
		dto.setMem_id(member_id);
		dto.setMem_pwd(member_pwd);
		dto.setMem_name(member_name);
		dto.setMem_birth(member_birth);
		dto.setMem_gender(member_gender);
		dto.setMem_email(member_email);
		dto.setMem_phone(member_phone);
		dto.setMem_addr(member_addr);
		
		UserDAO dao = UserDAO.getinstance();
		
		// DB에 회원 정보 추가하는 메소드 호출.
		int check = dao.insertMember(dto);
		
		
		
		
		
		
		
		
		
		return null;
	}

}
