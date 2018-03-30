package com.filmInterface;

import java.util.ArrayList;

import com.entity.Film;
import com.entity.FilmShow;
import com.entity.HaiBao;
import com.entity.HuoDong;
import com.entity.UserInfo;
import com.entity.Vip;

public interface UserInterface {

	
	/**
	 * �û�ע��
	 * */
	public int userReg(UserInfo user);
	
	/**
	 * �û���¼
	 * */
	public UserInfo userLogin(String userId,String userPwd);
	
	/**
	 * �û���ѯ������Ϣ
	 * */
	public UserInfo selectMe(String userId);
	
	/**
	 * �û��޸ĸ�����Ϣ
	 * */
	public int updMe(String userId);
	
	/**
	 * �û���ֵ
	 * */
	public int addMoney(String userId);
	
	/**
	 * �û���ѯ������Ӱ����ѯ��
	 * */
	public Film selFilmByName(String filmName);
	
	/**
	 * �û���ѯ����������ӳ�ĵ�Ӱ
	 * */
	public Film selFilmShowing();
	
	/**
	 * �û���ѯ���м�����ӳ�ĵ�Ӱ
	 * */
	public Film selFilmWill();
	
	/**
	 * �û������ӰƱ
	 * */
	public Film buyTicket();
	
	/**
	 * �û���ע���а��ѯ
	 * */
	public ArrayList<Film> selFilmScore();
	
	/**
	 * ��ѯ��վ�Ƽ�������ӳ�ĵ�Ӱ
	 * */
	public ArrayList<FilmShow> selFilmAdminShow();
	
	/**
	 * ��ѯ��վ�Ƽ�������ӳ�ĵ�Ӱ
	 * */
	public ArrayList<Film> selFilmAdminWill();
	
	/**
	 * ��ѯ��վ�Ƽ��ĵ�Ӱ�ĺ���
	 * */
	public ArrayList<HaiBao> selFilmHaiBao();
	
	/**
	 * ��ѯ��վ�
	 * */
	public ArrayList<HuoDong> selHuoDong();
	
	/**
	 * ��ѯ�������ڷ�ӳ�ĵ�Ӱ
	 * */
	
	public ArrayList<String> selFilmName();
	
	/**
	 * ��ѯ��Ӱ�ķ�ӳʱ��
	 * */
	public ArrayList<String> selFilmTime(String filmName);
	
	/**
	 * ��ѯ��Ӱ�ķ�ӳ��
	 * */
	public ArrayList<Object> selFilmRoom(String filmName,String filmTime);
	
	/**
	 * �û���ѯҪ��Ʊ�ĵ�Ӱ����ϸ��Ϣ
	 * */
	public ArrayList<FilmShow> selFilmShowInfo(String name,String time,String room);
	
	/**
	 * ��ѯ��ӳ������λ���(���ţ�����)
	 * */
	public int[] selRoom(int roomId);
	
	/**
	 * �ж���λ�Ƿ��𻵣�0��û�У�1�����ˣ�
	 * */
	public int selSeatState(int roomId,int seatNum);
	/**
	 * ��ѯ��λ�Ƿ��ѱ�����
	 * */
	public boolean selSeatNum(int showId,int seatNum);
	
	/**
	 * ��ѯ��Ա�Ż�����
	 * */
	public Vip selectVip(int num);
	
	/**
	 * �û�����ķ���
	 * */
	public int FuKuan(String userId,String showId,String[] seatNum,String price);
	
	/**
	 * ��ѯ�û���ĳ�������Ѷ�������Ʊ
	 * */
	public int seleNum(String userId,int showId);
	
	/**
	 * �������Ų�ѯ����
	 * */
	public ArrayList selOrder(String ticketId,String userId,String userPwd);
	
	/**
	 * �û��˶�
	 * */
	public int delTicket(String ticketId,double money,String userId);
}
