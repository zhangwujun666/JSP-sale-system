package com.entity;

public class Ticket {

	private int ticketId;    //������������
	private UserInfo userId = new UserInfo();
	private int seatNum;     //����
	private double price;    //���յļ۸�
	private FilmShow showId = new FilmShow();
	private String orderTime;    
	
	public int getTicketId() {
		return ticketId;
	}
	public void setTicketId(int ticketId) {
		this.ticketId = ticketId;
	}
	public UserInfo getUserId() {
		return userId;
	}
	public void setUserId(UserInfo userId) {
		this.userId = userId;
	}

	public int getSeatNum() {
		return seatNum;
	}
	public void setSeatNum(int seatNum) {
		this.seatNum = seatNum;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public FilmShow getShowId() {
		return showId;
	}
	public void setShowId(FilmShow showId) {
		this.showId = showId;
	}
	public String getOrderTime() {
		return orderTime;
	}
	public void setOrderTime(String orderTime) {
		this.orderTime = orderTime;
	}
	
	
}
