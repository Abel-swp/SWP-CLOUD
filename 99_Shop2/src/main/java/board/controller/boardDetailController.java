package board.controller;


import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import board.model.BoardBean;
import board.model.BoardDao;
import board.model.BoardReplyBean;

@Controller
public class boardDetailController {
	
	@Autowired
	BoardDao dao;
	
	private final String command = "/detailForm.brd"; 
	private final String getPage = "boardDetailForm"; 
	
	@RequestMapping(command)
		public String doAction(
				@RequestParam("no")int no, 
				@RequestParam("pageNumber")int pageNumber, 
				@RequestParam(value="rePage",required = false)Integer rePage,
				@RequestParam(value="isNick",required = false)boolean isNick,
				Model model, HttpSession session,HttpServletResponse response
				) throws IOException {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter pw = response.getWriter(); 
			
			
			if(isNick) {
				pw.print("<script> alert('회원 정보가 일치하지 않습니다.'); </script>");
				pw.flush();
			}	
			//조회수증가
			dao.ReadCountUpdate(no);
			
			//bean 가져오기
			BoardBean bean = dao.getBoard(no);
			
			//댓글 카운트
			int cnt = dao.getReplyCount(no);
			
			//댓글 개수 넣기
			Map<String, Integer> map = new HashMap<String, Integer>();
			map.put("no", no);
			map.put("cnt", cnt);
			dao.updateReplyconunt(map);
			//System.out.println("cnt : "+cnt);
			
			
			//댓글 몇개씩 볼꺼임?
			int rePageSize = 3;
			
			BoardReplyBean rbean = new BoardReplyBean();
			rbean.setNo(no);
			if(rePage != null) {
				//System.out.println("답글 더보기 버튼 누르면");
				rePageSize += rePage;
				rbean.setRePageSize(rePageSize);  
				//System.out.println("더보기 버튼 누르면 rePageSize : "+rePageSize);
				dao.rePageSizeUpdate(rbean);  // rePageSIze만큼 추가
				
			}else {
				//System.out.println("넘어오는거 없음");
				rePageSize = 3;
				rbean.setRePageSize(rePageSize);
			}
				
			//System.out.println("페이지 가기 직전 rePageSize : "+rePageSize);
			
			//댓글리스트
			List<BoardReplyBean> rList = dao.getReplyList_2(rbean); 
			
			
			//System.out.println("리스트 get 완료");
			model.addAttribute("rePage", rePageSize);
			model.addAttribute("cnt", cnt);
			model.addAttribute("bean", bean);
			model.addAttribute("pageNumber", pageNumber);
			model.addAttribute("rList", rList);
			model.addAttribute("nick", session.getAttribute("nick"));
			return getPage;
	}
}
