package member.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import member.model.MailVO;
import member.model.MemberDao;

@Controller
public class loginController {

	@Autowired
	MemberDao memberDao;
	
	/*
	 * @RequestMapping(value="/login.mb",method = RequestMethod.GET) public String
	 * Login() {
	 * 
	 * return "LoginForm"; }
	 */
	@RequestMapping(value="/login.mb",method = RequestMethod.GET)
	public String Login(@RequestParam(value="nickCheck",required = false) boolean nickCheck
				,HttpServletResponse response) throws IOException {
		if(nickCheck) {
			PrintWriter pw = response.getWriter();
			response.setContentType("text/html; charset=UTF-8");
			pw.print("<script> alert('로그인을 해주세요.'); </script>");
			pw.flush();
		}
		return "LoginForm";
	}
	@RequestMapping(value="/Login.mb",method = RequestMethod.POST)
	public ModelAndView LoginPost(MailVO vo,HttpServletRequest request,HttpServletResponse response,HttpSession session) throws IOException {
		
		vo.setEmail(vo.getEmail_id()+"@"+vo.getEmail_domain());
		String inputEmail = vo.getEmail();
		MailVO mv = memberDao.getData(inputEmail);
		PrintWriter pw = response.getWriter();
		response.setContentType("text/html; charset=UTF-8");
		ModelAndView mav = new ModelAndView();
		
		if(mv == null) {
			pw.print("<script type='text/javascript'>");
			pw.print("alert('해당 아이디가 존재하지 않습니다.')");
			pw.print("</script>");
			pw.flush();
			mav.setViewName("LoginForm");
		}else {
			if(mv.getPassword().equals(vo.getPassword())) {
				session.setAttribute("loginInfo", mv);
				String nickname = mv.getNickname();
				System.out.println("닉네임 세션 : "+nickname);
				session.setAttribute("nick", nickname);
				String destination = (String)session.getAttribute("destination");
				if(destination == null) {
					mav.setViewName("redirect:result.fm");
				}
				else {
					mav.setViewName(destination);
				}
			}
			else {
				pw.print("<script type='text/javascript'>");
				pw.print("alert('패스워드가 일치하지 않습니다.')");
				pw.print("</script>");
				pw.flush();
				mav.setViewName("LoginForm");
			}
		}
		
		return mav;
	}
}



















