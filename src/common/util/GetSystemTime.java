package common.util;

import java.text.SimpleDateFormat;
import java.util.Calendar;

public class GetSystemTime {
	
	public String getNowtime() {
		Calendar rightNow = Calendar.getInstance();
		SimpleDateFormat fmt = new SimpleDateFormat("yyyy-MM-dd-HH-mm-ss");//格式大小写有区别
		String sysDatetime = fmt.format(rightNow.getTime());
		return sysDatetime;
	}
	public static void main(String[] args){
		// 获得当前系统时间
		System.out.println("当前系统时间是："+new GetSystemTime().getNowtime());
	}
}

