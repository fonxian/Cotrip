package com.cotrip.daoimp;

import java.lang.reflect.Array;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.cotrip.bean.QQInfo;
import com.cotrip.bean.SysNewsNotices;
import com.cotrip.bean.User;
import com.cotrip.common.SqlHelper;
import com.qq.connect.api.qzone.UserInfo;

public class UserImp {


	
	public static void saveQQInfo(){
		
		String sql = "insert into qqinfo values()" ;
		SqlHelper.executeUpdate(sql, null);
	}
	public static QQInfo getQQInfo(String openId){
		String sql = "select * from qqinfo where openId='"+openId+"'" ;
		ArrayList userInfo = SqlHelper.executeQuery(sql, null);
		
		if(userInfo.size() == 0)
			return null;
		else{
			QQInfo info = new QQInfo();
			Object obj[] = (Object[]) userInfo.get(0);
			info.setOpenId((String)obj[0]);
			info.setNickName((String)obj[1]);
			info.setEmail((String)obj[2]);
			info.setPasswd((String)obj[3]);
			return info;
		}
	}
	public static void setQQInfo(String openId,String nickName,String email,String passwd){
		String sql = "insert into qqinfo values ('"+openId+"','"+nickName+"','"+email+"','"+passwd+"');" ;
	    SqlHelper.executeUpdate(sql, null);
	}
	
	
	public boolean isUser(String email, String password) {
		boolean res = false;
		String sql = "select * from user where status='P' and email=?";
		String str[] = { email };
		ArrayList<User> al = SqlHelper.executeQuery(User.class, sql, str);
		for (User usr : al) {
			// System.out.println(usr.getPassword());
			String oldpassword = usr.getPassword();
			if (password.equals(oldpassword)) {
				res = true;
			}
		}
		return res;
	}

	public boolean haveUser(String email) {
		boolean res = false;
		String sql = "select * from user where email=?";
		String str[] = { email };
		ArrayList<User> al = SqlHelper.executeQuery(User.class, sql, str);
		for (User usr : al) {
			// System.out.println(usr.getPassword());
			String oldemail = usr.getEmail();
			if (email.equals(oldemail)) {
				res = true;
			}
		}
		return res;
	}

	public boolean addUser(String name, String password, String email,
			String random_code) {
		boolean res = false;
		Date date = new Date();
		SimpleDateFormat fmat = new SimpleDateFormat("yy-MM-dd");
		String d = fmat.format(date);
		String sql = "insert into user(username,password,email,registtime,random_code) values(?,?,?,?,?)";
		String str[] = { name, password, email, d, random_code };
		res = SqlHelper.executeUpdate(sql, str);
		return res;
	}

	public static List<User> getAllUser(String num, String size, String status) {
		String pagenum = Integer.toString((Integer.parseInt(num) - 1)
				* Integer.parseInt(size));
		String pagesize = size;
		String sql = "select * from user where status=? order by username ASC limit "
				+ pagenum + "," + pagesize;
		String[] str = { status };
		ArrayList<User> user = SqlHelper.executeQuery(User.class, sql, str);
		return user;
	}

	// 通过用户姓名或邮箱 模糊查找用户
	public static List<User> getUsersByUsernameOrEmail(String searchKey,
			String status) {
		System.out.println("searchKey in UserImp.java:" + searchKey);
		String sql = "select * from user where status=? and (username like ? or email like ?)";
		System.out.println("status:" + status);
		String[] str = { status, "%" + searchKey + "%", "%" + searchKey + "%" };
		ArrayList<User> user = SqlHelper.executeQuery(User.class, sql, str);
		return user;
	}
	
	//通过username和email 获取userId  若用户不存在   则返回null
	public static String getUserIdByNameAndEmail(String username,String email){
		String sql = "select * from user where username = ? and email = ?;";
		String str[] = {username,email};
		ArrayList<User> user = SqlHelper.executeQuery(User.class, sql, str);
		if(user == null || user.size() == 0){
			return null;
		}
		else return user.get(0).getUserID();
	}

	public static User getUserByID(String userID) {
		String sql = "select * from user where userID=?";
		String[] str = { userID };
		User u = new User();
		ArrayList<User> user = SqlHelper.executeQuery(User.class, sql, str);
		for (User us : user) {
			u = us;
		}
		return u;
	}

	public static int getUserCountByStatus(String status) {
		String sql = "select * from user where status=?";
		String[] str = { status };
		ArrayList<User> user = SqlHelper.executeQuery(sql, str);
		return user.size();
	}

	public static int getUserCountByStatusAndUserNameOrEmail(String status,
			String searchKey) {
		String sql = "select * from user where status=? and username like ? or email like ?";
		String[] str = { status, "%" + searchKey + "%", "%" + searchKey + "%" };
		ArrayList<User> user = SqlHelper.executeQuery(sql, str);
		return user.size();
	}

	public static boolean delUserByID(String userID) {
		boolean res = false;
		String sql = "delete from user where userID=?";
		String str[] = { userID };
		res = SqlHelper.executeUpdate(sql, str);
		return res;
	}

	public static boolean blackUserByID(String userID) {
		boolean res = false;
		String sql = "update user set status='O' where userID=?";
		String str[] = { userID };
		res = SqlHelper.executeUpdate(sql, str);
		return res;
	}

	public static boolean whiteUserByID(String userID) {
		boolean res = false;
		String sql = "update user set status='P' where userID=?";
		String str[] = { userID };
		res = SqlHelper.executeUpdate(sql, str);
		return res;
	}

	public boolean changeUserInfo(User user) {
		boolean res = false;
		String sql = "update user set password=?,age=?,sex=?,country=?,city=?,title=?,education=?,company=?,mobnumber=?,telnumber=?,address=?,postcode=?,status=? where userID=?";
		String[] str = { user.getPassword(), user.getAge(), user.getSex(),
				user.getCountry(), user.getCity(), user.getTitle(),
				user.getEducation(), user.getCompany(), user.getMobnumber(),
				user.getTelnumber(), user.getAddress(), user.getPostcode(),
				user.getStatus(), user.getUserID() };
		res = SqlHelper.executeUpdate(sql, str);
		return res;
	}

	// 以下为整合的代码
	// public User getUserByID(String userID){
	// String sql="select * from user where userID=? ";
	// String str[]={userID};
	// ArrayList<User> al = SqlHelper.executeQuery(User.class,sql, str);
	// return al.get(0);
	// }

	public ArrayList<User> getAllUser() {
		String sql = "select * from user";
		String str[] = {};
		ArrayList<User> al = SqlHelper.executeQuery(User.class, sql, str);
		return al;
	}

	// public boolean isUser(String email, String password) {
	// boolean res = false;
	// String sql = "select * from user where status='P' and email=?";
	// String str[] = { email };
	// ArrayList<User> al = SqlHelper.executeQuery(User.class, sql, str);
	// for (User usr : al) {
	// // System.out.println(usr.getPassword());
	// String oldpassword = usr.getPassword();
	// if (password.equals(oldpassword)) {
	// res = true;
	// }
	// }
	// return res;
	// }

	// public boolean haveUser(String email) {
	// boolean res = false;
	// String sql = "select * from user where email=?";
	// String str[] = { email };
	// ArrayList<User> al = SqlHelper.executeQuery(User.class, sql, str);
	// for (User usr : al) {
	// // System.out.println(usr.getPassword());
	// String oldemail = usr.getEmail();
	// if (email.equals(oldemail)) {
	// res = true;
	// }
	// }
	// return res;
	// }

	// public boolean addUser(String name, String password, String email) {
	// boolean res = false;
	// Date date = new Date();
	// SimpleDateFormat fmat = new SimpleDateFormat("yy-MM-dd");
	// String d = fmat.format(date);
	// String sql =
	// "insert into user(username,password,email,registtime) values(?,?,?,?)";
	// String str[] = { name, password, email, d };
	// res = SqlHelper.executeUpdate(sql, str);
	// return res;
	// }

	public boolean updateUser(User u) {
		boolean res = false;
		String sql = "update user set username = ?,age = ?,sex = ?,country = ?,city = ?,title = ?,education = ?,company = ?,mobnumber = ?,telnumber = ?,address = ?,postcode = ? where userID = ?";
		String str[] = { u.getUsername(), u.getAge(), u.getSex(),
				u.getCountry(), u.getCity(), u.getTitle(), u.getEducation(),
				u.getCompany(), u.getMobnumber(), u.getTelnumber(),
				u.getAddress(), u.getPostcode(), u.getUserID() };
		res = SqlHelper.executeUpdate(sql, str);
		return res;
	}

	public boolean updatePW(User u) {
		boolean res = false;
		String sql = "update user set password = ? where userID = ?";
		String str[] = { u.getPassword(), u.getUserID() };
		res = SqlHelper.executeUpdate(sql, str);
		return res;
	}

	public ArrayList<User> queryUserByEmail(String email) {
		String sql = "select * from user where email = ?";
		String[] str = { email };
		return SqlHelper.executeQuery(User.class, sql, str);
	}

	/**
	 * 更新随机码
	 * 
	 * @param email
	 * @param random_code
	 * @return
	 */
	public boolean updateRandom_code(String email, String random_code) {
		String sql = "update user set random_code = ? where email = ?";
		String[] parameters = { random_code, email };
		return SqlHelper.executeUpdate(sql, parameters);
	}

}
