package kr.or.ddit.member.controller;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;

import kr.or.ddit.member.service.IMemberService;
import kr.or.ddit.member.service.MemberServiceImpl;
import kr.or.ddit.member.vo.MemberVO;

/**
 * Servlet implementation class Insert
 */
@WebServlet("/Insert.do")
public class Insert extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Insert() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		
		//1. 전송데이터 받기
		MemberVO vo = new MemberVO();
//		vo.setMem_id(request.getParameter("mem_id")); ... 9개 다 쓰기 ? -> 라이브러리 이용
	
			try {
				BeanUtils.populate(vo, request.getParameterMap());
			} catch (IllegalAccessException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (InvocationTargetException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		
		//2. service객체 얻기
		IMemberService service = MemberServiceImpl.getInstance();
		
		//3. service메소드 호출하기	
		String res = service.insertMember(vo);
		
		//4. 결과값을 request에 저장하기
		request.setAttribute("insertvalue", res);
		request.setAttribute("id", vo.getMem_id());
		
		//5. jsp로 forward
		request.getRequestDispatcher("member/result.jsp").forward(request, response);
	}

}
