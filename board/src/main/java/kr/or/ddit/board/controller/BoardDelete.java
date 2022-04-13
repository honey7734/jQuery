package kr.or.ddit.board.controller;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.board.service.BoardServiceImpl;
import kr.or.ddit.board.service.IBoardService;

/**
 * Servlet implementation class BoardDelete
 */
@WebServlet("/BoardDelete.do")
public class BoardDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardDelete() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		
		int rqnum = Integer.parseInt(request.getParameter("num"));
		int rqpage = Integer.parseInt(request.getParameter("page"));
		String rqtype = request.getParameter("type");
		String rqword = request.getParameter("word");
		
		
		IBoardService  service = BoardServiceImpl.getInstance();
		
		
		int num = service.deleteBoard(rqnum);
		
		
		
		//totalPage를 다시 구하기 
		Map<String, Object>  map = 
			service.getPageInfo(rqpage, rqtype, rqword);
			
		//request에 공유 데이타 저장 
		request.setAttribute("qeasweqwa", num);
		request.setAttribute("skjdhskfh", map.get("totalpage"));
		
		//jsp로 forward - -json생성
		request.getRequestDispatcher("work/deleteboard.jsp")
		             .forward(request, response);
		
		
		
		
	}
	
}























