package com.cotrip.daoimp;

import java.util.ArrayList;

import com.cotrip.bean.Manager;
import com.cotrip.common.SqlHelper;

public class ManagerImp {
	
	//判断用户帐号密码是否正确
	public boolean isUser(String email,String password)
	{
		boolean res=false;
		String sql="select * from manager where power<>'N' and manageremail=?";
		String str[]={email};
		ArrayList<Manager> al = SqlHelper.executeQuery(Manager.class,sql, str);
		for(Manager usr:al) {
			  String oldpassword=usr.getManagerpassword();
			  if(password.equals(oldpassword))
			  {
				  res=true;
			  }
			}
		return res;
	}
	
	//添加管理员
	public boolean addManager(Manager m)
	{
		boolean res=false;
		String sql="insert into manager(managername,manageremail,managerpassword,mobnumber,power) values(?,?,?,?,?)";
		String[] str={m.getManagername(),m.getManageremail(),m.getManagerpassword(),m.getMobnumber(),"N"};
		res=SqlHelper.executeUpdate(sql, str);
		return res;
	}
	
	//通过邮箱修改密码
	public boolean changPassByemail(String email,String password)
	{
		boolean res=false;
		String sql="update manager set managerpassword=? where manageremail=?";
		String[] str={password,email};
		res=SqlHelper.executeUpdate(sql, str);
		return res;
	}
	//修改个人信息
	public boolean changInfoByID(String mID,String name,String mobnumber)
	{
		boolean res=false;
		String sql="update manager set managername=?,mobnumber=? where managerID=?";
		String[] str={name,mobnumber,mID};
		res=SqlHelper.executeUpdate(sql, str);
		return res;
	}
	//修改管理员权限
	public boolean changManagerPowerByID(String mID,String power)
	{
		boolean res=false;
		String sql="update manager set power=? where managerID=?";
		String[] str={power,mID};
		res=SqlHelper.executeUpdate(sql, str);
		return res;
	}
	//删除管理员
	public boolean delManagerByID(String ID)
	{
		boolean res=false;
		String sql="delete from manager where managerID=?";
		String[] str={ID};
		res=SqlHelper.executeUpdate(sql, str);
		return res;
	}
	//通过邮箱获取管理员
	public Manager getManagerByEmail(String email)
	{
		Manager m=new Manager();
		String sql="select * from manager where manageremail=?";
		String str[]={email};
		ArrayList<Manager> al = SqlHelper.executeQuery(Manager.class,sql, str);
		for(Manager usr:al) {
			  m=usr;
			}
		return m;
	}
	
	//判断用户的邮箱是否存在
	public boolean haveManagerByEmail(String email)
	{
		boolean res=false;
		String sql="select * from manager where manageremail=?";
		String str[]={email};
		ArrayList<Manager> al = SqlHelper.executeQuery(Manager.class,sql, str);
		if(al.size()>0)
		{
			res=true;
		}
		return res;
	}
	//通过ID获取管理员
	public static Manager getManagerByID(String ID)
	{
		Manager m=new Manager();
		String sql="select * from manager where managerID=?";
		String str[]={ID};
		ArrayList<Manager> al = SqlHelper.executeQuery(Manager.class,sql, str);
		for(Manager usr:al) {
			  m=usr;
			}
		return m;
	}

}
