package com.adminServlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.adminServer.AdminServer;
import com.entity.Film;

public class SelFilm extends HttpServlet {

	/**
	 * 查询电影
	 * */
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
		String xz=request.getParameter("xz");
		String txtFilm=request.getParameter("txtFilm");
		HttpSession session = request.getSession();	
		AdminServer as=new AdminServer();
		ArrayList<Film> list=new ArrayList<Film>();
		if("按电影名".equals(xz)){
			if(txtFilm.length()>0){
				list=as.selByName(txtFilm);
				int biaoshi3=1;
				session.setAttribute("biaoshi3",biaoshi3);
				session.setAttribute("list",list);	
				response.sendRedirect("Admin/SelFilm.jsp");
				session.setAttribute("noFoundBiaoShi", 1);
			}else{
				//request.getSession().setAttribute("noFoundBiaoShi", 1);
				response.sendRedirect("Admin/SelFilm.jsp");
			}
		}else if("查询所有".equals(xz)){
			int biaoshi3=1;
			//noFoundBiaoShi存在时表示查到了
			request.getSession().setAttribute("noFoundBiaoShi", 1);
			session.setAttribute("biaoshi3",biaoshi3);
			//show的值确定加载主页时显示那个页面
			session.setAttribute("show",3);
			list=as.selAll();
			session.setAttribute("list",list);
			response.sendRedirect("Admin/SelFilm.jsp");
		}
		out.close();
	}

}
