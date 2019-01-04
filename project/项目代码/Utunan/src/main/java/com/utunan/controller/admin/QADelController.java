package com.utunan.controller.admin;

import com.utunan.service.admin.QADelService;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;

@Controller
public class QADelController {
    @Autowired
    private QADelService qaDelService;

    //删除单个提问
    @RequestMapping(value = "/delquiz",method = RequestMethod.GET)
    @ResponseBody
    public void delquiz(@Param("n") String n,HttpServletRequest request){
        this.qaDelService.delQuiz(Long.parseLong(n));
    }
    //批量删除提问
    @RequestMapping(value = "/delallquiz",method = RequestMethod.GET)
    @ResponseBody
    public void delallquiz(@Param("d") String d, HttpServletRequest request){
        String[] data=d.split(",");
        Long[] b=new Long[data.length];
        for (int i = 0; i <data.length ; i++) {
            b[i]=new Long(data[i]) ;
        }
        this.qaDelService.delAllQuiz(b);
    }

    //删除单个回答
    @RequestMapping(value = "/delanswer",method = RequestMethod.GET)
    @ResponseBody
    public void delanswer(@Param("n") String n,HttpServletRequest request){
        this.qaDelService.delAnswer(Long.parseLong(n));
    }
    //批量删除回答评论
    @RequestMapping(value = "/delallanswer",method = RequestMethod.GET)
    @ResponseBody
    public void delallanswer(@Param("d") String d, HttpServletRequest request){
        String[] data=d.split(",");
        Long[] b=new Long[data.length];
        for (int i = 0; i <data.length ; i++) {
            b[i]=new Long(data[i]) ;
        }
        this.qaDelService.delAllAnswer(b);
    }
}
