package kr.or.ddit.buyer.service;

import java.util.List;

import kr.or.ddit.buyer.dao.BuyerDaoImpl;
import kr.or.ddit.buyer.dao.IBuyerDao;
import kr.or.ddit.buyer.vo.BuyerVO;

public class BuyerService implements IBuyerService {

	private IBuyerDao dao;
	private static IBuyerService service;
	private BuyerService() {
		dao = BuyerDaoImpl.getInstance();
	}
	
	public static IBuyerService getInstance() {
		if(service == null) service = new BuyerService();
		
		return service;
	}
	
	@Override
	public List<BuyerVO> selectByName() {
		return dao.selectByName();
	}

	@Override
	public BuyerVO idByDetail(String id) {
		return dao.idByDetail(id);
	}

}
