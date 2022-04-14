package kr.or.ddit.board.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.board.vo.BoardVO;
import kr.or.ddit.ibatis.config.SqlMapClientFactory;

public class BoardDaoImpl implements  IBoardDao {

	private SqlMapClient  client ;
	private static IBoardDao dao;
	
	//생성자 - client객체 얻어오기 
	private BoardDaoImpl() {
		client = SqlMapClientFactory.getSqlMapClient();
	}
	
	//getInstance()메소드 - dao객체생성하고 리턴 
	public  static IBoardDao getInstance() {
		if(dao == null) dao = new BoardDaoImpl();
		
		return  dao;
	}
	
	@Override
	public List<BoardVO> 
	    selectList(Map<String, Object> map)
	    		 throws SQLException {
		
		/*
		 List<BoardVO> list = null;
		  
		 list = client.queryForList("board.selectList", map);
		 
		 return list;
	 
		*/
		return  client.queryForList("board.selectList", map);
		
	 }

	@Override
	public int totalCount(Map<String, String> map) throws SQLException {
		// TODO Auto-generated method stub
		return (int)client.queryForObject("board.totalCount",map);
	}

	@Override
	public int deleteBoard(int num) throws SQLException {
		// TODO Auto-generated method stub
		return (int)client.delete("board.deleteBoard", num);
	}

	@Override
	public int updateHit(int num) throws SQLException {
		return (int)client.update("board.updateHit", num);
	}	

}





