package kr.or.ddit.board.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kr.or.ddit.board.dao.BoardDaoImpl;
import kr.or.ddit.board.dao.IBoardDao;
import kr.or.ddit.board.vo.BoardVO;

public class BoardServiceImpl  implements IBoardService{

	private IBoardDao  dao;
	private static IBoardService  service;
	
	//생성자  - dao객체 얻기 
	private BoardServiceImpl() {
		dao = BoardDaoImpl.getInstance();
	}
	
	
	
	//getInstance()메소드 - service객체 생성, 리턴 
	public static IBoardService getInstance() {
		if(service == null) service = new BoardServiceImpl();
		
		return service;
	}
	
	
	@Override
	public List<BoardVO> selectList(Map<String, Object> map) {
		
		List<BoardVO>  list = null;
		 
		 
		 try {
			list = dao.selectList(map);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	 
		return list;
	
	}


	@Override
	public int totalCount(Map<String, String> map) {
		int  count = 0;
		
		try {
			count = dao.totalCount(map);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return count;
	}


	@Override
	public Map<String, Object> 
	   getPageInfo(int page, String type, String word) {
		
		Map<String, Object>  map = new HashMap<String, Object>();
		
		//한페이지당 출력할 글 갰수 
		int perlist = 3;
		
		//한 화면에 츨력할 페이지갯 수 : 
		int perpage = 2;
		
		
		Map<String, String>  paramap = new HashMap<String, String>();
		paramap.put("stype", type);
		paramap.put("sword", word);
		
				
		//전체 글갯수
		int count = this.totalCount(paramap);
		
		//전체페이지 수 
		int  totalPage =(int)Math.ceil((double)count /  perlist);
		
		//start  //end 
		int start = (page -1) * perlist + 1;
		int end = start + perlist - 1;
		if(end > count) end = count;
		
			
		//startPage, endPage구하기 
		//page 1 = >1 
		//page 2 => 1
		//page 3  =: 3
		//page 4 => 3 4   
		//page 5 => 5 6
		//page 6 => 5 6
		//page 7 => 7 8
		int startPage = ((page -1) / perpage * perpage ) + 1;
		int endPage = startPage + perpage -1;
		
		if(endPage > totalPage ) endPage = totalPage ;
		
		map.put("start", start);
		map.put("end", end);
		map.put("startpage", startPage);
		map.put("endpage", endPage);
		map.put("totalpage", totalPage);
				
		return map;
	}


	@Override
	public int deleteBoard(int num) {
		int  res = 0;
		
		try {
			res = dao.deleteBoard(num);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return res;
	}
}





