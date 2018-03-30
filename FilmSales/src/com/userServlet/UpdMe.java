package com.userServlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.entity.UserInfo;
import com.userServer.UserServer;

public class UpdMe extends HttpServlet {

	

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		UserServer us = new UserServer();
		UserInfo user = new UserInfo();
		String userSex = request.getParameter("userSex");
		String userName = request.getParameter("userName");
		String sex = new String(userSex.getBytes("iso-8859-1"),"UTF-8"); //�����������
		if(sex.equals("��")||sex.equals("Ů")){
			//System.out.println("fasdg");
			String name = new String(userName.getBytes("iso-8859-1"),"UTF-8"); //�����������
			user.setUserId(request.getParameter("userId"));
			user.setUserName(name);
			user.setUserSex(sex);
			user.setUserEmail(request.getParameter("userEmail"));	
			user.setUserTelephone(request.getParameter("userTelephone"));
			user.setUserIdCard(request.getParameter("userIdCard"));
			int row = us.updMe(user);
			if(row>0){
				out.write("<font color='green'>�޸ĳɹ�</font>");
			}else{
				out.write("<font color='red'>�޸�ʧ��</font>");
			}
		}else{
			String name = new String(userName.getBytes("iso-8859-1"),"GBK"); //�����������
			String sex1 = new String(userSex.getBytes("iso-8859-1"),"GBK"); //�����������
			user.setUserId(request.getParameter("userId"));
			user.setUserName(name);
			user.setUserSex(sex1);
			//System.out.println("fdf=====fsdf"+sex1);
			user.setUserEmail(request.getParameter("userEmail"));	
			user.setUserTelephone(request.getParameter("userTelephone"));
			user.setUserIdCard(request.getParameter("userIdCard"));
			int row = us.updMe(user);
			if(row>0){
				out.write("<font color='green'>�޸ĳɹ�</font>");
			}else{
				out.write("<font color='red'>�޸�ʧ��</font>");
			}
		}
	}

}
