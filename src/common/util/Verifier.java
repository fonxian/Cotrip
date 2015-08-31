package common.util;

import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class Verifier {
	  static Pattern phoneP  = Pattern.compile("^((13[0-9])|(14[0-9])|(15[^4,\\D])|(17[0-9])|(18[0-9]))\\d{8}$");

	    /**
	     * With effective element
	     * 
	     * @param str
	     * @return
	     */
	    public static boolean isEffectiveStr(String str) {
	        return (str != null) && (!str.trim().isEmpty());
	    }
	    
	    /**
	     * With effective element
	     * 
	     * @param long
	     * @return
	     */
	    public static boolean isEffectiveLong(Long lo) {
	        return (lo != null) && (!lo.equals(0l));
	    }
	    
	    /**
	     * With effective element
	     * 
	     * @param long, obj
	     * @return
	     */
	    public static boolean isEffectiveLong(Object obj, Long lo) {
	        return (obj != null) && (lo != null) && (!lo.equals(0l));
	    }
	    
	    /**
	     * 
	    *  obj
	    * @param @param obj
	    * @return 
	     */
	    public static boolean isEffectiveObj(Object obj) {
	    	return obj != null;
	    }

	    /**
	     * @param <T>
	     * @param list
	     * @return
	     */
	    public static <T> boolean isEffectiveList(List<T> list) {
	        return list != null && list.size() > 0;
	    }

	    /**
	     * Effective phone number in China. <br>
	     * 13X, 15X, 18X
	     * 
	     * @param phoneNum
	     * @return
	     */
	    public static boolean isEffectivePhoneNum(String phoneNum) {
	        if (!isEffectiveStr(phoneNum)) {
	            return false;
	        }

	        Matcher m = phoneP.matcher(phoneNum);
	        return m.find();
	    }
	    
	    /**
	     * equals string
	     */
	    public static boolean equalsStr(String str1, String str2) {
	    	if(!isEffectiveStr(str1)) {
	    		return false;
	    	}
	    	return str1.equals(str2);
	    }
	    
	    /**
	     * equals long
	     */
	    public static boolean equalsLong(Long long1, Long long2) {
	    	if(long1 == null) {
	    		return false;
	    	}
	    	return long1.equals(long2);
	    }
}
