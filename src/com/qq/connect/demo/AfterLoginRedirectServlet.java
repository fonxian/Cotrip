package com.qq.connect.demo;

import com.cotrip.bean.QQInfo;
import com.cotrip.daoimp.UserImp;
import com.qq.connect.QQConnectException;
import com.qq.connect.api.OpenID;
import com.qq.connect.api.qzone.PageFans;
import com.qq.connect.api.qzone.UserInfo;
import com.qq.connect.javabeans.AccessToken;
import com.qq.connect.javabeans.qzone.PageFansBean;
import com.qq.connect.javabeans.qzone.UserInfoBean;
import com.qq.connect.javabeans.weibo.Company;
import com.qq.connect.oauth.Oauth;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Enumeration;

/**
 * Date: 12-12-4
 * Time: 下午4:36
 */
public class AfterLoginRedirectServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setContentType("text/html; charset=utf-8");
        
//    	System.out.println(request.getParameter("access_token"));
        
        PrintWriter out = response.getWriter();

        try {
            AccessToken accessTokenObj = (new Oauth()).getAccessTokenByRequest(request);

            String accessToken   = null,
                   openID        = null;
            long tokenExpireIn = 0L;




            accessToken = (String)request.getParameter("access_token");
            tokenExpireIn = new Long(request.getParameter("expires_in")).longValue();
            

            // 利用获取到的accessToken 去获取当前用的openid -------- start
            OpenID openIDObj =  new OpenID(accessToken);
            openID = openIDObj.getUserOpenID();
            
//            request.getSession().setAttribute("demo_openid", openID);
            // 利用获取到的accessToken 去获取当前用户的openid --------- end


            UserInfo qzoneUserInfo = new UserInfo(accessToken, openID);
            UserInfoBean userInfoBean = qzoneUserInfo.getUserInfo();
            String nickname=null;
            
            if (userInfoBean.getRet() == 0) {
            	nickname = userInfoBean.getNickname();
            }else {
                out.println("很抱歉，我们没能正确获取到您的信息，原因是： " + userInfoBean.getMsg());
            }
            
            System.out.println("XX"+openID);
            
            QQInfo info =UserImp.getQQInfo(openID);
            if( info == null){
            	request.getSession().setAttribute("openID", openID);
            	request.getSession().setAttribute("nickName", nickname);
            	try {
					request.getRequestDispatcher("/qqlogin.jsp").forward(request,response);
				} catch (ServletException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
	        }
            else{
            	
            	request.setAttribute("username",info.getEmail());
            	request.setAttribute("password",info.getPasswd());
            	request.getSession().setAttribute("openID", info.getOpenId());
            	request.getSession().setAttribute("nickName", info.getNickName());
            	
            	try {
					request.getRequestDispatcher("servlet/UserLogin").forward(request, response);
				} catch (ServletException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
            }
        } catch (QQConnectException e1) {
        	e1.printStackTrace();
        }
    }
    

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
    }
}
