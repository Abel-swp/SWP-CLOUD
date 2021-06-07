package board.controller;

import java.io.IOException;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import board.model.BoardDao;
import board.model.BoardReplyBean;

@Controller
public class boardReplyDeleteController {

	private final String command = "/boardReplyDelete.brd";
	
	@Autowired
	BoardDao dao;
	
	@RequestMapping(command)
	@ResponseBody
	public String doAction(
			@RequestParam("rno")int rno,
			@RequestParam("nick")String nick,
			Model model) throws IOException {
		
		BoardReplyBean bean = new BoardReplyBean();
		bean.setNickname(nick);
		bean.setRno(rno);
		String nName = dao.getReNick(bean);
		//System.out.println("일치 닉네임:"+nName);
		
		String data = null;
		if(nName==null) {
			//System.out.println("댓글 삭제 닉네임 X");
			data = "no";
		}else {
			int cnt = dao.boardReplyDelete(rno);
			if(cnt > 0) {
				data = "yes"; 
			}
		}
		return data;
	}
}
