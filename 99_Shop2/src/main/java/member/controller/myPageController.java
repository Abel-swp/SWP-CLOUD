package member.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import board.model.BoardBean;
import fm.BuyBean;
import member.model.MailVO;
import member.model.MemberDao;

@Controller
public class myPageController {

	@Autowired
	MemberDao memberDao;
	
	
	@RequestMapping(value="/myPage.mb",method = RequestMethod.GET)
	public ModelAndView myPage(HttpSession session,HttpServletResponse response) throws IOException {
		ModelAndView mav = new ModelAndView();
		PrintWriter pw = response.getWriter();
		response.setContentType("text/html; charset=UTF-8");
		System.out.println("1");
		if(session.getAttribute("loginInfo")==null) {
			session.setAttribute("destination", "redirect:/myPage.mb");
			pw.print("<script type='text/javascript'>");
			pw.print("alert('로그인이 필요한 서비스 입니다.')");
			pw.print("</script>");
			pw.flush();
			mav.setViewName("LoginForm");
			return mav;
		}
		else {
			
			
			
			MailVO mv = (MailVO)session.getAttribute("loginInfo");
			String nick = mv.getNickname();
			System.out.println("의뢰인 닉네임 :"+nick);
			List<BuyBean> orderList = memberDao.getByOrderList(nick);
			mav.addObject("orderList", orderList);
			
			String email = mv.getEmail();
			List<MailVO> lists = memberDao.getList(email);
			mav.addObject("lists", lists);
			mav.setViewName("mypage");
			return mav;
		}
	}
	
	@RequestMapping(value="/change.mb",method = RequestMethod.GET)
	public ModelAndView changeType(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		MailVO mv = (MailVO)session.getAttribute("loginInfo");
		int type = mv.getType();
		String email = mv.getEmail();
		System.out.println(mv.getType());
		if(type == 0) {
			mv.setType(1);
			List<MailVO> lists = memberDao.getList(email);
			mav.addObject("lists", lists);
			memberDao.updateType(mv);
		}else {
			mv.setType(0);
			memberDao.updateType(mv);
			System.out.println("의뢰인 구매내역 뿌리기");
			MailVO loginInfo = (MailVO) session.getAttribute("loginInfo");
			String nick = loginInfo.getNickname();
			System.out.println("의뢰인 닉네임 :"+nick);
			List<BuyBean> orderList = memberDao.getByOrderList(nick);
			mav.addObject("orderList", orderList);
		}
		mav.setViewName("mypage");
		return mav;
	}
	
	@RequestMapping(value="/myService.mb",method = RequestMethod.GET)
	public ModelAndView myService(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		MailVO mv = (MailVO)session.getAttribute("loginInfo");
		String email = mv.getEmail();
		List<MailVO> lists = memberDao.getList(email);
		mav.addObject("lists", lists);
		mav.setViewName("mypage");
		
		return mav;
	}
	
	@RequestMapping(value="/sale.mb",method = RequestMethod.GET)
	public String saleList() {
		
		
		return "saleList";
	}
	
	@RequestMapping(value="/sellinfo.mb",method = RequestMethod.GET)
	public ModelAndView sellinfo(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		MailVO loginInfo = (MailVO) session.getAttribute("loginInfo");
		String nick = loginInfo.getNickname();
		List<BuyBean> sellList = memberDao.getByOrderList(nick);
		mav.addObject("sellList", sellList);
		mav.setViewName("sellinfo");
		return mav;
	}
	
	@RequestMapping(value="/donateinfo.mb",method = RequestMethod.GET)
	public ModelAndView donateinfo(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		MailVO loginInfo = (MailVO) session.getAttribute("loginInfo");
		int sum = 0;
		String nick = loginInfo.getNickname();
		List<BuyBean> lists = memberDao.getAmount(nick);
		for(BuyBean buy:lists) {
			sum = sum+buy.getSum();
		}
		mav.setViewName("donateinfo");
		System.out.println("sum:"+sum);
		mav.addObject("sum", sum);
		return mav;
	}
	@RequestMapping(value="/abilityRequest.mb",method = RequestMethod.GET)
	public String doIt(HttpSession session, Model model) {
		
		String nick = (String) session.getAttribute("nick");
		//System.out.println("능력요청에서 닉네임 넘어옴?"+nick);
		
		List<BoardBean> brdList = memberDao.getListByNick(nick);
		model.addAttribute("brdList", brdList);
		return "abilityRequest";
	}
	
}
