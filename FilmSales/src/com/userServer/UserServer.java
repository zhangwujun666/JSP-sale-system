package com.userServer;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import com.entity.Film;
import com.entity.FilmShow;
import com.entity.HaiBao;
import com.entity.HuoDong;
import com.entity.PingJia;
import com.entity.Room;
import com.entity.Seat;
import com.entity.Ticket;
import com.entity.UserInfo;
import com.entity.Vip;
import com.filmDao.DBHelp;
import com.filmInterface.UserInterface;

public class UserServer implements UserInterface {
	
	DBHelp db = new DBHelp();
	public int addMoney(String userId) {
		// TODO Auto-generated method stub
		return 0;
	}

	public Film buyTicket() {
		// TODO Auto-generated method stub
		return null;
	}

	public Film selFilmByName(String filmName) {
		// TODO Auto-generated method stub
		return null;
	}

	public Film selFilmShowing() {
		// TODO Auto-generated method stub
		return null;
	}

	public Film selFilmWill() {
		// TODO Auto-generated method stub
		return null;
	}

	/**
	 * ͨ��userId��ѯ������Ϣ
	 * */
	public UserInfo selectMe(String userId) {
		// TODO Auto-generated method stub
		String sql = "select * from userinfo where userId=?";
		Object[] o = {userId};
		try {
			ResultSet rs=db.selSql(sql, o);
			if(rs.next()){
				UserInfo user = new UserInfo();
				user.setUserId(rs.getString("userId"));
				user.setUserName(rs.getString("userName"));
				user.setUserSex(rs.getString("userSex"));
				user.setUserPwd(rs.getString("userPwd"));
				user.setUserEmail(rs.getString("userEmail"));
				user.setUserScore(rs.getInt("userScore"));
				user.setUserTelephone(rs.getString("userTelephone"));
				user.setUserIdCard(rs.getString("userIdCard"));
				user.setUserMoney(rs.getDouble("userMoney"));
				db.closeAll();
				return user;
 			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		db.closeAll();
		return null;
	}
	
	/**
	 * �鿴�û�����
	 * */
	public ArrayList<PingJia> getAllPingJia(String userId,int page){
		ArrayList<PingJia> PjList = new ArrayList<PingJia>();
		String sql = "select filmName,pingJia,time from pingJia inner join film on film.filmId=pingJia.filmId where userId=? limit "+(page*4)+",4";
		Object[] o = {userId};
		try {
			ResultSet rs = db.selSql(sql, o);
			while(rs.next()){
				PingJia pj = new PingJia();
				pj.getFilmId().setFilmName(rs.getString("filmName"));
				pj.setPingJia(rs.getString("pingJia"));
				pj.setTime(rs.getString("time"));
				PjList.add(pj);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		db.closeAll();
		return PjList;
		
	}
	
	/**
	 * �޸�����
	 * */
	public int updMiMa(String userId,String userPwd) {
		// TODO Auto-generated method stub
		UserInfo users = userLogin(userId,userPwd); //�ж�ԭʼ�����Ƿ���ȷ
		if(users!=null){
			String sql = "update  userinfo set userPwd=? where userId=?" ;
			Object[] o = {userPwd,userId};
			int row = db.updSql(sql, o);
			db.closeAll();
			return row;
		}else{
			db.closeAll();
			return 0;
		}
	}
	
	/**
	 * ��ֵ
	 * */
	public int addMoney(String userId,double money) {
		// TODO Auto-generated method stub
		UserInfo users = selectMe(userId);
		double userMoney = users.getUserMoney()+ money;
		String sql = "update  userinfo set userMoney=? where userId=?";
		Object[] o ={userMoney,userId};
		int row= db.updSql(sql, o);
		if(row>0){
			db.closeAll();
			return row;
		}
		db.closeAll();
		return 0;
	}

	public int updMe(String userId) {
		// TODO Auto-generated method stub
		return 0;
	}
	
	/**
	 * �޸ĸ�����Ϣ
	 * */
	public int updMe(UserInfo user) {
		// TODO Auto-generated method stub
		String sql = "update  userinfo set userName=?,userSex=?,userEmail=?,userTelephone=?,userIdCard=? where userId=?" ;
		Object[] o = {user.getUserName(),user.getUserSex(),user.getUserEmail(),
				user.getUserTelephone(),user.getUserIdCard(),user.getUserId()};
		int row = db.updSql(sql, o);
		db.closeAll();
		return row;
	}
	/**
	 * �û���¼
	 * */
	public UserInfo userLogin(String userId, String userPwd) {
		// TODO Auto-generated method stub
		String sql = "select * from userinfo where userId=? and userPwd=?";
		Object[] o = {userId,userPwd};
		ResultSet rs = db.selSql(sql, o);
		UserInfo user = null;
		try {
			if(rs.next()){
				user = new UserInfo();
				user.setUserId(rs.getString("userId"));
				user.setUserName(rs.getString("userName"));
				user.setUserSex(rs.getString("userSex"));
				user.setUserEmail(rs.getString("userEmail"));
				user.setUserTelephone(rs.getString("userTelephone"));
				user.setUserIdCard(rs.getString("userIdCard"));
				user.setUserScore(rs.getInt("userScore"));
				user.setUserMoney(rs.getDouble("userMoney"));	
			}else{
				db.closeAll();
				return null;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		db.closeAll();
		return user;
	}

	/**
	 * �û�ע��
	 * */
	public int userReg(UserInfo user) {
		// TODO Auto-generated method stub
		String sql = "insert into userinfo" +
				"(userId,userName,userSex,userPwd,userEmail," +
				"userTelephone,userIdCard)" +
				" values (?,?,?,?,?,?,?)";
		Object[] o = {user.getUserId(),user.getUserName(),user.getUserSex(),user.getUserPwd(),user.getUserEmail(),
				user.getUserTelephone(),user.getUserIdCard()};
		int row = db.updSql(sql, o);
		db.closeAll();
		return row;
	}
	
	/**
	 * �ж��û����Ƿ��ظ�
	 * */
	public int getUserId(String userId){
		int i = 0;
		String sql = "select * from userinfo where userId=? ";
		Object[] o = {userId};
		try {
			ResultSet rs = db.selSql(sql, o);
			while(rs.next()){
				i=1;			
			}		
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		db.closeAll();
		return i;	
	}
	
	/**
	 * �û���ע���а��ѯ
	 * */
	public ArrayList<Film> selFilmScore() {
		// TODO Auto-generated method stub
		ArrayList<Film> list = new ArrayList<Film>();
		String sql = "select filmId,filmName,filmScore from film order by filmScore desc limit 10";
		try {
			ResultSet rs = db.getConn().prepareStatement(sql).executeQuery();
			while(rs.next()){
				Film film = new Film();
				film.setFilmId(rs.getInt("filmId"));
				film.setFilmName(rs.getString("filmName"));
				film.setFilmScore(rs.getInt("filmScore"));
				list.add(film);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		db.closeAll();
		return list;
	}
	
	/**
	 * �����վ�Ƽ���������ӳ�ĵ�Ӱ����Ϣ
	 * */
	public ArrayList<FilmShow> selFilmAdminShow() {
		// TODO Auto-generated method stub
		ArrayList<FilmShow> list = new ArrayList<FilmShow>();
		String sql = "select film.filmId,filmName,filmLong,director,actor,filmType,filmPrice,filmImg from filmshow " +
		"inner join admin_showing on filmshow.filmId=admin_showing.filmId inner join film on filmshow.filmId=film.filmId";
		try {
			ResultSet rs = db.getConn().prepareStatement(sql).executeQuery();
			while(rs.next()){
				FilmShow film = new FilmShow();
				film.getFilmId().setFilmId((rs.getInt("filmId")));
				film.getFilmId().setDirector(rs.getString("director"));
				film.getFilmId().setActor(rs.getString("actor"));
				film.getFilmId().setFilmType(rs.getString("filmType"));
				film.getFilmId().setFilmLong(rs.getInt("filmLong"));
				film.getFilmId().setFilmName(rs.getString("filmName"));
				film.setFilmPrice(rs.getDouble("filmPrice"));
				film.getFilmId().setFilmImg(rs.getString("filmImg"));
				list.add(film);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		db.closeAll();
		return list;
	}

	/**
	 * �����վ�Ƽ��ļ�����ӳ�ĵ�Ӱ����Ϣ
	 * */
	public ArrayList<Film> selFilmAdminWill() {
		// TODO Auto-generated method stub
		ArrayList<Film> list = new ArrayList<Film>();
		String sql = "select film.filmId,filmName,filmLong,director,actor,filmType,filmImg from film " +
		"inner join admin_will on film.filmId=admin_will.filmId";
		try {
			ResultSet rs = db.getConn().prepareStatement(sql).executeQuery();
			while(rs.next()){
				Film film = new Film();
				film.setFilmId(rs.getInt("filmId"));
				film.setDirector(rs.getString("director"));
				film.setActor(rs.getString("actor"));
				film.setFilmType(rs.getString("filmType"));
				film.setFilmLong(rs.getInt("filmLong"));
				film.setFilmName(rs.getString("filmName"));
				film.setFilmImg(rs.getString("filmImg"));
				list.add(film);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		db.closeAll();
		return list;
	}
	
	/**
	 * ��ѯ��վ�Ƽ��ĵ�Ӱ�ĺ���
	 * */
	public ArrayList<HaiBao> selFilmHaiBao(){
		ArrayList<HaiBao> list = new ArrayList<HaiBao>();
		String sql = "select filmId,haibao from haibao";
		try {
			ResultSet rs = db.getConn().prepareStatement(sql).executeQuery();
			while(rs.next()){
				HaiBao hb = new HaiBao();
				hb.getFilmId().setFilmId(rs.getInt("filmId"));
				hb.setHaibao(rs.getString("haibao"));
				list.add(hb);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		db.closeAll();
		return list;
	}
	
	/**
	 * ��ѯ��վ�
	 * */
	public ArrayList<HuoDong> selHuoDong(){
		ArrayList<HuoDong> list = new ArrayList<HuoDong>();
		String sql = "select * from huodong where biaoshi=0";
		try {
			ResultSet rs = db.getConn().prepareStatement(sql).executeQuery();
			if(rs.next()){
				HuoDong hd = new HuoDong();
				hd.setId(rs.getInt("id"));
				hd.setShow(rs.getString("show"));
				hd.setImg(rs.getString("img"));
				hd.setStarttime(rs.getString("starttime"));
				hd.setStoptime(rs.getString("stoptime"));
				list.add(hd);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		db.closeAll();
		return list;
	}
	
	/**
	 * ��ѯ�������ڷ�ӳ�ĵ�Ӱ
	 * */
	
	public ArrayList<String> selFilmName(){
		ArrayList<String> list = new ArrayList<String>();
		String sql = "select distinct(filmName) from film inner join filmshow on film.filmId=filmshow.filmId";
		DBHelp db = new DBHelp();
		try {
			ResultSet rs = db.getConn().prepareStatement(sql).executeQuery();
			while(rs.next()){
				list.add(rs.getString("filmName"));
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		db.closeAll();
		return list;
	}
	
	/**
	 * ��ѯ��Ӱ�ķ�ӳʱ��
	 * */
	public ArrayList<String> selFilmTime(String filmName){
		ArrayList<String> list = new ArrayList<String>();
		String sql = "select showDate,showTime from film inner join filmshow on film.filmId=filmshow.filmId where filmName='"+filmName+"'";
		try {
			ResultSet rs = db.getConn().prepareStatement(sql).executeQuery();
			while(rs.next()){
				String str = rs.getString("showDate")+" "+rs.getString("showTime");
				list.add(str);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		db.closeAll();
		return list;
	} 
	
	/**
	 * ��ѯ��Ӱ�ķ�ӳ��
	 * */
	public ArrayList<Object> selFilmRoom(String filmName,String filmTime){
		ArrayList<Object> list = new ArrayList<Object>();
		String[] str = filmTime.split(" ");
		String sql = "select roomId from film inner join filmshow on film.filmId=filmshow.filmId " +
				"where filmName='"+filmName+"' and showDate='"+str[0]+"' and showTime='"+str[1]+"'";
		try {
			ResultSet rs = db.getConn().prepareStatement(sql).executeQuery();
			while(rs.next()){
				list.add(rs.getInt("roomId"));
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		db.closeAll();
		return list;
	}
	
	/**
	 * �û���ѯҪ��Ʊ�ĵ�Ӱ����ϸ��Ϣ
	 * */
	public ArrayList<FilmShow> selFilmShowInfo(String name,String time,String room){
		ArrayList<FilmShow> list = new ArrayList<FilmShow>();
		String[] str = time.split(" "); 
		String sql = "select showId, film.filmId,filmName,filmLong,director,actor,filmType,filmPrice,filmImg," +
		"filmJianJie,filmScore,filmLanguage,roomId,showDate,showTime from film inner join filmshow on " +
		"film.filmId=filmshow.filmId where filmName='"+name+"' and showDate='"+str[0]+"' " +
		"and showTime='"+str[1]+"' and roomId='"+room+"'";
		try {
			ResultSet rs = db.getConn().prepareStatement(sql).executeQuery();
			if(rs.next()){
				FilmShow fs = new FilmShow();
				fs.setShowId(rs.getInt("showId"));
				fs.getFilmId().setFilmId(rs.getInt("filmId"));
				fs.getFilmId().setFilmName(rs.getString("filmName"));
				fs.getFilmId().setFilmLong(rs.getInt("filmlong"));
				fs.getFilmId().setDirector(rs.getString("director"));
				fs.getFilmId().setActor(rs.getString("actor"));
				fs.getFilmId().setFilmType(rs.getString("filmType"));
				fs.setFilmPrice(rs.getInt("filmPrice"));
				fs.getFilmId().setFilmImg(rs.getString("filmImg"));
				fs.getFilmId().setJianJie(rs.getString("filmJianJie"));
				fs.getFilmId().setFilmScore(rs.getInt("filmScore"));
				fs.getFilmId().setFilmLanguage(rs.getString("filmLanguage"));
				fs.getRoomId().getRoomId().setRoomId(rs.getInt("roomId"));
				fs.setShowDate(rs.getString("showDate"));
				fs.setShowTime(rs.getString("showTime"));
				list.add(fs);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		db.closeAll();
		return list;
	} 
	
	/**
	 * ��ѯ��ӳ������λ���(���ţ�����)
	 * */
	public int[] selRoom(int roomId){
		int[] room = new int[2];
		String sql = "select * from room where roomId='"+roomId+"'";
		try {
			ResultSet rs = db.getConn().prepareStatement(sql).executeQuery();
			if(rs.next()){
				room[0] = rs.getInt("seatRows");
				room[1] = rs.getInt("seatCols");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		db.closeAll();
		return room;
	}
	
	/**
	 * �ж���λ�Ƿ��𻵣�0��û�У�1�����ˣ�
	 * */
	public int selSeatState(int roomId,int seatNum){
		String sql = "select seatState from seat where roomId='"+roomId+"' and seatNum='"+seatNum+"'";
		int i = 0;
		try {
			ResultSet rs = db.getConn().prepareStatement(sql).executeQuery();
			if(rs.next()){
				i = rs.getInt("seatState");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		db.closeAll();
		return i;
	}
	
	/**
	 * ��ѯ��λ�Ƿ��ѱ�����
	 * */
	public boolean selSeatNum(int showId,int seatNum){
		String sql = "select * from ticket where showId='"+showId+"' and seatNum='"+seatNum+"'";
		try {
			ResultSet rs = db.getConn().prepareStatement(sql).executeQuery();
			if(rs.next()){
				db.closeAll();
				return true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		db.closeAll();
		return false;
	}
	
	/**
	 * ��ѯ��Ա�Ż�����
	 * */
	public Vip selectVip(int num){
		Vip vip = new Vip();
		String sql = "select * from vip where start<='"+num+"' and stop>='"+num+"'";
		ResultSet rs;
		try {
			rs = db.getConn().prepareStatement(sql).executeQuery();
			if(rs.next()){
				vip.setVip(rs.getInt("vip"));
				vip.setStart(rs.getInt("start"));
				vip.setStop(rs.getInt("stop"));
				vip.setZheKou(rs.getInt("zheKou"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		db.closeAll();
		return vip;
	}
	
	/**
	 * �û�����ķ���
	 * */
	public int FuKuan(String userId,String showId,String[] seatNum,String price){
		int row = 0;
		//String str = "";
		//double orderMoney = 0;
		for(int i=0;i<seatNum.length;i++){
			try {
				int num = 0;
				String sql0 = "select * from ticket where userId='"+userId+"' and showId='"+showId+"' and seatNum='"+seatNum[i]+"'";
				ResultSet rs0 = db.getConn().prepareStatement(sql0).executeQuery();
				if(rs0.next()){
					num=1;
				}
				if(num==0){
					String sql = "insert into ticket values(default,'"+userId+"','"+showId+"','"+seatNum[i]+"','"+price+"',now()) ";
					int j = db.getConn().prepareStatement(sql).executeUpdate();
					if(j>0){
						//str = str+seatNum[i]+"/";
						String sql1 = "select userMoney from userinfo where userId='"+userId+"'";
						ResultSet rs = db.getConn().prepareStatement(sql1).executeQuery();
						if(rs.next()){
							//orderMoney += Double.parseDouble(price);
							double money = rs.getDouble("userMoney") - Double.parseDouble(price);
							int score = (int)(Double.parseDouble(price));
							String sql2 = "update userinfo set userMoney='"+money+"',userScore='"+score+"' where userId='"+userId+"'";
							db.getConn().prepareStatement(sql2).executeUpdate();
						}
						row++;
					}
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} 
		}
		db.closeAll();
		return row;
	}
	
	/**
	 * ��ѯ�û���ĳ�������Ѷ�������Ʊ
	 * */
	public int seleNum(String userId,int showId){
		int i = 0;
		String sql = "select * from ticket where userId='"+userId+"' and showId='"+showId+"'";
		ResultSet rs;
		try {
			rs = db.getConn().prepareStatement(sql).executeQuery();
			while(rs.next()){
				i++;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		db.closeAll();
		return i;
	}
	
	/**
	 * �������Ų�ѯ����
	 * */
	public ArrayList selOrder(String ticketId,String userId,String userPwd){
		ArrayList list = new ArrayList();
		UserInfo users = userLogin(userId, userPwd);
		if(users!=null){
			String sql = "select ticketId,ticket.showId,film.filmId,filmName,showDate,showTime," +
			"roomId,seatNum,price from ticket inner join filmshow on ticket.showId=filmshow.showId " +
			"inner join film on film.filmId=filmshow.filmId where ticketId='"+ticketId+"' and userId='"+userId+"'";
			try {
				ResultSet rs = db.getConn().prepareStatement(sql).executeQuery();
				if(rs.next()){
					list.add(rs.getString(1));
					list.add(rs.getString(2));
					list.add(rs.getString(3));
					list.add(rs.getString(4));
					list.add(rs.getString(5));
					list.add(rs.getString(6));
					list.add(rs.getString(7));
					list.add(rs.getString(8));
					list.add(rs.getString(9));
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			db.closeAll();
			return list;
		}else{
			db.closeAll();
			return null;
		}
	} 
	
	/**
	 * �û��˶�
	 * */
	public int delTicket(String ticketId,double money,String userId){
		int row = 0;
		String sql = "delete from ticket where ticketId='"+ticketId+"'";
		try {
			row = db.getConn().prepareStatement(sql).executeUpdate();
			if(row>0){
				UserInfo user = selectMe(userId);
				String sql1 = "update userinfo set userMoney='"+(user.getUserMoney()+money*0.95)+"' where userId='"+userId+"'";
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		db.closeAll();
		return row;
		
	}
	
	/**
	 * �ύ����
	 * */
	public int submitComment(PingJia comment){
		String sql="insert into pingjia(filmId,userId,pingJia,time) values(?,?,?,?)";
		Object o[]={comment.getFilmId().getFilmId(),comment.getUserId().getUserId(),comment.getPingJia(),comment.getTime()};
		db.closeAll();
		return db.updSql(sql, o);
	}
	/**
	 * ��Ӱ��ҳ
	 * */
	public ArrayList<Film> getAllCurrent(int page,String sql){
		ArrayList<Film> currentList = db.executeQuery(sql, null);
		db.closeAll();
		return currentList;
	}
	/**
	 * ����Ӱ���Ʋ�ѯ��Ӱ
	 * */
	public ArrayList<Film> getMoviesByName(String name){
		//����ArrayList����
		ArrayList<Film> list =new ArrayList<Film>();
		//����sql���
		String sql ="select * from film where filmName='"+name+"'";
		list =db.executeQuery(sql, null);
		db.closeAll();
		return list;
	}
	/**
	 * ���ݵ�Ӱid��ѯ��Ӱ��films.get(0)��ΪҪ���ҵĵ�Ӱ
	 * */
	public ArrayList<Film> getMovieById(int movieId){
		ArrayList<Film> films=new ArrayList<Film>();
		String sql="select * from film where filmId='"+movieId+"'";
		films=db.executeQuery(sql, null);
		db.closeAll();
		return films;
	}
	/**
	 * ���ݵ�ӰID�õ���Ӱ����
	 * */
	public ArrayList<PingJia> getCommentById(int filmId){
		//����ArrayList����
		ArrayList<PingJia> list =new ArrayList<PingJia>();
		//����sql���
		String sql ="select id,userId,pingJia,time,pingjia.filmId from pingjia inner join film on " +
				"film.filmId='"+filmId+"' and film.filmId=pingjia.filmId";
		try {
			ResultSet rs =db.getConn().prepareStatement(sql).executeQuery();
			while(rs.next()){
				PingJia comment =new PingJia();
				comment.setId(rs.getInt(1));
				UserInfo userInfo = new UserInfo();
				userInfo.setUserId(rs.getString(2));
				comment.setUserId(userInfo);
				comment.setPingJia(rs.getString(3));
				comment.setTime(rs.getString(4));
				Film movie = new Film();
				movie.setFilmId(filmId);
				comment.setFilmId(movie);
				list.add(comment);
			}
			db.closeAll();
			return list;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		db.closeAll();
		return list;
	}
	/**
	 * ����ҳ����ʾ��Ӱ���� ÿҳ��ʾ4��
	 * */
	public ArrayList<PingJia> getCommentByPage(int filmId,int page,String sql){
		//����ArrayList����
		ArrayList<PingJia> list =new ArrayList<PingJia>();
		try {
			ResultSet rs =db.getConn().prepareStatement(sql).executeQuery();
			while(rs.next()){
				PingJia comment =new PingJia();
				comment.setId(rs.getInt(1));
				UserInfo userInfo = new UserInfo();
				userInfo.setUserId(rs.getString(2));
				comment.setUserId(userInfo);
				comment.setPingJia(rs.getString(3));
				comment.setTime(rs.getString(4));
				Film movie = new Film();
				movie.setFilmId(filmId);
				comment.setFilmId(movie);
				list.add(comment);
			}
			db.closeAll();
			return list;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		db.closeAll();
		return list;
	}
	/**
	 * ���ݵ�ӰID��ѯ�õ�Ӱ�����з�ӳ����
	 * */
	public ArrayList<FilmShow> getFilmShowById(int filmId){
		ArrayList<FilmShow> films=new ArrayList<FilmShow>();
		String sql="select * from filmShow where filmId='"+filmId+"'";
		try {
			ResultSet rs = db.getConn().prepareStatement(sql).executeQuery();
			while (rs.next()) {
				FilmShow filmShow = new FilmShow();
				Film film = new Film();
				Room room = new Room();
				Seat seat = new Seat();
				room.setRoomId(rs.getInt("roomId"));
				seat.setRoomId(room);
				film.setFilmId(rs.getInt("filmId"));
				filmShow.setFilmId(film);
				filmShow.setFilmPrice(rs.getDouble("filmPrice"));
				filmShow.setRoomId(seat);
				filmShow.setShowDate(rs.getString("showDate"));
				filmShow.setShowId(rs.getInt("showId"));
				filmShow.setShowTime(rs.getString("showTime"));
				films.add(filmShow);	
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		db.closeAll();
		return films;
	}
	
	/**
	 * ���ݵ�ӰName��Date ��ѯ��ӳ���α� 
	 * */
	public ArrayList<FilmShow> getFilmShowByNameDate(String filmName,String date){
		ArrayList<FilmShow> films=new ArrayList<FilmShow>();
		String sql="select * from film,filmshow where film.filmId=filmshow.filmId and film.filmName='"+filmName+"' and showDate='"+date+"'";
		//System.out.println(sql);
		try {
			ResultSet rs = db.getConn().prepareStatement(sql).executeQuery();
			while (rs.next()) {
				FilmShow filmShow = new FilmShow();
				Film film = new Film();
				Room room = new Room();
				Seat seat = new Seat();
				room.setRoomId(rs.getInt("roomId"));
				seat.setRoomId(room);
				film.setFilmName(rs.getString("filmName"));
				film.setFilmId(rs.getInt("filmId"));
				filmShow.setFilmId(film);
				filmShow.setFilmPrice(rs.getDouble("filmPrice"));
				filmShow.setRoomId(seat);
				filmShow.setShowDate(rs.getString("showDate"));
				filmShow.setShowId(rs.getInt("showId"));
				filmShow.setShowTime(rs.getString("showTime"));
				films.add(filmShow);	
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		db.closeAll();
		return films;
	}
	/**
	 * ��ӹ�ע��
	 * */
	
	public int addAttention(int filmId){
		String sql="update film set filmScore=filmScore+1 where filmId='"+filmId+"' ";
		Object o[]={};
		db.closeAll();
		return db.updSql(sql, o);
		
	}
	/**
	 * �����ע��
	 * */
	
	public int insertGuanZhu(int filmId,String userId){
		String sql="insert into user_guanzhu(id,userId,filmId) values (default,?,?)";
		Object o[]={userId,filmId};
		db.closeAll();
		return db.updSql(sql, o);
		
	}
	/**
	 * �жϸ��û��Ƿ��ѹ�ע���õ�Ӱ
	 * */
	
	public boolean isAttention(int filmId,String userId){
		String sql="select * from user_guanzhu where filmId='"+filmId+"' and userId='"+userId+"' ";
		try {
			ResultSet rs = db.getConn().prepareStatement(sql).executeQuery();
			if(rs.next()){
				return true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		db.closeAll();
		return false;
	}
	/**
	 * ��ý��졢���졢�������� �Լ��������ڼ�
	 * 
	 * */
	public String[] getDate(){
		//��õ�ǰ����
		Date date = new Date();
		//���������µ����ڶ��� ���� ����
		Date date1 =new Date(date.getYear(), date.getMonth(), date.getDate()+1);
		Date date2 =new Date(date.getYear(), date.getMonth(), date.getDate()+2);
		//�������ڵ������ʽ
		SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
		//��ý���/����/��������
		String today = sf.format(date);
		String tomorrow =sf.format(date1);
		String houtian=sf.format(date2);
		//��ú��������ڼ�
		int day = date2.getDay();
		String week="";
		switch(day){
	    	case 1: week="����һ ";break;
	    	case 2: week="���ڶ�  ";break;
	    	case 3: week="������ ";break;
	    	case 4: week="������ ";break;
	    	case 5: week="������ ";break;
	    	case 6: week="������ ";break;
	    	case 0: week="������ ";break;
		}
		String[] datelist={today,tomorrow,houtian,week};
		db.closeAll();
		return datelist;
		
	}
	/**
	 * ��ѯĳ�յ����з�ӳ���α�
	 * */
	public ArrayList<FilmShow> getFilmByDate(String date){
		String sql="select * from filmshow where showdate ='"+date+"'";
		ArrayList<FilmShow> list = new ArrayList<FilmShow>();
		try {
			ResultSet rs = db.getConn().prepareStatement(sql).executeQuery();
			while(rs.next()){
				FilmShow filmshow = new FilmShow();
				Film film = new Film();			
				//����Id��ѯ��Ӱ����
				film =this.getMovieById(rs.getInt("filmId")).get(0);
				filmshow.setFilmId(film);
				filmshow.setFilmPrice(rs.getDouble("filmPrice"));
				Room room = new Room();
				room.setRoomId(rs.getInt("roomId"));
				Seat seat = new Seat();
				seat.setRoomId(room);
				filmshow.setRoomId(seat);
				filmshow.setShowDate(rs.getString("showDate"));
				filmshow.setShowId(rs.getInt("showId"));
				filmshow.setShowTime(rs.getString("showTime"));
				list.add(filmshow);
			
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		db.closeAll();
		return list;
		
	}
	
	/**
	 * ��ѯĳ��ǰ�ķ�ӳ���α�
	 * */
	public ArrayList<FilmShow> getTopTenByDate(String date){
		String sql="select * from filmshow where showdate ='"+date+"' limit 0,4";
		ArrayList<FilmShow> list = new ArrayList<FilmShow>();
		try {
			ResultSet rs = db.getConn().prepareStatement(sql).executeQuery();
			while(rs.next()){
				FilmShow filmshow = new FilmShow();
				Film film = new Film();			
				//����Id��ѯ��Ӱ����
				film =this.getMovieById(rs.getInt("filmId")).get(0);
				filmshow.setFilmId(film);
				filmshow.setFilmPrice(rs.getDouble("filmPrice"));
				Room room = new Room();
				room.setRoomId(rs.getInt("roomId"));
				Seat seat = new Seat();
				seat.setRoomId(room);
				filmshow.setRoomId(seat);
				filmshow.setShowDate(rs.getString("showDate"));
				filmshow.setShowId(rs.getInt("showId"));
				filmshow.setShowTime(rs.getString("showTime"));
				list.add(filmshow);
			
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		db.closeAll();
		return list;
		
	}
	
	/**
	 * ��ѯ�ҵĶ�����Ϣ
	 * */
	public ArrayList<Ticket> sleectMyOrder(String userId){
		ArrayList<Ticket> list = new ArrayList<Ticket>();
		String sql = "select ticketId,userId,filmName,roomId,seatNum,price,showDate,showTime,orderTime from ticket inner join " +
				"filmshow on ticket.showId=filmshow.showId inner join film on filmshow.filmId=film.filmId " +
				"where userId='"+userId+"'";
		try {
			ResultSet rs = db.getConn().prepareStatement(sql).executeQuery();
			while(rs.next()){
				Ticket tk = new Ticket();
				tk.setTicketId(rs.getInt("ticketId"));
				tk.getUserId().setUserId(rs.getString("userId"));
				tk.getShowId().getFilmId().setFilmName(rs.getString("filmName"));
				tk.getShowId().getRoomId().getRoomId().setRoomId(rs.getInt("seatNum"));
				tk.setSeatNum(rs.getInt("seatNum"));
				tk.setPrice(rs.getDouble("price"));
				tk.getShowId().setShowDate(rs.getString("showDate"));
				tk.getShowId().setShowTime(rs.getString("showTime"));
				tk.setOrderTime(rs.getString("orderTime"));
				list.add(tk);
			}
			return list;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		db.closeAll();
		return null;
		
	}
	/*public static void main(String[] args) {
		UserServer us = new UserServer();
		ArrayList<FilmShow> filmDateShow = us.getFilmByDate("2013-01-28");
		for(int i=0;i<filmDateShow.size();i++){
			System.out.println(filmDateShow.get(i).getFilmId().getFilmName());
		}
	}*/
	/*public static void main(String[] args) {
		UserServer us = new UserServer();
		ArrayList list = us.selFilmRoom("���Ϲ�������", "2013-01-24 09:30:00");
		System.out.println(list.get(0));
	}*/

}
