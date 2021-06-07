package member.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import member.model.MailVO;
import member.model.MemberDao;

@Controller
public class registerController {

	@RequestMapping(value = "/register.mb", method = RequestMethod.GET)
	public String generic(final MailVO vo, Model model) {
		return "registerForm";
	}

	@Autowired
	MemberDao memberDao;

	@Autowired
	private JavaMailSenderImpl mailSender;

	@RequestMapping(value="/nickNameCheck.mb",method = RequestMethod.GET)
	public ModelAndView nicknameCheck(MailVO vo,@RequestParam(value="nickname") String nickname,HttpServletResponse response,HttpSession session) throws IOException {
		session.setAttribute("name", vo.getName());
		session.setAttribute("password", vo.getPassword());
		session.setAttribute("nickname", nickname);
		PrintWriter pw = response.getWriter();
		response.setContentType("text/html; charset=UTF-8");
		ModelAndView mav = new ModelAndView();
		MailVO mv = memberDao.getNickname(nickname);
		if(mv == null) {
			pw.print("<script type='text/javascript'>");
			pw.print("alert('해당 닉네임은 사용 가능합니다.')");
			pw.print("</script>");
			pw.flush();
			mav.addObject("flag", 1);
			mav.setViewName("registerForm");
		}else {
			pw.print("<script type='text/javascript'>");
			pw.print("alert('해당 닉네임은 이미 사용중입니다.')");
			pw.print("</script>");
			pw.flush();
			mav.addObject("flag", 0);
			mav.setViewName("registerForm");
		}
		return mav;
	}
	
	
	@RequestMapping(value = "/sendMail.mb", method = RequestMethod.POST)
	public ModelAndView doAction(MailVO vo, @RequestParam(value = "randNum") int randNum,
			HttpServletResponse response, HttpServletRequest request, HttpSession session, ModelAndView mav)
			throws IOException {
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter pw = response.getWriter();
		int seRandNum = (Integer)session.getAttribute("randNum");
		System.out.println("randNum:"+randNum);
		System.out.println("serandNum:"+seRandNum);
		
		MailVO mv = memberDao.getNickname(vo.getNickname());
		if(mv!=null) {
			pw.print("<script type='text/javascript'>");
			pw.print("alert('해당 닉네임은 이미 사용중입니다.')");
			pw.print("</script>");
			pw.flush();
			mav.addObject("flag", 0);
			mav.setViewName("registerForm");
		}
		else {
		if(randNum==seRandNum) {
		String viewPage = "regist";
		vo.setEmail(vo.getEmail_id() + "@" + vo.getEmail_domain());
		memberDao.insertData(vo);
		session.invalidate();
		mav.setViewName(viewPage);
		}else {
			pw.print("<script type='text/javascript'>");
			pw.print("alert('인증번호가 잘못되었습니다.')");
			pw.print("</script>");
			pw.flush();
			mav.setViewName("registerForm");
		}
		}
		return mav;
	}

	@RequestMapping(value = "/sendMail.mb", method = RequestMethod.GET)
	public String sendMail(final MailVO vo, final HttpSession session,HttpServletResponse response) throws IOException {
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter pw = response.getWriter();
		String viewPage = "";
		vo.setEmail(vo.getEmail_id() + "@" + vo.getEmail_domain());
		session.setAttribute("name", vo.getName());
		session.setAttribute("password", vo.getPassword());
		System.out.println(vo.getEmail());
		boolean flag = false;
		List<MailVO> lists = memberDao.getEmail();
		for (MailVO mv : lists) {
			if (mv.getEmail().equals(vo.getEmail())) {
				flag = true;
			}
		}
		System.out.println(flag);
		if (flag == false) {
			final MimeMessagePreparator preparator = new MimeMessagePreparator() {
				@Override
				public void prepare(MimeMessage mimeMessage) throws Exception {
					int randNum = (int) Math.floor(1000 + (9999 - 1000) * Math.random());
					final MimeMessageHelper helper = new MimeMessageHelper(mimeMessage, true, "UTF-8");
					helper.setTo(vo.getEmail_id() + "@" + vo.getEmail_domain());
					helper.setSubject("중앙중앙");
					helper.setText((String.valueOf(randNum)), true);
					session.setAttribute("email_id", vo.getEmail_id());
					session.setAttribute("email_domain", vo.getEmail_domain());
					session.setAttribute("randNum", randNum);
				}
			};
			mailSender.send(preparator);
			pw.print("<script type='text/javascript'>");
			pw.print("alert('이메일이 전송되었습니다.')");
			pw.print("</script>");
			pw.flush();
			viewPage = "registerForm";
		}else {
			pw.print("<script type='text/javascript'>");
			pw.print("alert('이미 사용중인 이메일 입니다.')");
			pw.print("</script>");
			pw.flush();
			viewPage = "registerForm";
		} 
		return viewPage;

	}
	@RequestMapping(value="/findPw.mb",method = RequestMethod.GET)
	public String findPW() {
		
		return "findPasswordForm";
	}
	
	@RequestMapping(value="/findPw.mb",method = RequestMethod.POST)
	public String sendPW(final MailVO vo, final HttpSession session,HttpServletResponse response) throws IOException {
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter pw = response.getWriter();
		String viewPage = "";
		vo.setEmail(vo.getEmail_id() + "@" + vo.getEmail_domain());
		final MailVO mv = memberDao.getInfo(vo);
		if(mv == null) {
			pw.print("<script type='text/javascript'>");
			pw.print("alert('이메일 혹은 이름이 일치하지 않습니다.')");
			pw.print("</script>");
			pw.flush();
			viewPage = "findPasswordForm";
		}else {
			final MimeMessagePreparator preparator = new MimeMessagePreparator() {
				@Override
				public void prepare(MimeMessage mimeMessage) throws Exception {
					final MimeMessageHelper helper = new MimeMessageHelper(mimeMessage, true, "UTF-8");
					helper.setTo(vo.getEmail_id() + "@" + vo.getEmail_domain());
					helper.setSubject("중앙중앙");
					helper.setText((mv.getPassword()), true);
					session.setAttribute("email_id", vo.getEmail_id());
					session.setAttribute("email_domain", vo.getEmail_domain());
				}
			};
			mailSender.send(preparator);
			pw.print("<script type='text/javascript'>");
			pw.print("alert('이메일로 비밀번호가 전송되었습니다.')");
			pw.print("</script>");
			pw.flush();
			viewPage = "LoginForm";
		}
		return viewPage;
	}
	
}
