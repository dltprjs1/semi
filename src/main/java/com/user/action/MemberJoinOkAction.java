package com.user.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDate;

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
		String member_img = request.getParameter("main_img").trim();
		String member_birth = request.getParameter("birth").trim();
		String member_gender = request.getParameter("gender").trim();
		String emailId = request.getParameter("email_id").trim();
		String emailDomain = request.getParameter("email_domain").trim();
		String nationNo = request.getParameter("nationNo").trim();
		String phoneNo = request.getParameter("phoneNo").trim();
		int postcode = Integer.parseInt(request.getParameter("postcode").trim());	// 우편번호
		String roadAddress = request.getParameter("roadAddress").trim();		// 도로명주소
		String jibunAddress = request.getParameter("jibunAddress").trim();	// 지번주소
		String detailAddress = request.getParameter("detailAddress").trim();	// 상세주소
		String extraAddress = request.getParameter("extraAddress").trim(); 	// 주소 참고항목(대략적인 분류)
		
		// 주소 합치기 : [우편번호] 도로명주소/지번주소/상세주소/참고항목(동)
		String  member_addr = "["+postcode+"]"+roadAddress+"/"+jibunAddress+"/"+detailAddress+"/"+extraAddress;
		
		// 이메일 합치기
		String member_email = emailId + "@"+ emailDomain;
		
		// 연락처 합치기
		String member_phone = nationNo +")"+ phoneNo;
		
		// 생년월일로 나이 구하기
        // 1. 현재 날짜 구하기 (시스템 시계, 시스템 타임존)        
		LocalDate now = LocalDate.now();
		int year = now.getYear();
		// 2. 회원 생년 구하기		
		int memBirthYear = Integer.parseInt(member_birth.substring(0, 4));
		
		// 3. 현재 년도 - 회원 생년 +1 = 회원 나이 
		int member_age = year - memBirthYear + 1;
				
		System.out.println("회원 생년 >>> " + memBirthYear);
		System.out.println("회원 나이 >>> " + member_age);
		
		UserDTO dto = new UserDTO();
		
		dto.setMem_id(member_id);
		dto.setMem_pwd(member_pwd);
		dto.setMem_name(member_name);
		dto.setMem_img(member_img);
		dto.setMem_birth(member_birth);
		dto.setMem_gender(member_gender);
		dto.setMem_age(member_age);
		
		dto.setMem_email(member_email);
		dto.setEmailId(emailId);
		dto.setEmailDomain(emailDomain);
		
		dto.setMem_phone(member_phone);
		dto.setNationNo(nationNo);
		dto.setPhoneNo(phoneNo);
		
		dto.setMem_addr(member_addr);
		dto.setPostcode(postcode);
		dto.setRoadAddress(roadAddress);
		dto.setJibunAddress(jibunAddress);
		dto.setDetailAddress(detailAddress);
		dto.setExtraAddress(extraAddress);
		
		UserDAO dao = UserDAO.getinstance();
		
		// DB에 회원 정보 추가하는 메소드 호출.
		int check = dao.insertMember(dto);
		
		PrintWriter out = response.getWriter();
		
		ActionForward forward = new ActionForward();
		
		if(check > 0) {
			
		  //out.println("<script>"); 
		  //out.println("location.href='member_login.do'");
		  //out.println("</script>");
			
			 forward.setRedirect(false);
			 
			 forward.setPath("user/member_login.jsp");
		
		}else {
			out.println("<script>");
			out.println("alert('회원 가입 실패')");
			out.println("history.back()");
			out.println("</script>");
		}
		
		return forward;
	}

}
