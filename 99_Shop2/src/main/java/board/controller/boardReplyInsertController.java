package board.controller;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import board.model.BoardDao;
import board.model.BoardReplyBean;

@Controller
public class boardReplyInsertController {

	
	private final String command ="/boardReplyInsert.brd";
	private final String getPage ="boardDetailForm";
	//private final String gotoPage ="redirect:/detailForm.brd";
	
	@Autowired
	BoardDao dao;  
	
	@RequestMapping(command)
	public String doAction(
			@RequestParam("no")int no, 
			@RequestParam("replytext")String replytext,
			@RequestParam("pageNumber")int pageNumber,
			@RequestParam("nick")String nick,
			Model model
			) {
		System.out.println(" 댓글 등록 닉네임  : "+nick);
	//	System.out.println("replytext : "+replytext);
		BoardReplyBean bean = new BoardReplyBean();
		bean.setNo(no);
		bean.setRcontent(replytext);
		bean.setNickname(nick);
		
		dao.boardReplyInsert(bean);
		int cnt = dao.getReplyCount(no);
		List<BoardReplyBean> rList = dao.getReplyList(no);
		
		model.addAttribute("no", no);
		model.addAttribute("pageNumber", pageNumber);
		model.addAttribute("cnt", cnt);
		model.addAttribute("rList", rList);
		return getPage;
	}
}
