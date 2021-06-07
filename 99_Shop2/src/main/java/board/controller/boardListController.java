package board.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import board.model.BoardBean;
import board.model.BoardDao;
import utility.Paging;

@Controller
public class boardListController {
	
	
	@Autowired
	BoardDao dao;
	
	private final String command = "/list.brd";
	private final String getPage = "boardList";
	
	@RequestMapping(command)
	public String doIt(
			@RequestParam(value="pageNumber",required = false )String pageNumber,
			@RequestParam(value="pageSize",required = false )String pageSize,
			@RequestParam(value="whatColumn",required = false )String whatColumn,
			@RequestParam(value="keyword",required = false )String keyword,
			@RequestParam(value="insertFlag",required = false ) boolean insertFlag,
			@RequestParam(value="updateFlag",required = false ) boolean updateFlag,
			@RequestParam(value="deleteFlag",required = false ) boolean deleteFlag,
			HttpServletRequest request, Model model, HttpServletResponse response
			) throws IOException {
		
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("whatColumn", whatColumn);  
		map.put("keyword", "%"+keyword+"%");
		int totalCount = dao.getCount(map);
		//System.out.println("totalCount : "+totalCount);
		
		String url = request.getContextPath()+command;
		Paging page = new Paging(pageNumber, pageSize, totalCount, url, whatColumn, keyword);
		List<BoardBean> lists = dao.getBoardList(map, page);
		model.addAttribute("list", lists);
		model.addAttribute("page", page);
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		if(insertFlag) {
			out.print("<script> alert('게시물이 등록되었습니다.'); </script>");
			out.flush();
		}
		if(updateFlag) {
			out.print("<script> alert('게시물이 수정되었습니다.'); </script>");
			out.flush();
		}
		if(deleteFlag) {
			out.print("<script> alert('게시물이 삭제되었습니다.'); </script>");
			out.flush();
		}
		
		return getPage;
		
	}
	
}



