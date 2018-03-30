package com.userFilmServlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import sun.java2d.pipe.SpanShapeRenderer.Simple;

import com.entity.Film;
import com.entity.FilmShow;
import com.filmDao.DBHelp;
import com.userServer.UserServer;

public class QuickBuyServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		//System.out.println("laile");
		UserServer us = new UserServer();
		String date[]=us.getDate();
		String today =date[0];
		String tomorrow =date[1];
		String houtian=date[2];
		String week=date[3];
		HttpSession session = request.getSession();
		session.setAttribute("today", today);
		session.setAttribute("tomorrow", tomorrow);
		session.setAttribute("houtian", houtian);
		session.setAttribute("week", week);
		String dates="";
		String selectName="";
		//
		if(request.getParameter("date")==null){
			if(request.getParameter("filmName")==null){
				dates=date[0];
			}else{
				//�˴�session������Ϊ�� ��ü����ж�
				if(session.getAttribute("dates").toString()!=null){
					dates=session.getAttribute("dates").toString();
				}else{
					response.sendRedirect("ERROR.jsp");
				}	
			}		
		}else{
			dates=request.getParameter("date");
		}
		
		ArrayList<FilmShow> showList;
		ArrayList<FilmShow> allShowList = us.getFilmByDate(dates);
		session.setAttribute("totalShow", allShowList.size());
		if(request.getParameter("showall")!=null){
			//�õ���ѡ���ڷ�ӳ�����е�Ӱ  Ĭ���ǵ���
			showList=us.getFilmByDate(dates);		
		}else{
			showList = us.getTopTenByDate(dates);
		}
		//System.out.println(showList.size());
		session.setAttribute("showList", showList);
		//�õ������ӳ���α�ĵ�һ����Ӱ
		if(showList.size()>0){	
			//System.out.println("�����е�Ӱ��ӳ");
			//�õ���Ӱ��ΪfilmName ����ΪDates�ĵ�Ӱ��Ӱ����
			if(request.getParameter("filmName")==null){
				//��������е�Ӱ��ӳ ���� ���ǵ��ѡ��ĵ�Ӱ���ֽ�����  ����ѡ��ĵ�Ӱ������Ϊ����ĵ�һ����Ӱ
				//System.out.println("�е�Ӱ��ûѡ��Ӱ��Ĭ�ϵ�һ����Ӱ");
				selectName=showList.get(0).getFilmId().getFilmName();	
			//����ǵ����Ӱ���ֹ����� ��Ѵ������ĵ�Ӱ���� ������ǰ��ѡ��ĵ�Ӱ
			}else {
				//System.out.println("ѡ�˵�Ӱ");
				selectName=request.getParameter("filmName");
				//System.out.println(selectName+"*****************8");
				//�������� 
				selectName = new String(selectName.getBytes("ISO-8859-1"),"utf-8");
				session.setAttribute("selectName",selectName);
			}
			session.setAttribute("selectName",selectName);
			
			ArrayList<FilmShow> filmDateShow = us.getFilmShowByNameDate(selectName, dates);
			session.setAttribute("filmDateShow", filmDateShow);
		}else {
			session.setAttribute("selectName", "�������޵�Ӱ��ӳ���޷�ѡ��");
			//session.setAttribute("filmDateShow", null);
			session.removeAttribute("filmDateShow");
		}
		//��ѯ��ѡ��Ӱ����ϸ��Ϣ
		DBHelp db = new DBHelp();
		String sql="select * from film where filmName='"+selectName+"'";
		ArrayList<Film> films = db.executeQuery(sql, null);
		if(films.size()>0){
			Film showfilm = films.get(0);
			session.setAttribute("showfilm", showfilm);
		}else{
			session.setAttribute("showfilm", null);
		}
		session.setAttribute("listSize", showList.size());
		//��η��� ��ҳ��ʼ��ʱ���õ�
		session.setAttribute("dates", dates);
		response.sendRedirect("User/quickBuy.jsp?fromServlet=1");
		
		
	}
	
}
