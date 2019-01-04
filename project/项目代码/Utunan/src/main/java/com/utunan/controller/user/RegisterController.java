package com.utunan.controller.user;


import com.utunan.pojo.base.user.User;
import com.utunan.service.user.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
public class RegisterController {

    @Autowired
    private UserService userService;

    @RequestMapping(value="/register",method = RequestMethod.GET)
    public String register(HttpSession session){
        Object obj=session.getAttribute("User");
        if(obj==null)
            return "register";
        else
            return "redirect:/user";
    }

    @RequestMapping(value="/register",method =RequestMethod.POST)
    public String register(User user, HttpServletRequest request,HttpSession session,String code){
        boolean bool=userService.isExist(user);
        if(bool){
            request.setAttribute("reply","该手机号已被注册");
            return "register";
        }
        String checkcode= (String) session.getAttribute("code");
        if(!checkcode.equals(code)){
            request.setAttribute("reply","验证码错误");
            return "register";
        }
        String repassword=request.getParameter("rpassword");
        if(!user.getUserPassword().equals(repassword)){
            request.setAttribute("reply","两次输入的密码不相同,请重新输入.");
            return "register";
        }
        userService.saveUser(user);
        User account=userService.getUser(user);
        session.removeAttribute("registertel");
        session.setAttribute("User",account);
        session.removeAttribute("code");
        return "redirect:/user";
    }
}
