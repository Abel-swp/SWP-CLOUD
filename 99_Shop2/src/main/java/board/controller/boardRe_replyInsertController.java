package board.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import board.model.BoardDao;
import board.model.BoardReplyBean;

@Controller
public class boardRe_replyInsertController {

	
	private final String command ="/boardRe_replyInsert.brd";
	
	@Autowired
	BoardDao dao;  
	
	@ResponseBody
	@RequestMapping(command)
	public void doAction(
			@RequestParam("istContent")String istContent, 
			@RequestParam("rno")int rno,
			@RequestParam("no")int no,
			@RequestParam("ref")int ref,
			@RequestParam("nick")String nick
			) {
		//System.out.println("istContent : "+istContent);
		BoardReplyBean rbean = new BoardReplyBean();
		rbean.setNickname(nick);
		rbean.setRno(rno);
		rbean.setRcontent(istContent);
		rbean.setNo(no);
		rbean.setRef(ref);
		
		//System.out.println("getRef:"+rbean.getRef());
		//System.out.println("getRelevel:"+rbean.getRelevel());
		
		dao.boardRe_replyInsert(rbean);
		
	}
			
}
