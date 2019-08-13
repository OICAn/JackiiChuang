package com.jackiifilwhh.exception;

import org.springframework.web.servlet.HandlerExceptionResolver;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CustomExceptionResolver implements HandlerExceptionResolver {
    @Override
    public ModelAndView resolveException
            (HttpServletRequest httpServletRequest,
             HttpServletResponse httpServletResponse,
             Object o, Exception e) {
        e.printStackTrace();
        CustomException customException = null;
        if(e instanceof CustomException){
            customException = (CustomException) e;
        } else {
            customException = new CustomException("系统错误！请于管理员联系！");
        }
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("message", customException.getMessage());
        modelAndView.setViewName("error");
        return modelAndView;
    }
}
