package com.adminServlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.adminServer.AdminServer;
import com.entity.Film;

public class AddSevlet extends HttpServlet {

	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		doPost(request, response);
		
	}

	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html；charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		String filmImg="Image/17.jpg";
		filmImg=request.getParameter("getImage");
		String filmName=request.getParameter("filmName");
		String filmType=request.getParameter("filmType");
		int filmLong=Integer.parseInt(request.getParameter("filmLong")); 		
		String director=request.getParameter("director");
		String actor=request.getParameter("actor");
		String filmLanguage=request.getParameter("filmLanguage");
		String filmState1=request.getParameter("filmState");
		int filmState=0;
		if(filmState1.equals("未上映")){
			filmState=2;
		}else if(filmState1.equals("正在上映")){
			filmState=0;
		}else if(filmState1.equals("即将上映")){
			filmState=1;
		}
		String jianJie=request.getParameter("JianJie");
		Film film=new Film();
		film.setActor(actor);
		film.setDirector(director);
		film.setFilmImg(filmImg);
		film.setFilmLanguage(filmLanguage);
		film.setFilmLong(filmLong);
		film.setFilmState(filmState);
		film.setFilmType(filmType);
		film.setJianJie(jianJie);
		film.setFilmName(filmName);
		request.getSession().setAttribute("film", film);
		int biaoshi1=1;
		request.getSession().setAttribute("biaoshi1", biaoshi1);
		response.sendRedirect("Admin/AddFilm.jsp");
//		AdminServer as=new AdminServer();
//		int row=as.addFilm(film);
//		if(row>0){
//			response.sendRedirect("Admin/AddFilmMsg1.jsp");
//		}else{
//			response.sendRedirect("Admin/AddFilmMsg.jsp");
//		}
		out.close();
	}

}
