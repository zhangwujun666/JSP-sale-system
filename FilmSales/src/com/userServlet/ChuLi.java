package com.userServlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.entity.UserInfo;
import com.userServer.UserServer;

public class ChuLi extends HttpServlet {
	String num;
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		UserServer us = new UserServer();
		//�õ��û���
		String userId = request.getParameter("userId");
		int i = us.getUserId(userId);
		if(userId==""){
			out.print("���ɿ�");
		}else if(i==1){
			out.print("�Ѵ���");
			}else if(userId!=""){
				out.write("<font color='green'>��</font>");
			}	
		
	}
}
