package kr.or.ddit.zip.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.zip.vo.ZipVO;

public interface IZipService {
	
	public List<String> selectSido();
	
	public List<String> selectGugun(String sido);
	
	public List<String> selectDong(Map<String,String> map);
	
	public List<ZipVO> selectZiptb(Map<String,String> map);
}
