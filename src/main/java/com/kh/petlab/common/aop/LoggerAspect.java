package com.kh.petlab.common.aop;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.Signature;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.stereotype.Component;
import org.springframework.util.StopWatch;

import lombok.extern.slf4j.Slf4j;

/**
 * #11.1 Aspect작성(pointcut + advice)
 *
 */
@Component // 빈등록을 위해
@Aspect // aspect 사용을 우해
@Slf4j
public class LoggerAspect {

	/*	*//**
			 * com.kh.spring.todo 패키지 하위의 모든 클래스 모든 메소드 - 매개변수 상관없음 - 리턴타입 상관없음
			 */
	/*
	 * @Pointcut("execution(* com.kh.spring.todo..*(..))") public void pointcut() {}
	 * 
	 * @Pointcut("execution(* com.kh.spring.todo.controller.TodoController.insertTodo(..))"
	 * ) public void stopwatch() {}
	 * 
	 * @Around("stopwatch()") public Object stopwatchInsertTodo(ProceedingJoinPoint
	 * joinPoint) throws Throwable {
	 * 
	 * StopWatch timer = new StopWatch(); timer.start();
	 * 
	 * Object result = joinPoint.proceed();
	 * 
	 * timer.stop(); log.debug("toalTime = {}", timer.prettyPrint()); return result;
	 * }
	 * 
	 *//**
		 * joinpoint 앞뒤에서 실행되는 Around Advice
		 * 
		 * @param joiPoint
		 * @return
		 * @throws Throwable
		 *//*
			 * @Around("pointcut()") public Object logger(ProceedingJoinPoint joinPoint)
			 * throws Throwable { Signature signature = joinPoint.getSignature(); String
			 * type = signature.getDeclaringTypeName(); // 클래스명 String method =
			 * signature.getName(); // 메소드명
			 * 
			 * // before log.debug("[before]{}.{}", type, method);
			 * 
			 * Object returnObj = joinPoint.proceed();
			 * 
			 * // after log.debug("[after]{}.{}", type, method);
			 * 
			 * return returnObj; }
			 */

}
