package com.adminServlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.jms.Session;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.adminServer.AdminServer;
import com.entity.FilmShow;

public class TimeServlet extends HttpServlet {

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
		String txtDate=request.getParameter("txtDate");
		//�õ�ѡ���ʱ��
		String txtTime=request.getParameter("txtTime");	
		if("::00".equals(txtTime)){
			out.print("�������ӳʱ��");
		}else{
			//System.out.println(txtTime);
			SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
			//String txtDate1=sdf.format(txtDate);
			AdminServer as=new AdminServer();
			int roomId=Integer.parseInt(request.getParameter("roomId")); 
			ArrayList<FilmShow> list=as.selFilmRoom(roomId);
			//�õ������е��ꡢ�¡��շ���dateStr1������
			String[] dateStr1=txtDate.split("-");
			//�õ�ʱ���е�ʱ���֡������timeStr1������
			String[] timeStr1=txtTime.split(":");
			//����2��int��������ʱ��
			int[] dateInt1=new int[3];
			int[] timeInt1=new int[3];
			for(int i=0;i<3;i++){
				dateInt1[i]=Integer.parseInt(dateStr1[i]);
				timeInt1[i]=Integer.parseInt(timeStr1[i]);
			}
			//�õ��û�ѡ���ʱ��
			Date filmDateTime1=new Date(dateInt1[0]-1900,dateInt1[1]-1,dateInt1[2],timeInt1[0],timeInt1[1],timeInt1[2]);
			//ѭ���õ���Ӧ��ӳ���е�Ӱ��ʱ�����dateStr2,timeStr2��
			int biaoshi=0;
			for(int i=0;i<list.size();i++){
				//ѭ���õ���ӳ���еĵ�Ӱ��ӳ���ڡ�ʱ�䡢ʱ��
				String[] dateStr2=list.get(i).getShowDate().split("-");
				String[] timeStr2=list.get(i).getShowTime().split(":");
				//��Сʱ����ʱ��
				int filmLong=list.get(i).getFilmId().getFilmLong()+30;
				int[] dateInt2=new int[3];
				int[] timeInt2=new int[3];
				for(int j=0;j<3;j++){
					dateInt2[j]=Integer.parseInt(dateStr2[j]);
					timeInt2[j]=Integer.parseInt(timeStr2[j]);
				}
				//����i����Ӱ�����ڼ��ϵ�Ӱʱ���õ���Ӱ��ӳ��������
				Date filmDateTime2=new Date(dateInt2[0]-1900, dateInt2[1]-1, dateInt2[2], timeInt2[0], timeInt2[1]+filmLong, timeInt2[2]);				
				if(filmDateTime1.after(filmDateTime2)){
					biaoshi++;
				}
			}
			if(biaoshi==list.size()){
				out.print("��ʱ���û�е�Ӱ��ӳ");
				HttpSession session=request.getSession();
				session.setAttribute("txtDate",txtDate );
				session.setAttribute("txtTime",txtTime );
				session.setAttribute("roomId", roomId);
			}else{
				out.print("��ʱ����е�Ӱ��ӳ");
			}
		}
		out.close();
	}

}
