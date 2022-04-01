package kr.or.ddit.zip.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import kr.or.ddit.zip.service.IZipService;
import kr.or.ddit.zip.service.ZipServiceImpl;
import kr.or.ddit.zip.vo.ZipVO;

/**
 * Servlet implementation class ZipController
 */
@WebServlet("/ZipController.do")
public class ZipController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ZipController() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int flag = Integer.parseInt(request.getParameter("flag"));
		if(flag == 0) {
			inputSido(request, response);
		}
		
		if(flag == 1) {
			inputGugun(request, response);
		}
		
		if(flag == 2) {
			inputDong(request, response);
		}
		
		if(flag == 3) {
			inputDetail(request, response);
		}
	}
	
	protected void inputSido(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		IZipService service = ZipServiceImpl.getInstance();
		
		List<String> list = service.selectSido();
		
		Gson gson = new Gson();
		
		String result = gson.toJson(list);
		
		response.setContentType("application/json;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		out.print(result);
		out.flush();
	}

	protected void inputGugun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String sido = request.getParameter("sido");
		
		IZipService service = ZipServiceImpl.getInstance();
		
		List<String> list = service.selectGugun(sido);
		
		Gson gson = new Gson();
		String result = gson.toJson(list);
		
		response.setContentType("application/json;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		out.print(result);
		out.flush();
	}
	
	protected void inputDong(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String sido = request.getParameter("sido");
		String gugun = request.getParameter("gugun");
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("sido", sido);
		map.put("gugun", gugun);
		
		IZipService service = ZipServiceImpl.getInstance();
		
		List<String> list = service.selectDong(map);
		
		Gson gson = new Gson();
		String result = gson.toJson(list);
		
		response.setContentType("application/json;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		out.print(result);
		out.flush();
	}
	
	protected void inputDetail(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String sido = request.getParameter("sido");
		String gugun = request.getParameter("gugun");
		String dong = request.getParameter("dong");
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("sido", sido);
		map.put("gugun", gugun);
		map.put("dong", dong);
		
		IZipService service = ZipServiceImpl.getInstance();
		
		List<ZipVO> list = service.selectZiptb(map);
		
		Gson gson = new Gson();
		String result = gson.toJson(list);
		
		response.setContentType("application/json;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		out.print(result);
		out.flush();
	}
	

}
