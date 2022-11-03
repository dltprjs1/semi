package com.user.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.chall.controller.Action;
import com.chall.controller.ActionForward;
import com.question.model.QuestionDAO;
import com.question.model.QuestionDTO;
import com.user.model.UserDAO;
import com.user.model.UserDTO;

public class KakaoLoginOkAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws IOException, Exception {
		// 카카오 로그인 인증 성공 후 인가 코드를 받았음. 그 코드로 엑세스 토큰을 받는 과정.
		// 토큰을 받아야 카카오 사용자 정보를 요청할 수 있음.
		
		// 인가 코드 받아오기.
		String auth_code = request.getParameter("code");
		UserDAO dao = UserDAO.getinstance();
		
		// POST 방식으로 key=value 데이터를 요청(카카오에게).
		
		// 카카오에서 액세스 토큰 받아오는 메소드 호출.
		String access_token = dao.getAccessToken(auth_code);
		System.out.println("로그인 시 access_token : " + access_token);
		
		// 카카오 사용자 정보를 받아오는 메소드 호출
		HashMap<String, Object> kakaoUserInfo = dao.getKakaoUserInfo(access_token);
		
		// 받아온 정보 {birthday, profile_image,gender,nickname,id,email}
		 
		String k_id = (String) kakaoUserInfo.get("id"); 
		String k_nickname = (String) kakaoUserInfo.get("nickname"); 
		String k_email = (String) kakaoUserInfo.get("email"); 
		String k_gender = (String) kakaoUserInfo.get("gender"); 
		String k_profile_image = (String) kakaoUserInfo.get("profile_image"); 
		
		// 카카오로 로그인한 회원이 기존 회원이면 true 반환하는 메소드 호출.
		boolean isMember = dao.checkKakaoUser(k_email);
		
		System.out.println("isMember 기존 회원인 지?" + isMember );

		ActionForward forward = new ActionForward();
		
		PrintWriter out = response.getWriter();	
		
		if(isMember== true) { // 기존 회원이면
			
			// 해당 기존 회원 kakaoAccount 컬럼값을 'YES'로 바꾸는 메소드.
			dao.connectKakaoMember(k_email);
			
			// 카카오 이메일 정보로 회원 dto 반환하는 메소드 호출.
			UserDTO dto = dao.getMemberWithKakao(k_email);
			
			// 로그인 시켜주기
			// QNA 답변 알림 정보
			QuestionDAO dao_q = QuestionDAO.getInstance();
			List<QuestionDTO> list = dao_q.getAnswerCheck(dto.getMem_num());
			
			// 세션 객체 생성
			HttpSession session = request.getSession();	

			// 세션 정보 받아오기 
			session.setAttribute("memberId", dto.getMem_id());
			session.setAttribute("memberName", dto.getMem_name());
			session.setAttribute("memberNum", dto.getMem_num());
			session.setAttribute("list",list);
			session.setAttribute("member_id", dto.getMem_id());
			session.setAttribute("access_token", access_token);
		
			forward.setRedirect(true);
			
			// 메인 페이지로 이동
			forward.setPath("main.do");			
			
		}else {	// 기존 회원이 아니면
			// 카카오 계정 정보를 활용하여 DB에 회원 정보 추가하는 메소드 호출. 
			int check = dao.insertMemberWithKakao(k_id, k_nickname, k_email, k_gender, k_profile_image);
			
			if(check > 0) {  // 카카오 회원 정보 추가 성공하면
				// 카카오 이메일 정보로 회원 dto 반환하는 메소드 호출.
				UserDTO dto = dao.getMemberWithKakao(k_email);
				
				// 로그인 시켜주기
				// QNA 답변 알림 정보
				QuestionDAO dao_q = QuestionDAO.getInstance();
				List<QuestionDTO> list = dao_q.getAnswerCheck(dto.getMem_num());
				
				// 세션 객체 생성
				HttpSession session = request.getSession();	

				// 세션 정보 받아오기 
				session.setAttribute("memberId", dto.getMem_id());
				session.setAttribute("memberName", dto.getMem_name());
				session.setAttribute("memberNum", dto.getMem_num());
				session.setAttribute("list",list);
				session.setAttribute("member_id", dto.getMem_id());
			
				forward.setRedirect(true);
				
				// 메인 페이지로 이동
				forward.setPath("main.do");			
					
			}else {
				out.println("<script>");
				out.println("alert('카카오 로그인 연동 중 오류가 발생하였습니다.')");
				out.println("history.back()");
				out.println("</script>");				
			}
		}
		
		System.out.println(kakaoUserInfo);
		
		return forward;
	}

}