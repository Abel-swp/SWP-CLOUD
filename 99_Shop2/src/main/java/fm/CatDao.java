package fm;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import utility.Paging;
import utility.Paging2;
import utility.Paging3;

@Component("cat")
public class CatDao {
	
	private String namespace = "fm.category";
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	// ����������������������������������������������������������������������������������������������������������������������������������������������������������
	// 01. ��ü��ȸ
	public List<CatBean> getCatList(Paging pageInfo, Map<String,String> map) {
		List<CatBean> list = new ArrayList<CatBean>();
		RowBounds rowBounds = new RowBounds(pageInfo.getOffset(), pageInfo.getLimit());
		list = sqlSessionTemplate.selectList(namespace+".GetCatList",map,rowBounds);
		return list;
	}
	// ����������������������������������������������������������������������������������������������������������������������������������������������������������
	// 02. ��ü�۰���
	public int getTotalCount(Map<String,String> map) {
		int cnt = sqlSessionTemplate.selectOne(namespace+".GetTotalCount",map);
		return cnt;
	}
	// ����������������������������������������������������������������������������������������������������������������������������������������������������������
	// 03. ����
	public int insertCat(CatBean cat) {
		int cnt = sqlSessionTemplate.insert(namespace+".InsertCat",cat);
		return cnt;
	}
	// ����������������������������������������������������������������������������������������������������������������������������������������������������������
	// 04. ī�װ� ��������
	public List<RefBean> selectRef() {
		List<RefBean> list = sqlSessionTemplate.selectList(namespace+".SelectRef");
		return list;
	}
	// ����������������������������������������������������������������������������������������������������������������������������������������������������������
	// 05. �󼼺���
	public CatBean detailCat(int num) {
		CatBean cat = sqlSessionTemplate.selectOne(namespace+".DetailCat",num);
		return cat;
	}
	// ����������������������������������������������������������������������������������������������������������������������������������������������������������

	//추가
		// grid 넘어갈 때 첫 출력될 1차서비스 목록들
	public List<CatBean> gridCat(String ref,Paging2 pageInfo2, Map<String,String> map) {
		RowBounds rowBounds = new RowBounds(pageInfo2.getOffset(), pageInfo2.getLimit());
		System.out.println("ref="+ref);
		List<CatBean> grid = sqlSessionTemplate.selectList(namespace+".GridCat",ref,rowBounds);
		return grid;
	}
		//추가
		// 2차 카테고리 목록 조회
		public List<RefRefBean> selectRef2(String ref) {
			System.out.println("ref == "+ref);
			List<RefRefBean> list2 = sqlSessionTemplate.selectList(namespace+".SelectRef2",ref);
			return list2;
		}
		//추가
		// 2차 카테고리 서비스 조회
		public List<CatBean> getCatList2(String ref2) {
			System.out.println("ref2 == "+ref2);
			List<CatBean> list3 = sqlSessionTemplate.selectList(namespace+".GetCatList2",ref2);
			return list3;
		}
		public void insertBuy(BuyBean buy) {
			sqlSessionTemplate.insert(namespace+".InsertBuy",buy);
			
		}
		public void deleteData(int num) {
			sqlSessionTemplate.delete(namespace+".deleteData",num);
		}
		public CatBean selectAllData(int num) {
			CatBean cbean = sqlSessionTemplate.selectOne(namespace+".selectAllData",num);
			
			return cbean;
		}
		public int updateData(CatBean cat) {
			int cnt = sqlSessionTemplate.update(namespace+".updateData",cat);
			return cnt;
		}
		public List<CatBean> getCatList2(String ref2,Paging3 pageInfo3, Map<String,String> map) {
			System.out.println("ref2 == "+ref2);
			RowBounds rowBounds = new RowBounds(pageInfo3.getOffset(), pageInfo3.getLimit());
			List<CatBean> list3 = sqlSessionTemplate.selectList(namespace+".GetCatList2",ref2,rowBounds);
			return list3;
		}
		
}
