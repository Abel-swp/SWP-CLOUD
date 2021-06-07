package board.controller;

import java.io.IOException;

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
public class boardDeleteController {
	private final String command = "/delete.brd"; 
	private final String getPage = "redirect:/list.brd"; 
	
	@Autowired
	BoardDao dao;
	
	@RequestMapping(value=command, method=RequestMethod.GET)
	public String doAction(
			@RequestParam("no")int no,
			@RequestParam("pageNumber")int pageNumber,
			Model model, HttpSession session
			) throws IOException {
		
		String nick = (String) session.getAttribute("nick"); 
		BoardBean bean = new BoardBean();
		bean.setNo(no);
		bean.setNickname(nick);
		String nName = dao.getNick(bean);
		System.out.println("닉네임 일치? : "+nName);
		if(nName == null) {
			boolean isNick = true;
			model.addAttribute("isNick", isNick);
			model.addAttribute("pageNumber", pageNumber);
			model.addAttribute("no", no);
			return "redirect:/detailForm.brd";
		}else {
			dao.boardDelete(no);
			model.addAttribute("pageNumber", pageNumber);
			boolean deleteFlag = true;
			model.addAttribute("deleteFlag", deleteFlag);
			return getPage;
		}
	}
}
