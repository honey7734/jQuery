package kr.or.ddit.lprod.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.lprod.service.ILprodService;
import kr.or.ddit.lprod.service.LprodService;
import kr.or.ddit.lprod.vo.LprodVO;

/**
 * Servlet implementation class LprodServlet
 */
@WebServlet("/LprodServlet.do")
public class LprodServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LprodServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ILprodService service = LprodService.getInstance();
		
		List<LprodVO> list = service.selectAll();
		
		request.setAttribute("listvalue", list);
		
		request.getRequestDispatcher("0329/lprodList.jsp").forward(request, response);
	}

}
