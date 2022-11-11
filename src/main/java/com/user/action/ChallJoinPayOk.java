package com.user.action;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.chall.controller.Action;
import com.chall.controller.ActionForward;
import com.chall.model.ChallJoinDAO;
import com.chall.model.ChallJoinDTO;
import com.chall.model.ChallMoneyLogDAO;
import com.chall.model.ChallMoneyLogDTO;
import com.chall.model.ChallProofDAO;

public class ChallJoinPayOk implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws IOException, Exception {
		response.setContentType("text/html; charset=UTF-8");
		int depositOriginal = Integer.parseInt(request.getParameter("dpOG"));	// 참가 예치금
		int depositMinus = Integer.parseInt(request.getParameter("dpMi"));		// 사용한 보유 예치금
		int payFinal = Integer.parseInt(request.getParameter("payF"));			// 최종 충전 금액
		request.setAttribute("depositOriginal", depositOriginal);
		request.setAttribute("depositMinus", depositMinus);
		request.setAttribute("payFinal", payFinal);
		
		HttpSession session = request.getSession();
		int chall_num = (Integer)session.getAttribute("chall_num");
		int memberNum = (Integer)session.getAttribute("memberNum");
		ChallJoinDAO join_dao = ChallJoinDAO.getInstance();
		ChallProofDAO proof_dao = ChallProofDAO.getInstance();
		// (list 테이블) 챌린지 정보 가져오기
		ChallJoinDTO challContent_dto = join_dao.getChallContent(chall_num);
		request.setAttribute("challContent", challContent_dto);
		// (list 테이블) 결제 완료 시 ongoingPeople +1 / status ‘임시저장’ → ‘진행중’
		join_dao.challJoinOk(chall_num);
		
		if(memberNum == challContent_dto.getChall_creater_num()) {
			// (회원 테이블) 개설자 : 결제 완료 시 해당 회원의 참가횟수 +1, 개설횟수 +1, 예치금 차감
			join_dao.memChallJoinUpdate_creater(memberNum, depositMinus);
		}else {
			// (회원 테이블) 일반 참가자 : 결제 완료 시 해당 회원의 참가횟수 +1, 예치금 차감
			join_dao.memChallJoinUpdate_participant(memberNum, depositMinus);
		}
		
		// (인증 테이블) 결제 완료 시 ‘참가예치금’을 해당 회원의 ‘나의 예치금’으로 설정
		proof_dao.proofInsert(chall_num, memberNum, depositOriginal);
		
		// (예치금 테이블) 예치금 정보 저장하기
		ChallMoneyLogDAO money_dao = ChallMoneyLogDAO.getInstance();
		int mylatestDeposit = join_dao.getMemMoney(memberNum);
		money_dao.insertMoneyLog(memberNum, chall_num, depositMinus, mylatestDeposit);

		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("user/member_challJoin_pay_ok.jsp");
		return forward;
	}

}
