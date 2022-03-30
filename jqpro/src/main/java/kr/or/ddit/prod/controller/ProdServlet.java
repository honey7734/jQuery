
package kr.or.ddit.prod.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

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
		
		//gson사용하기
		Gson gson = new Gson();
		
		//json형태의 문자로 변환
		String result = gson.toJson(list);
		
		response.setContentType("application/json;charset=utf-8");
		PrintWriter out =  response.getWriter();
		
		out.print(result);
		out.flush();
		
//		request.setAttribute("listvalue", list);

//		request.getRequestDispatcher("0330/prodList.jsp").forward(request, response);
		
	
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// selectById
		
		//1. 전송시 데이터 받기
		String id = request.getParameter("id");				
		//2. service 객체 얻기
		IProdService service = ProdServiceImpl.getInstance();				
		//3. service메소드 호출하기 - 결과값 리턴받기
		ProdVO vo = service.selectById(id);	
		
		Gson gson = new Gson();
		String result = gson.toJson(vo);
		
		response.setContentType("application/json;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		out.print(result);
		out.flush();
		
//		//4. request에 결과값을 저장
//		request.setAttribute("vovalue", vo);				
//		//5. jsp로 위임(forward)하여 응답데이터 생성하기 (출력 또는 json데이터)
//		request.getRequestDispatcher("0330/prodVo.jsp").forward(request, response);
	}

}
