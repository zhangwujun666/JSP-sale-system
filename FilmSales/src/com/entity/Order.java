package com.entity;

public class Order {

	private int orderId;   //�����ţ�������
	private UserInfo userId = new UserInfo();
	private Ticket ticketId = new Ticket();
	private int count;     //��Ʊ����
	private double orderMoney; //�ܼ�
	private String orderTime;  //����ʱ��
	
	public int getOrderId() {
		return orderId;
	}
	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}
	public UserInfo getUserId() {
		return userId;
	}
	public void setUserId(UserInfo userId) {
		this.userId = userId;
	}
	public Ticket getTicketId() {
		return ticketId;
	}
	public void setTicketId(Ticket ticketId) {
		this.ticketId = ticketId;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public double getOrderMoney() {
		return orderMoney;
	}
	public void setOrderMoney(double orderMoney) {
		this.orderMoney = orderMoney;
	}
	public String getOrderTime() {
		return orderTime;
	}
	public void setOrderTime(String orderTime) {
		this.orderTime = orderTime;
	}
	
}
