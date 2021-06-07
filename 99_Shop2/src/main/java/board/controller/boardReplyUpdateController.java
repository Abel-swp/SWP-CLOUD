package board.controller;




import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import board.model.BoardDao;
import board.model.BoardReplyBean;

@Controller
public class boardReplyUpdateController {
	
	private final String command = "/boardReplyUpdate.brd"; 
	
	@Autowired
	BoardDao dao;
	
	BoardReplyBean bean = new BoardReplyBean();
	
	@RequestMapping(value=command, method = RequestMethod.GET, produces = "application/text; charset=utf8")
	@ResponseBody
	public String doAction(
			@RequestParam("rno") int rno,
			@RequestParam("nick")String nick
			){
		bean.setRno(rno);
		bean.setNickname(nick);
		String nName = dao.getReNick(bean);
		
		String data = null;
		if(nName==null) {
			//System.out.println("수정폼 닉네임 일치X");
			data = "no";
			return data;
		}else {	
			String rcontent = dao.getRcontent(rno);
			//model.addAttribute("rcontent", rcontent);
			data = rcontent;
			return data;
		}
	}
	
	
	@RequestMapping(value=command, method = RequestMethod.POST)
	@ResponseBody
	public String doAction2(
			@RequestParam("rno")int rno,
			@RequestParam("udtContent")String udtContent
			) {
		//System.out.println("rno : "+rno);
		//System.out.println("udtContent : "+udtContent);
		bean.setRcontent(udtContent);
		bean.setRno(rno);
		int cnt = dao.boardReplyUpdate(bean);
		
		String cnt2 = String.valueOf(cnt);	
		return cnt2;
	}
}
