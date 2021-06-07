package board.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import board.model.BoardBean;
import board.model.BoardDao;
import board.model.BoardReplyBean;

@Controller
public class boardMoveController {
	
	@Autowired
	BoardDao dao;
	  
	private final String command = "/move.brd"; 
	private final String getPage = "boardDetailForm";
	//private final String gotoPage = "redirect:/detailForm.brd";
	
	@RequestMapping(command)
	public String doAction(
			@RequestParam("no")int no, 
			@RequestParam("pageNumber")int pageNumber,
			Model model, 
			HttpServletRequest request, HttpServletResponse response) throws IOException {
		String move = request.getParameter("move");
		//System.out.println("이전 혹은 다음 : "+move);
		//System.out.println("no : "+no);
		
		
		int maxR = dao.maxRnum();			//최대값
		//System.out.println("rnum 최대값 : "+maxR);
		
		int rnum = dao.getRnum(no);			//순번
		//System.out.println("rnum : "+rnum);
		
		//자바스크립트 쓰려고
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		int rePageSize = 3;
		BoardReplyBean rbean = new BoardReplyBean();
		rbean.setRePageSize(rePageSize);
		int cnt = 0;
			//다음페이지
			if(move.equals("1")) {		//마지막페이지
				if(rnum == maxR) {
					BoardBean bean = dao.getBoard(no);
					rbean.setNo(no);	//댓글 범위 제한
					List<BoardReplyBean> rList = dao.getReplyList_2(rbean);
					cnt = dao.getReplyCount(no);
					
					model.addAttribute("pageNumber", pageNumber);	 //updateForm에서 사용함
					model.addAttribute("cnt", cnt);
					model.addAttribute("rePage", rePageSize);
					model.addAttribute("rList", rList);
					model.addAttribute("bean", bean);
					
					out.print("<script>alert('마지막 페이지 입니다.'); </script>");
					out.flush();
					return getPage;
				}
				
				//다음
				BoardBean bean = dao.getNextMove(rnum);    //순번 +1의 보따리
				no = bean.getNo();			//한칸씩 밀리기 때문에 바로 넣어줘야함
				rbean.setNo(no);
				List<BoardReplyBean> rList = dao.getReplyList_2(rbean);
				cnt = dao.getReplyCount(no);
				
				model.addAttribute("bean", bean);
				model.addAttribute("cnt", cnt);
				model.addAttribute("rList", rList);
				
			//이전페이지버튼		
			}else {
				
				if(rnum == 1) {		//첫번째 페이지
					BoardBean bean = dao.getBoard(no);
					rbean.setNo(no);
					List<BoardReplyBean> rList = dao.getReplyList_2(rbean);
					cnt = dao.getReplyCount(no);
					
					model.addAttribute("pageNumber", pageNumber);
					model.addAttribute("bean", bean);
					model.addAttribute("cnt", cnt);
					model.addAttribute("rePage", rePageSize);
					model.addAttribute("rList", rList);
					
					out.print("<script>alert('첫번째 페이지 입니다.'); </script>");
					out.flush();
					return getPage;
				}
				
				BoardBean bean = dao.getBeforeMove(rnum);    //순번-1의 보따리	
				no = bean.getNo();
				rbean.setNo(no);
				List<BoardReplyBean> rList = dao.getReplyList_2(rbean);
				cnt = dao.getReplyCount(no);
				model.addAttribute("cnt", cnt);
				model.addAttribute("bean", bean);
				model.addAttribute("rList", rList);
				
			}	
			
			model.addAttribute("rePage", rePageSize);
			model.addAttribute("pageNumber", pageNumber);	 //updateForm에서 사용함
			return getPage;
	}
}
