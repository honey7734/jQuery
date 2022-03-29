package kr.or.ddit.lprod.service;

import java.security.Provider.Service;
import java.util.List;

import kr.or.ddit.lprod.dao.ILprodDao;
import kr.or.ddit.lprod.dao.LprodDaoImpl;
import kr.or.ddit.lprod.vo.LprodVO;

public class LprodService implements ILprodService {
	
	private ILprodDao dao;
	private static ILprodService service;
	private LprodService() {
		dao = LprodDaoImpl.getInstance();
	}
	
	public static ILprodService getInstance() {
		if(service == null) service = new LprodService();
		
		return service;
	}
	
	@Override
	public List<LprodVO> selectAll() {
		return dao.selectAll();
	}

}
