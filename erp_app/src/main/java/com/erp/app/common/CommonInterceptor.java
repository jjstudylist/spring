package com.erp.app.common;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class CommonInterceptor extends HandlerInterceptorAdapter {
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		
		boolean result = true;
        String uri = request.getRequestURI().toString().trim();
        
        try {     
        	// ������ ������ ���
        	if (uri.equals("/") || uri.equals("/login") || uri.equals("/signUp") || uri.equals("/navercallback")|| uri.equals("/naverInfo")){
        		if(request.getSession().getAttribute("LoginInfo") != null ){

                    response.sendRedirect("/main");  
                    result =  false;
                }else{ 
                    result =  true;
                }
        	}
        	else if(uri.equals("/findUserInfo")) {
                result =  true;
        	}
            //���ǰ��� ���ϰ��
            else if(request.getSession().getAttribute("LoginInfo") == null ){
        		
                response.sendRedirect("/");  
                result =  false;
                 
            }else{ 
                result =  true;
            }
        } catch (Exception e) {
            e.printStackTrace();
            result = false;
        }   
        return result;
	}


}
