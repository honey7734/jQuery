package kr.or.ddit.board.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.board.vo.BoardVO;

public interface IBoardService {
	
	//리스트 출력
	public List<BoardVO> selectList(Map<String, Integer> map);
	
	//전체 글 갯수 가져오기
	public int totalCount();

	//page정보 구하기
	public Map<String, Object> getPageInfo(int page);
}
