/*package com.fortune.aop_Controller;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;

@Aspect
public class LoggingAspect {

	@Before("execution(* sdk.spring.service..*(..))")
	public void logBefore(JoinPoint joinPoint) {

		System.out.println("*** logBefore() is running!");
		System.out.println("*** hijacked : " + joinPoint.getSignature().getName());
	}
}*/