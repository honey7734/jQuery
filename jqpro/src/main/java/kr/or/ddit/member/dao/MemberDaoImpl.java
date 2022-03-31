package kr.or.ddit.member.dao;

import java.sql.SQLException;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.ibatis.config.SqlMapClientFactory;
import kr.or.ddit.member.vo.MemberVO;
import kr.or.ddit.member.vo.ZipVO;

// mapper접근 - SqlMapClient객체가 필요
// dao클래스 객체 생성 - 리턴	 - service에서 사용

public class MemberDaoImpl implements IMemberDao {
	
	private SqlMapClient client;
	private static IMemberDao dao;
	
	private MemberDaoImpl() {
		client = SqlMapClientFactory.getSqlMapClient();
	}
	
	public static IMemberDao getInstance() {
		if(dao == null) dao = new MemberDaoImpl();
		
		return dao;
	}
	
	@Override
	public List<MemberVO> selectAll() {
		
		List<MemberVO> list = null;
		
		try {
			list = client.queryForList("member.selectAll");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public String idCheck(String id) {
		String result = null;
		
		try {
			result = (String)client.queryForObject("member.idCheck", id);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return result;
	}

	@Override
	public List<ZipVO> zipList(String data) {
		List<ZipVO> list = null;
		
		try {
			list = client.queryForList("zip.zipList", data);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public String insertMember(MemberVO vo) {
		String result = null;
		try {
			result = (String) client.insert("member.insertMember", vo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
	
}
