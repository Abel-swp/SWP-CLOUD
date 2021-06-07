package board.model;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import utility.Paging;

@Component("myBoardDao")
public class BoardDao {
	private String namespace = "board.model.Board";  
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;

	public int getCount(Map<String, String> map) {
		int tc = sqlSessionTemplate.selectOne(namespace+".GetCount",map); 
		return tc;
	}

	public List<BoardBean> getBoardList(Map<String, String> map, Paging page) {
		List<BoardBean> lists = new ArrayList<BoardBean>();
		RowBounds rb = new RowBounds(page.getOffset(), page.getLimit());
		lists = sqlSessionTemplate.selectList(namespace+".GetBoardList", map, rb);
		return lists;
	}

	public int boardInsert(BoardBean bean) {
		int cnt = sqlSessionTemplate.insert(namespace+".BoardInsert", bean);
		return cnt;
	}

	public BoardBean getBoard(int no) {
		BoardBean bean = sqlSessionTemplate.selectOne(namespace+".GetBoard", no);
		return bean;
	}

	public void ReadCountUpdate(int no) {
		sqlSessionTemplate.update(namespace+".ReadCountUpdate",no);
		
	}

	public int getRnum(int no) {
		int rnum = sqlSessionTemplate.selectOne(namespace+".GetRnum", no);
		return rnum;
	}

	public BoardBean getNextMove(int rnum) {
		BoardBean bean = sqlSessionTemplate.selectOne(namespace+".GetNextMove", rnum);
		return bean;
	}

	public BoardBean getBeforeMove(int rnum) {
		BoardBean bean = sqlSessionTemplate.selectOne(namespace+".GetBeforeMove", rnum);
		return bean;
	}

	public int maxRnum() {
		int maxR = sqlSessionTemplate.selectOne(namespace+".MaxRnum");
		return maxR;
	}

	public void boardUpdate(BoardBean bean) {
		sqlSessionTemplate.update(namespace+".BoardUpdate",bean);
		
	}

	public int boardDelete(int no) {
		int cnt = sqlSessionTemplate.delete(namespace+".BoardDelete",no);
		return cnt;
	}
	
	public void boardReplyInsert(BoardReplyBean bean) {
		sqlSessionTemplate.insert(namespace+".BoardReplyInsert", bean);
	}

	public int getReplyCount(int no) {
		int cnt = sqlSessionTemplate.selectOne(namespace+".GetReplyCount",no);
		return cnt;
	}

	public List<BoardReplyBean> getReplyList(int no) {
		List<BoardReplyBean> list = sqlSessionTemplate.selectList(namespace+".GetReplyList", no);
		return list;
	}

	public String getRcontent(int rno) {
		//System.out.println("rno : "+rno);
		String rcontent = sqlSessionTemplate.selectOne(namespace+".GetRcontent", rno);
		return rcontent;
	}

	public int boardReplyUpdate(BoardReplyBean bean) {
		int cnt = sqlSessionTemplate.update(namespace+".BoardReplyUpdate", bean);
		return cnt;
	}

	public int boardReplyDelete(int rno) {
		int cnt = sqlSessionTemplate.delete(namespace+".BoardReplyDelete", rno);
		return cnt;
	}

	public void boardRe_replyInsert(BoardReplyBean rbean) {
		sqlSessionTemplate.insert(namespace+".BoardRe_replyInsert", rbean);
	}

	public void boardRestepUpdate(BoardReplyBean rbean) {
		sqlSessionTemplate.update(namespace+".BoardRestepUpdate", rbean);
		
	}

	public List<BoardReplyBean> getReplyList_2(BoardReplyBean rbean) {
		List<BoardReplyBean> list = sqlSessionTemplate.selectList(namespace+".GetReplyList2", rbean);
		return list;
	}

	public void rePageSizeUpdate(BoardReplyBean rbean) {
		sqlSessionTemplate.update(namespace+".RePageSizeUpdate", rbean);
		
	}

	public void updateReplyconunt(Map<String, Integer> map) {
		sqlSessionTemplate.update(namespace+".UpdateReplyconunt", map);
		
	}

	public int selectReplycount() {
		int rcount = sqlSessionTemplate.selectOne(namespace+".SelectReplycount");
		return rcount;
	}

	public String getNick(BoardBean bean) {
		String nName = sqlSessionTemplate.selectOne(namespace+".GetNick", bean);
		return nName;
	}

	public String getReNick(BoardReplyBean bean) {
		String nName = sqlSessionTemplate.selectOne(namespace+".GetReNick", bean);
		return nName;
	}


	
}
