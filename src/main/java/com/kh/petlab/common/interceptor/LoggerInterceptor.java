package com.kh.petlab.common.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import lombok.extern.slf4j.Slf4j;

/**
 * interceptor
 * - DispatcherServlet에서 Controller의 Handler 메소드 호출 직전에 개입한다.
 * - HandlerInterceptorAdapter 상속
 * - 1. preHandle
 * - 2. postHandle
 * - 3. afterCompletion
 */
@Slf4j
public class LoggerInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		log.debug("=================================================================================");
		log.debug(request.getRequestURI());
		log.debug("---------------------------------------------------------------------------------");
		
		// true를 리턴해야 다음 handler로 연결될 수 있다.
		return super.preHandle(request, response, handler); // 항상 true 리턴
	}
	
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		super.postHandle(request, response, handler, modelAndView);		
		log.debug("---------------------------------------------------------------------------------");
		log.debug("modelAndView = {}", modelAndView);
		log.debug("---------------------------------------------------------------------------------");
		
	}
	
	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		super.afterCompletion(request, response, handler, ex);
		log.debug("__________________________________________________________________________________");
		log.debug("{}\n", response.getStatus());
	}
}
