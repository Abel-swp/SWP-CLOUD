package board.controller;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import board.model.BoardBean;
import board.model.BoardDao;

@Controller
public class boardWriteController {
	
	private final String command = "/boardWrite.brd";
	private final String getPage = "boardWriteForm";
	private final String gotoPage = "redirect:/list.brd";
	
	@Autowired
	BoardDao dao;
	
	@RequestMapping(value=command, method = RequestMethod.GET )
	public String doAction(@RequestParam("pageNumber")int pageNumber, Model model, HttpSession session) {
		String nick = (String) session.getAttribute("nick");
		if(nick == null) {
			boolean nickCheck = true;
			session.setAttribute("destination", "redirect:/boardWrite.brd?pageNumber="+pageNumber);
			model.addAttribute("nickCheck", nickCheck);
			return "redirect:/login.mb";
		}
		
		model.addAttribute("pageNumber", pageNumber);
		return getPage;
	}
	
	@RequestMapping(value=command, method = RequestMethod.POST )
	public String doAction(BoardBean bean, Model model, HttpSession session) {
		//SimpleDateFormat format1 = new SimpleDateFormat("yy-MM-dd HH:mm");
		//Date now = new Date();  
		//System.out.println("date : "+format1.format(now));
		
		//닉네임 등록
		String nick = (String) session.getAttribute("nick");
		bean.setNickname(nick);
		
		int cnt = dao.boardInsert(bean);
		if(cnt == 0) {
			return getPage;
		}
		boolean insertFlag = true;
		model.addAttribute("insertFlag", insertFlag);
		return gotoPage;
	}
	
	
	
	
}
