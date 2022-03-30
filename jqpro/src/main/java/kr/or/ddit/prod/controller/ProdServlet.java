
package kr.or.ddit.prod.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.prod.service.IProdService;
import kr.or.ddit.prod.service.ProdServiceImpl;
import kr.or.ddit.prod.vo.ProdVO;

/**
 * Servlet implementation class ProdController
 */
@WebServlet("/ProdServlet.do")
public class ProdServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProdServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// selectByLgu
		
		String lgu = request.getParameter("lgu");
		
		IProdService service = ProdServiceImpl.getInstance();
		
		List<ProdVO> list = service.selectByLgu(lgu);
		
		request.setAttribute("listvalue", list);
		
		request.getRequestDispatcher("0330/prodList.jsp").forward(request, response);
		
	
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// selectById
		
		//1. 전송시 데이터 받기
						
		//2. service 객체 얻기
						
		//3. service메소드 호출하기 - 결과값 리턴받기
						
		//4. request에 결과값을 저장
						
		//5. jsp로 위임(forward)하여 응답데이터 생성하기 (출력 또는 json데이터)
	}

}
