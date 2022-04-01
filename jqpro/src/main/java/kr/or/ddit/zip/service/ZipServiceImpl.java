package kr.or.ddit.zip.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.zip.dao.IZipDao;
import kr.or.ddit.zip.dao.ZipDaoImpl;
import kr.or.ddit.zip.vo.ZipVO;

public class ZipServiceImpl implements IZipService{
	
	private IZipDao dao;
	private static IZipService service;
	private ZipServiceImpl() {
		dao = ZipDaoImpl.getInstance();
	}
	public static IZipService getInstance() {
		if(service == null)service = new ZipServiceImpl();
		
		return service;
	}
	
	@Override
	public List<String> selectSido() {
		return dao.selectSido();
	}

	@Override
	public List<String> selectGugun(String sido) {
		return dao.selectGugun(sido);
	}

	@Override
	public List<String> selectDong(Map<String, String> map) {
		return dao.selectDong(map);
	}

	@Override
	public List<ZipVO> selectZiptb(Map<String, String> map) {
		return dao.selectZiptb(map);
	}

}
