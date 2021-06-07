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
public class boardUpdateController {
	private final String command = "/update.brd"; 
	private final String getPage = "boardUpdateForm"; 
	private final String gotoPage = "redirect:/list.brd"; 
	
	@Autowired
	BoardDao dao;
	
	@RequestMapping(value=command, method=RequestMethod.GET)
	public String doAction(@RequestParam("no")int no, 
			@RequestParam("pageNumber")int pageNumber, 
			Model model,HttpSession session) {
		
		String nick = (String) session.getAttribute("nick");
		if(nick == null) {
			boolean nickCheck = true;
			model.addAttribute("nickCheck", nickCheck);
			model.addAttribute("pageNumber", pageNumber);
			model.addAttribute("no", no);
			return "redirect:/login.mb";
		}else {
			BoardBean bean = new BoardBean();
			bean.setNo(no);
			bean.setNickname(nick);
			String nName = dao.getNick(bean); 
			if(nName == null) {
				boolean isNick = true;
				model.addAttribute("isNick", isNick);
				model.addAttribute("pageNumber", pageNumber);
				model.addAttribute("no", no);
				return "redirect:/detailForm.brd";
			}else {
				bean = dao.getBoard(no);
				model.addAttribute("bean", bean);
				model.addAttribute("pageNumber", pageNumber);
				
				return getPage;
			}
		}
	}
	
	@RequestMapping(value=command, method=RequestMethod.POST)
	public String doAction(@RequestParam("pageNumber")int pageNumber, BoardBean bean, Model model) {
		
		dao.boardUpdate(bean);
		model.addAttribute("pageNumber", pageNumber);
		boolean updateFlag = true;
		model.addAttribute("updateFlag", updateFlag);
		return gotoPage;
	}
	
}
