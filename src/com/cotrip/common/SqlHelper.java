package com.cotrip.common;

import java.io.*;
import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;

import com.cotrip.databaseFactory.DBFactory;

/**
 * @author Administrator 提供通用的通过SQL操作数据库的操作类
 */
public class SqlHelper {

	private static Connection ct = null;
	private static ResultSet rs = null;
	private static PreparedStatement ps = null;
	private static CallableStatement cs = null;

	public static void callProcedure(String sql, String[] parameters) {
		try {
			ct = DBFactory.getConnection();
			cs = ct.prepareCall(sql);
			if (parameters != null) {
				for (int i = 0; i < parameters.length; i++) {
					cs.setObject(i + 1, parameters[i]);
				}
			}
			cs.execute();
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException(e.getMessage());
		} finally {
			DBFactory.close(ct, ps, rs);
		}
	}

	public static CallableStatement CallProcedure2(String sql,
			String[] inparameters, int[] outparameters)

	{
		try {
			ct = DBFactory.getConnection();
			cs = ct.prepareCall(sql);
			if (inparameters != null) {
				for (int i = 0; i < inparameters.length; i++) {
					cs.setObject(i + 1, inparameters[i]);
				}
			}
			if (outparameters != null) {
				for (int j = 0; j < outparameters.length; j++) {
					cs.registerOutParameter(inparameters.length + j + 1,
							outparameters[j]);
				}
			}
			cs.execute();
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException(e.getMessage());
		} finally {

		}
		return cs;
	}

	public static boolean executeUpdate(String sql, String[] parameters) {
		boolean res = false;
		try {
			ct = DBFactory.getConnection();
			ps = ct.prepareStatement(sql);

			// 为占位符赋值ֵ
			if (parameters != null) {
				for (int i = 0; i < parameters.length; i++) {
					ps.setString(i + 1, parameters[i]);
				}
			}
			// ִ执行
			int row = ps.executeUpdate();
			if (row > 0) {
				res = true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
			// throw new RuntimeException(e.getMessage());
			return res;
		} finally {
			DBFactory.close(ct, ps, rs);
		}
		return res;
	}

	// 事务
	public static void executeUpdate(String[] sql, String[][] parameters) {

		try {
			ct = DBFactory.getConnection();
			ct.setAutoCommit(false);

			int i = 0;
			while (i < sql.length) {

				ps = ct.prepareStatement(sql[i]);
				if (parameters != null && parameters[i] != null) {
					for (int j = 0; j < parameters[i].length; j++) {
						ps.setString(j + 1, parameters[i][j]);
					}
				}
				ps.executeUpdate();
				i++;
			}
			ct.commit();
		} catch (Exception e) {
			e.printStackTrace();
			try { // 回滚事务
				ct.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			throw new RuntimeException(e.getMessage());
		} finally {
			DBFactory.close(ct, ps, rs);
		}
	}

	/**
	 * 查询语句，返回javabean数组
	 */
	public static ArrayList executeQuery(Class c, String sql,
			String[] parameters) {
		try {
			ct = DBFactory.getConnection();
			ps = ct.prepareStatement(sql);

			if (parameters != null) {
				for (int i = 0; i < parameters.length; i++) {
					ps.setString(i + 1, parameters[i]);
				}
			}

			rs = ps.executeQuery();
			ArrayList al = new ArrayList(); // 承载所查询的结果
			ResultSetMetaData rsmd = rs.getMetaData(); // 结果集的元数据
			int column = rsmd.getColumnCount(); // 得到列数

			Map<String, Object> m = new HashMap<String, Object>();

			while (rs.next()) {

				Object tempObj = c.newInstance();

				for (int i = 1; i <= column; i++) {
					m.put(rsmd.getColumnName(i), rs.getString(i));
				}
				JavaBeanHelper.evaluate(tempObj, m);
				al.add(tempObj);
			}
			return al; // 返回查询结果
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException(e.getMessage());
		} finally {
			DBFactory.close(ct, ps, rs);
		}
	}

	public static ArrayList executeQuery(String sql, String[] parameters) {
		try {
			ct = DBFactory.getConnection();
			ps = ct.prepareStatement(sql);

			if (parameters != null) {
				for (int i = 0; i < parameters.length; i++) {
					ps.setString(i + 1, parameters[i]);
				}
			}
			rs = ps.executeQuery();

			ArrayList al = new ArrayList(); // 承载所查询的结果

			ResultSetMetaData rsmd = rs.getMetaData(); // 结果集的元数据
			int column = rsmd.getColumnCount(); // 得到列数
			while (rs.next()) {// 将一行封装成一个对象数组，
				Object[] ob = new Object[column];
				for (int i = 1; i <= column; i++) {
					// 每列封装成一个对象
					ob[i - 1] = rs.getObject(i);
				}
				// 将该对象数组放入到al中
				al.add(ob);
			}
			return al; // 返回查询结果
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException(e.getMessage());
		} finally {
			DBFactory.close(ct, ps, rs);
		}
	}

}
