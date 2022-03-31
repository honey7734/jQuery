package kr.or.ddit.member.dao;

import java.util.List;

import kr.or.ddit.member.vo.MemberVO;
import kr.or.ddit.member.vo.ZipVO;

public interface IMemberDao {

	public List<MemberVO> selectAll() ;
	
	//중복검사 메소드
	public String idCheck(String id);
		
	//우편번호검색
	public List<ZipVO> zipList(String data);
		
	//저장하기
	public String insertMember(MemberVO vo);
	
}
