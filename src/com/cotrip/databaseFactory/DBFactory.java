package com.cotrip.databaseFactory;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;


public class DBFactory {
	
	static String DRIVER=PropertiesRead.getProperty("DRIVER");
	static String URL=PropertiesRead.getProperty("URL");
	static String USERNAME=PropertiesRead.getProperty("USERNAME");
	static String PASSWORD=PropertiesRead.getProperty("PASSWORD");
	
	public static Connection getConnection()
	{
		Connection con=null;
		String urlstr=URL+"?"+"user="+USERNAME+"&password="+PASSWORD+"&useUnicode=true&characterEncoding=utf-8";
		try {
			Class.forName(DRIVER);
			con=DriverManager.getConnection(urlstr);
			
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return con;
	}
	
	public static void close(Connection conn) {
		try {
			if (conn != null) {
				conn.close();
				conn = null;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}


	public static void close(Statement stmt) {
		try {
			if (stmt != null) {
				stmt.close();
				stmt = null;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	public static void close(PreparedStatement stmt) {
		try {
			if (stmt != null) {
				stmt.close();
				stmt = null;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public static void close(ResultSet rs) {
		try {
			if (rs != null) {
				rs.close();
				rs = null;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	public static  void close(Connection conn, Statement stmt, ResultSet rs) {
		if (rs != null) {
			DBFactory.close(rs);
		}
		if (stmt != null) {
			DBFactory.close(stmt);
		}
		if (conn != null) {
			DBFactory.close(conn);
		}
	}
	public static  void close(Connection conn, PreparedStatement pstmt, ResultSet rs) {
		if (rs != null) {
			DBFactory.close(rs);
		}
		if (pstmt != null) {
			DBFactory.close(pstmt);
		}
		if (conn != null) {
			DBFactory.close(conn);
		}
	}
	
	public static void main(String[] args)
	{
		if(DBFactory.getConnection()!=null)
		{
			System.out.println("数据库连接失败");
		}
	}

}
