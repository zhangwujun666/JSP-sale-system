package com.userServlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.entity.UserInfo;
import com.userServer.UserServer;

public class AddMoney extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		if(request.getParameter("userId")!=null){
			UserServer us = new UserServer();
			UserInfo user = new UserInfo();
			String userId = request.getParameter("userId");
			double money = Double.parseDouble(request.getParameter("userMoney"));
			//System.out.println("userId"+userId+"userMoney"+money);
			int row = us.addMoney(userId,money);
			
			if(row>0){
				out.write("<font color='green'>��ֵ�ɹ�</font>");
			}else{
				out.write("<font color='red'>��ֵʧ��</font>");
			}
		}else{
			response.sendRedirect("MyHome.jsp");
		}
	}

}
