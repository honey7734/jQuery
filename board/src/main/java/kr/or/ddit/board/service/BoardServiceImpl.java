package kr.or.ddit.board.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kr.or.ddit.board.dao.BoardDaoImpl;
import kr.or.ddit.board.dao.IBoardDao;
import kr.or.ddit.board.vo.BoardVO;

public class BoardServiceImpl implements IBoardService{
	private IBoardDao dao;
	
	private static IBoardService service;

	private BoardServiceImpl() {
		dao = BoardDaoImpl.getInstance();
	}
	
	public static IBoardService getInstance() {
		if(service==null) service = new BoardServiceImpl();
		
		return service;
	}

	@Override
	public List<BoardVO> selectList(Map<String, Integer> map) {
		List<BoardVO> list = null;
		
		try {
			list = dao.selectList(map);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public int totalCount() {
		int count = 0;
		
		try {
			count = dao.totalCount();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return count;
	}

	@Override
	public Map<String, Object> getPageInfo(int page) {
		Map<String, Object> map = new HashMap<String, Object>();
		
		//한 페이지당 출력할 글 개수
		int perlist = 3;
		
		//전체 글 개수
		int count = this.totalCount();
		
		//전체 페이지 수
		int  totalPage = (int) Math.ceil((double)page / perlist);
		
		// start 	// end
		int start = (page - 1) * perlist + 1;
		int end =  start + perlist -1;
		if(end > count) end = count;
		
		map.put("start", start);
		map.put("end", end);
		
		return map;
	}


}
