package com.userFilmServlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.entity.Film;
import com.entity.FilmShow;
import com.entity.PingJia;
import com.entity.UserInfo;
import com.userServer.UserServer;

public class GuanZhuServlet extends HttpServlet {

	/**
	 * The doGet method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to get.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doPost(request, response);
	}
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		HttpSession session =request.getSession();
		String filmId=request.getParameter("filmId");
		UserServer us = new UserServer();
		int id=0;
		if (filmId!=null) {
			id=Integer.parseInt(filmId);
		}
		UserInfo user=(UserInfo)session.getAttribute("user");
		String userId="";
		if (user!=null) {
			userId=user.getUserId();
			session.setAttribute("pages",0);
			if (us.isAttention(id, userId)) {
				ArrayList<Film> movieList = us.getMovieById(id);
				//movieList.get(0) ��Ϊ���Ϊid�ĵ�Ӱ
				Film film = movieList.get(0);
				//out.write("�ף����Ѿ���ע���ˣ�"+"/"+film.getFilmScore());
				session.setAttribute("guanzhu", "�ף����Ѿ���ע���ˣ�");
				session.setAttribute("filmScore",film.getFilmScore());
				//System.out.println("�Թ�ע��");
			}else {
				int row=us.addAttention(id);
				int row1=us.insertGuanZhu(id, userId);
				ArrayList<Film> movieList = us.getMovieById(id);
				//movieList.get(0) ��Ϊ���Ϊid�ĵ�Ӱ
				Film film = movieList.get(0);
				session.setAttribute("film", film);
				//out.write("�ף����Ѿ���ע�ɹ���"+"/"+film.getFilmScore());
				session.setAttribute("guanzhu", "�ף����Ѿ���ע�ɹ���");
			}	
		
			
		}else {
			
			//System.out.println("��δ��¼");
			session.setAttribute("guanzhu", "��δ��¼");

		}
		response.sendRedirect("User/comment.jsp");
		
	}

}
