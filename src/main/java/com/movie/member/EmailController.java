package com.movie.member;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class EmailController {
	@Inject
	EmailService emailService;

	@Autowired
	private MemberDAO mDAO2;

	@RequestMapping("emailconfirm")
	public String write(HttpServletRequest req) {

		req.setAttribute("contentPage", "emailconfirm.jsp");
		req.setAttribute("topmenu", "maintop.jsp");
		return "main";
	}

	@RequestMapping("send.do")
	public String send(@ModelAttribute EmailDTO dto, Model model, HttpServletRequest req) {

		Member m2 = mDAO2.getMemberProfile(req.getParameter("m_id"));
		String m2_id = m2.getM_id();
		String m2_password = m2.getM_password();
		String m2_name = m2.getM_name();
		String m2_email = m2.getM_email();
		
		
		String message1 = "Movie info find result";
		message1 += "\n ID : " + m2_id;
		message1 += "\n Password : "+ m2_password;
		message1 += "\n Name : "+ m2_name;
		message1 += "\n Email : "+ m2_email;
		try {
			
			dto.setMessage(message1);
			emailService.sendMail(dto); // dto (메일관련 정보)를 sendMail에 저장함
			model.addAttribute("message", "이메일이 발송되었습니다."); // 이메일이 발송되었다는 메시지를 출력시킨다.

		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("message", "이메일 발송 실패..."); // 이메일 발송이 실패되었다는 메시지를 출력
		}

		req.setAttribute("contentPage", "emailconfirmresult.jsp");
		req.setAttribute("topmenu", "maintop.jsp");
		return "main"; // 실패했으므로 다시 write jsp 페이지로 이동함
	}

}
