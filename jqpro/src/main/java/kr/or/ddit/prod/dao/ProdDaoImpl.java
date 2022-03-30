package kr.or.ddit.prod.dao;

import java.sql.SQLException;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.ibatis.config.SqlMapClientFactory;
import kr.or.ddit.prod.vo.ProdVO;

public class ProdDaoImpl implements IProdDao {

	private SqlMapClient client;
	private static IProdDao dao;
	private ProdDaoImpl() {
		client = SqlMapClientFactory.getSqlMapClient();
	}
	
	public static IProdDao getInstance() {
		if(dao == null) dao = new ProdDaoImpl();
		
		return dao;
	}
	
	@Override
	public List<ProdVO> selectByLgu(String lgu) {
		List<ProdVO> list = null;
		
		try {
			list = client.queryForList("prod.selectByLgu",lgu);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public ProdVO selectById(String id) {
		ProdVO vo = null; 
		
		try {
			vo = (ProdVO)client.queryForObject("prod.selectById", id);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return vo;
	}

}
