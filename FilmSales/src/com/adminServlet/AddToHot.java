package com.adminServlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.adminServer.AdminServer;

public class AddToHot extends HttpServlet {

	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		doPost(request, response);
	}

	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		String[] hotFilm=request.getParameterValues("checkHot");
		AdminServer as=new AdminServer();
		int row=0;
		int id=1;
		HttpSession session=request.getSession();
		for(int i=0;i<hotFilm.length;i++){
			as.updHotFilm(Integer.parseInt(hotFilm[i]),id);
			id++;
			row++;
		}
			session.setAttribute("row", row);
			session.setAttribute("hot",1 );//判断是否执行添加操作
			response.sendRedirect("Admin/UpdHotFilm.jsp");
		out.close();
	}

}
