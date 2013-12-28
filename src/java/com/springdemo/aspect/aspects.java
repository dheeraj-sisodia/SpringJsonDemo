package com.springdemo.aspect;

import com.springdemo.controller.CustomerController;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.stereotype.Component;

@Component
@Aspect
public class aspects {

    @Pointcut("within(@org.springframework.stereotype.Controller *)")
    public void controller() {
    }
    
    @Pointcut("execution(* listEmployees())")
    public void method1() {
    }

    @Before("method1()")
    public void doAccessCheck(JoinPoint joinPoint) {
        System.out.println("----------------working--------------"+joinPoint.getClass().getSimpleName());
        // For testing purposes.
    }
//    @Pointcut("execution(private * com.springdemo.controller.EmployeeController.prepareModel(..))")
//    public void firstpointcut() {
//        System.out.println("------------firstpointcut----------");
//    }
//
//    @Before("firstpointcut()")
//    public void aspectTest(JoinPoint j) throws Exception {
//        try {
//            EmployeeController ec = (EmployeeController) j;
//            if (ec == null) {
//                System.out.println("---------------Null----------------");
//            }
//            System.out.println("----aspect working----");
//
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//        throw new Exception();
}
