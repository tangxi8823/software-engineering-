package com.utunan.controller.school;

import com.github.pagehelper.PageInfo;
import com.utunan.pojo.base.user.User;
import com.utunan.pojo.inherit.school.PublishSchool;
import com.utunan.pojo.inherit.user.PublishDirectionCollector;
import com.utunan.pojo.util.Analyzer;
import com.utunan.util.SchoolOther;
import com.utunan.service.school.PublishSchoolService;
import com.utunan.service.user.PublishDirectionCollectorService;
import net.sf.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

/**
 * @author 王碧云
 * @description: 院校库首页控制
 * @date 2018/11/27/027 20:34
 */
@Controller
@RequestMapping("/school")
public class SchoolSearchController {
    @Autowired
    private PublishSchoolService publishSchoolService;
    @Autowired
    private PublishDirectionCollectorService publishDirectionCollectorService;

    /*
     * @author  王碧云
     * @description 显示院校库初始页面
     * @date  15:51 2018/12/16/016
     * @param  [request, pageNum, session]
     * @return  java.lang.String
     */
    @RequestMapping("/displaySchool")
    public String displaySchool(HttpServletRequest request,
                                @RequestParam(value = "pageNum",required = false) String pageNum,
                                HttpSession session){
        User user = (User) session.getAttribute("User");
        Long userId = null;
        if(user != null){
            //用户已登录
            userId = user.getUserId();
        }
        //查找收藏的院校Id
        List<Long> directionIdList = this.publishDirectionCollectorService.findDirectionIdByUser(userId);
        //查询列表并分页
        List<PublishSchool> schoolList =null;
        if(pageNum == null ||pageNum == ""|| Integer.parseInt(pageNum) <= 0){
            schoolList = this.publishSchoolService.findAllSchool(1,15);
        }else{
            schoolList = this.publishSchoolService.findAllSchool(Integer.parseInt(pageNum),15);
        }

        request.setAttribute("url", "displaySchool");
        request.setAttribute("schoolList", schoolList);
        request.setAttribute("PageInfo",new PageInfo(schoolList,8));
        request.setAttribute("directionIds",directionIdList);
        request.setAttribute("user", user);

        return "/school/schoolIndex";
    }

    /*
     * @author  王碧云
     * @description 根据搜索返回页面
     * @date  17:14 2018/12/28/028
     * @param  [request, schoolProvinceList, schoolTypeList, degreeTypeList, mathList, englishList, directionName, schoolName, pageNum, session]
     * @return  java.lang.String
     */
    @RequestMapping(value="/displaySchoolBySearch")
    public String displaySchoolBySearch(HttpServletRequest request,
                                        @RequestParam(value = "schoolProvince",required = false) String[] schoolProvinceList,
                                        @RequestParam(value = "schoolType",required = false) String[] schoolTypeList,
                                        @RequestParam(value = "degreeType",required = false) String[] degreeTypeList,
                                        @RequestParam(value = "math",required = false) String[] mathList,
                                        @RequestParam(value = "english",required = false) String[] englishList,
                                        @RequestParam(value = "directionName",required = false) String directionName,
                                        @RequestParam(value = "schoolName",required = false) String schoolName,
                                        @RequestParam(value = "pageNum",required = false) String pageNum,
                                        HttpSession session){
        //对搜索框内容进行分词
        Analyzer analyzer = new Analyzer();
        directionName = analyzer.filter(directionName);
        schoolName = analyzer.filter(schoolName);
        //研究方向分词
        List<String> directionNameList = new ArrayList<>();
        if(directionName.equals("") || directionName==null){
            directionNameList.add(".");
        }else{
            //对搜索条件进行分词
            try {
                directionNameList = analyzer.Analyzer(directionName);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        SchoolOther so = new SchoolOther();
        //判断搜索条件是否为空
        schoolProvinceList=so.ifListIsNull(schoolProvinceList);
        schoolTypeList=so.ifListIsNull(schoolTypeList);
        degreeTypeList=so.ifListIsNull(degreeTypeList);
        mathList=so.ifListIsNull(mathList);
        englishList=so.ifListIsNull(englishList);

        //获取用户
        User user = (User) session.getAttribute("User");
        Long userId = null;
        if(user != null){
            //用户已登录
            userId = user.getUserId();
        }
        //查找收藏的院校Id
        List<Long> directionIdList = this.publishDirectionCollectorService.findDirectionIdByUser(userId);
        //搜索学校列表并分页
        List<PublishSchool> schoolList =null;
        if(pageNum == null ||pageNum == ""|| Integer.parseInt(pageNum) <= 0){
            schoolList = this.publishSchoolService.findSchoolByAllParam(schoolProvinceList, schoolTypeList,degreeTypeList,mathList,englishList,directionNameList,schoolName,1,15);
        }else{
            schoolList = this.publishSchoolService.findSchoolByAllParam(schoolProvinceList, schoolTypeList,degreeTypeList,mathList,englishList,directionNameList,schoolName,Integer.parseInt(pageNum),15);
        }

        //将String[]转为String
        String schoolProvince=so.listToString(schoolProvinceList);
        String schoolType=so.listToString(schoolTypeList);
        String degreeType=so.listToString(degreeTypeList);
        String math=so.listToString(mathList);
        String english = so.listToString(englishList);

        request.setAttribute("schoolList", schoolList);
        request.setAttribute("url", "displaySchoolBySearch");
        request.setAttribute("schoolProvince", schoolProvince);
        request.setAttribute("schoolType", schoolType);
        request.setAttribute("degreeType", degreeType);
        request.setAttribute("math", math);
        request.setAttribute("english", english);
        request.setAttribute("directionName", directionName);
        request.setAttribute("schoolName", schoolName);
        request.setAttribute("PageInfo",new PageInfo(schoolList,8));
        request.setAttribute("directionIds",directionIdList);
        request.setAttribute("user", user);

        return "/school/schoolIndex";
    }
    /*
     * @author  王碧云
     * @description 判断是否收藏
     * @date  15:25 2018/12/22/022
     * @param  [directionId, session, response]
     * @return  void
     */
    @ResponseBody
    @RequestMapping("/updateDCollector")
    public void updateDCollector(@RequestParam(value = "directionId") String directionId,
                                 HttpSession session, HttpServletResponse response) throws IOException {
        User user = (User) session.getAttribute("User");
        //创建JSON
        JSONObject obj=new JSONObject();
        //到院校收藏表里查看是否有记录
        PublishDirectionCollector pdc = this.publishDirectionCollectorService.findDCollector(Long.parseLong(directionId),user.getUserId());
        //判断是否有记录
        if(pdc==null){
            //没有记录，则添加收藏
            this.publishDirectionCollectorService.insertDirectionCollector(user.getUserId(), Long.parseLong(directionId));
            obj.put("res", "ok");
            response.getWriter().append(obj.toString());
        }else {
            //有记录，取消收藏
            this.publishDirectionCollectorService.deleteDirectionCollector(user.getUserId(), Long.parseLong(directionId));
            obj.put("res", "no");
            response.getWriter().append(obj.toString());
        }
    }
}

