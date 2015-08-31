package common.util;

import java.io.File;

import java.io.IOException;

import java.io.InputStream;

import java.util.Properties;
import java.util.ResourceBundle;

public class BackDBTool {

	/*
	 * 
	 * 备份数据库 1、读取配置文件 2、启动智能查询Mysql安装目录 3、备份数据库为sql文件
	 */

	public static void backup(String sql) {

		Properties pros = getPprVue("prop.properties");

		String username = pros.getProperty("username");

		String password = pros.getProperty("password");

		System.out.println("数据库用户名：" + username);
		System.out.println("数据库密码：" + password);
		CheckSoftware c = null;

		String mysqlpaths;

		try {

			// mysqlpaths = c.check().toString() + "bin" + "\\";
			// mysql安装目录的bin目录
			mysqlpaths = "C:/Program Files/MySQL/MySQL Server 5.1/bin/";

			String databaseName = pros.getProperty("databaseName");

			String address = pros.getProperty("address");

			String sqlpath = pros.getProperty("sql");

			File backupath = new File(sqlpath);

			if (!backupath.exists()) {

				backupath.mkdir();

			}

			StringBuffer sb = new StringBuffer();

			sb.append(mysqlpaths);

			sb.append("mysqldump ");

			sb.append("--opt ");

			sb.append("-h ");

			sb.append(address);

			sb.append(" ");

			sb.append("--user=");

			sb.append(username);

			sb.append(" ");

			sb.append("--password=");

			sb.append(password);

			sb.append(" ");

			sb.append("--lock-all-tables=true ");

			sb.append("--result-file=");

			sb.append(sqlpath);

			sb.append(sql);

			sb.append(" ");

			sb.append("--default-character-set=utf8 ");

			sb.append(databaseName);

			System.out.println("cmd指令 ：" + sb.toString());

			Runtime cmd = Runtime.getRuntime();

			try {

				Process p = cmd.exec(sb.toString());

			} catch (IOException e) {

				e.printStackTrace();

			}

		} catch (Exception e1) {

			e1.printStackTrace();

		}

	}

	/*
	 * 
	 * 读取属性文件
	 */

	public static Properties getPprVue(String properName) {

		System.out.println(properName);
		InputStream inputStream = BackDBTool.class
				.getResourceAsStream(properName);
		Properties p = new Properties();

		try {

			p.load(inputStream);

			inputStream.close();

		} catch (IOException e) {

			e.printStackTrace();

		}

		return p;

	}

	/*
	 * 读取指定文件夹下的文件名称
	 * 
	 * 输入：文件夹地址
	 * 
	 * *
	 */
	public  String[] getFilenames(String dir){
		
		 File file = new File(dir); 
		 File[] lf = file.listFiles(); 
		 int length=lf.length;
		 String[] fileNames=new String[length];
		 for(int i=0; i<length; i++){
			 fileNames[i]=lf[i].getName();
			 System.out.println(lf[i].getName());
		 }
		 return fileNames;
	}

	/*
	 * 
	 * 根据备份文件恢复数据库
	 */

	public static void load(String filename) throws Exception {

		System.out.println("备份的数据库文件名：" + filename);
		Properties pros = getPprVue("prop.properties");

		String root = pros.getProperty("username");

		String pass = pros.getProperty("password");

		System.out.println("数据库用户名root：" + root);
		System.out.println("数据库密码pass：" + pass);


		String sqlpath = pros.getProperty("sql");

		String filepath = sqlpath + filename; // 备份的路径地址
		filepath = filepath.replaceAll("//", "/");
		System.out.println("备份的数据库文件路径地址filepath：" + filepath);
		String address = pros.getProperty("address");
		System.out.println("数据库服务器IP地址address：" + address);
		String restore = "mysql -h" + address + " -u" + root + " -p" + pass

		+ " cotrip1 < " + filepath; // -p后面加的是你的数据库密码

		System.out.println("数据库恢复指令：" + restore);

		try {

			Runtime.getRuntime().exec("cmd /c " + restore);

			// Runtime.getRuntime().exec(cmd);

			System.out.println("数据已从 " + filepath + " 导入到数据库中");

		} catch (IOException e) {

			e.printStackTrace();

		}

	}

	/*
	 * 
	 * Test测试
	 */

	public static void main(String[] args) throws IOException {
		GetSystemTime sytemTime = new GetSystemTime();
		String backTime = sytemTime.getNowtime();
	}

}
