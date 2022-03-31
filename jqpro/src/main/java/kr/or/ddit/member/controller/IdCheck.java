package kr.or.ddit.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.member.service.IMemberService;
import kr.or.ddit.member.service.MemberServiceImpl;

/**
 * Servlet implementation class IdCheck
 */
@WebServlet("/IdCheck.do")
public class IdCheck extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public IdCheck() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//1. 전송 데이터 받기
		String input = request.getParameter("id");
		
		//2. service객체 생성
		IMemberService service = MemberServiceImpl.getInstance();
		
		//3. service메소드 호출 - 결과값 받기(mem_id)
		String id = service.idCheck(input);
		//결과값은 a001->a001, k123 -> null
		
		
		//4. request에 저장
		request.setAttribute("idresult", id);
		
		//5. JSP로 forward
		request.getRequestDispatcher("member/idcheck.jsp").forward(request, response);
	}

	

}
