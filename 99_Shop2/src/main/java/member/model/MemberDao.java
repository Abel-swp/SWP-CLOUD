package member.model;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import board.model.BoardBean;
import fm.BuyBean;

@Component("Mymem")
public class MemberDao {
	
	String namespace = "member.model.Member";
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;

	public void insertData(MailVO vo) {
		sqlSessionTemplate.insert(namespace+".insertData",vo);
	}

	public List<MailVO> getEmail() {
		List<MailVO> lists = new ArrayList<MailVO>();
		lists = sqlSessionTemplate.selectList(namespace+".selectEmail");
		for(int i = 0; i<lists.size(); i++) {
			System.out.println(lists.get(i).getEmail());
		}
		
		return lists;
	}

	public MailVO getData(String inputEmail) {
		MailVO mv = sqlSessionTemplate.selectOne(namespace+".getData",inputEmail);
		return mv;
	}

	public MailVO getNickname(String nickname) {
		MailVO vo = sqlSessionTemplate.selectOne(namespace+".getNickname",nickname);
		return vo;
	}

	public void updateType(MailVO vo) {
		int cnt = sqlSessionTemplate.update(namespace+".updateType",vo);
	}

	public List<MailVO> getList(String email) {
		List<MailVO> lists = new ArrayList<MailVO>();
		lists = sqlSessionTemplate.selectList(namespace+".getList",email);
		
		return lists;
	}
 
	public MailVO getInfo(MailVO vo) {
		MailVO mv = sqlSessionTemplate.selectOne(namespace+".getInfo",vo);
		return mv;
	}
	public List<BuyBean> getByOrderList(String nick) {
		List<BuyBean> orderList = sqlSessionTemplate.selectList(namespace+".getByOrderList", nick);
		return orderList;
	}

	public List<BuyBean> getAmount(String nick) {
		List<BuyBean> lists = sqlSessionTemplate.selectList(namespace+".getAmount",nick);
		return lists;
	}
	public List<BoardBean> getListByNick(String nick) {
		//System.out.println("능력요청DAO에서 닉네임 넘어옴?"+nick);
		List<BoardBean> brdbean = sqlSessionTemplate.selectList(namespace+".GetListByNick", nick);
		return brdbean;
	}
}
