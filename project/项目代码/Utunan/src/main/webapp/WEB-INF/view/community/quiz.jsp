<%--
  Created by IntelliJ IDEA.
  User: 孙程程
  Date: 2018/11/19
  Time: 16:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<%@ page import="java.util.List,com.utunan.pojo.*" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>问答列表</title>
    <link rel="stylesheet" href="/css/common.css">
    <link rel="stylesheet" type="text/css" href="/css/community/questionIndex.css"/>
    <link rel="stylesheet" href="/css/community/layui.css">
    <link rel="stylesheet" href="/css/community/global.css">
    <link rel="stylesheet" href="/css/community/tagCloud.css">
    <link rel="stylesheet" href="/css/school/login.css">
    <script type="text/javascript" src="/js/community/tagcloud.js"></script>
    <script> var pagenum="${PageInfo.pageNum}"</script>
    <script type="text/javascript" src="https://unpkg.com/wangeditor@3.1.1/release/wangEditor.min.js"></script>
    <!--<script src="http://code.jquery.com/jquery-1.4.2.min.js"></script>-->
    <script src="/js/community/jquery-1.10.2.js"></script>
    <script src="/js/community/tag.js"></script>
</head>
<script>
    $('nav a').on('click', function(e) {
        e.preventDefault(); // 阻止链接跳转
        var url = this.href; // 保存点击的地址

        $('nav a.current').removeClass('current');
        $(this).addClass('current');

        $('#container').remove();
        $('#content').load(url + ' #container').fadeIn('slow'); // 加载新内容,url地址与该地址下的选择器之间要有空格,表示该url下的#container
    });
</script>
<body>
<%@include file="../common/header.jsp"%>
<%--黑背景--%>
<div class="mask"></div>
<!--内容-->
<div class="layui-container">
    <div class="layui-row layui-col-space15">
        <div class="layui-col-md8">
        <c:if test="${url=='quizs'}">
            <div class="fly-panel" style="margin-bottom: 0;">
                <div class="fly-panel-title fly-filter">
                    <a href="/quizs/rt/1" class="${stateList[0]}">最新问题</a>
                    <span class="fly-mid"></span>
                    <a href="/quizs/pc/1" class="${stateList[1]}">热门问题</a>
                    <span class="fly-mid"></span>
                    <a href="">智能推荐</a>
                    <span class="fly-mid"></span>
                    <!--<span>TX：这里要加一个靠右的搜索框</span>-->
                    <div class="searchindex">
                        <form action="/searchquiz/1" method="post">
                            <input type="text" class=""  required  placeholder="请输入搜索条件..." name="wd">
                            <button class="layui-btn" type="submit">Go!</button>
                        </form>
                    </div>
                </div>
                <ul class="fly-list">
                    <c:forEach items="${object}" var="obj">
                    <li>
                        <a href="/member/${obj.user.userId}" class="fly-avatar">
                           <img src="${obj.user.userHeadImg}" alt="昵称">
                        </a>
                        <h2>
                            <a href="/quiz/${obj.quiz.quizId}">${obj.quiz.quizTitle}</a>
                        </h2>
                        <!--<span class="question-description">${obj.quiz.quizContent}</span>-->
                        <div class="fly-list-info">
                            <a href="/member/${obj.user.userId}" link>
                                ${obj.user.userNickName}
                            </a>
                            <span>
                                <fmt:formatDate value="${obj.quiz.releaseTime}" type="both"/>
                            </span>

                            <span class="fly-list-kiss layui-hide-xs" title="点赞"><img src="/images/community/praise.png"width="25px"height="20px" style="margin-top:-5px;">&nbsp;${obj.quiz.praiseCount}</span>
                            <!--<span class="layui-badge fly-badge-accept layui-hide-xs">已结</span>-->
                            <span class="fly-list-nums">
                                <i class="iconfont icon-pinglun1" title="回答"></i> ${obj.quiz.answerCount}
                            </span>
                        </div>
                        <div class="fly-list-badge">
                            <c:forEach items="${obj.tagList}" var="taglist">
                                <span class="layui-badge layui-bg-red">
                                    <a href="/quiztag/${taglist.tagName}/rt/1">
                                            ${taglist.tagName}
                                    </a>
                                </span>
                            </c:forEach>
                        </div>
                    </li>
                    </c:forEach>
                </ul>
                <div style="text-align: center">
                    <c:choose>
                        <c:when test="${not empty object}">
                            <div class="laypage-main" id="page">
                                <a href="/quizs/${orderBy}/1">首页</a>
                                <a href="/quizs/${orderBy}/${PageInfo.prePage}"><<</a>
                                <c:forEach var="i" begin="${PageInfo.navigateFirstPage}" end="${PageInfo.navigateLastPage}">
                                    <a name="${i}" href="/quizs/${orderBy}/${i}">${i}</a>
                                </c:forEach>
                                <c:choose>
                                    <c:when test="${PageInfo.nextPage==0}">
                                        <a href="/quizs/${orderBy}/${PageInfo.pages}">>></a>
                                    </c:when>
                                    <c:otherwise>
                                        <a href="/quizs/${orderBy}/${PageInfo.nextPage}">>></a>
                                    </c:otherwise>
                                </c:choose>
                                <a href="/quizs/${orderBy}/${PageInfo.pages}">尾页</a>
                            </div>
                        </c:when>
                        <c:otherwise>
                            <span style="text-align: center">小优没有帮您找到数据，过一会儿再来看看吧</span>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>
        </c:if>
        <c:if test="${url=='quiztag'}">
            <div class="fly-panel" style="margin-bottom: 0;">
                <div class="fly-panel-title fly-filter">
                    <a href="/quiztag/${tagName}/rt/1" class="${statelist[0]}">最新问题</a>
                    <span class="fly-mid"></span>
                    <a href="/quiztag/${tagName}/pc/1" class="${statelist[1]}">热门问题</a>
                    <span class="fly-mid"></span>
                    <a href="">智能推荐</a>
                    <span class="fly-mid"></span>
                    <!--<span>TX：这里要加一个靠右的搜索框</span>-->
                    <div class="searchindex">
                        <form action="/search/quiz/1" method="post">
                            <input type="text" class=""  required  placeholder="请输入搜索条件..." name="wd">
                            <button class="layui-btn" type="submit">Go!</button>
                        </form>
                    </div>
                </div>
                <ul class="fly-list">
                    <c:forEach items="${object}" var="obj">
                    <li>
                        <a href="/member/${obj.user.userId}" class="fly-avatar">
                           <img src="${obj.user.userHeadImg}" alt="昵称">
                        </a>
                        <h2>
                            <a href="/quiz/${obj.quiz.quizId}">${obj.quiz.quizTitle}</a>
                        </h2>
                        <!--<span class="question-description">${obj.quiz.quizContent}</span>-->
                        <div class="fly-list-info">
                            <a href="/member/${obj.user.userId}" link>
                                ${obj.user.userNickName}
                            </a>
                            <span>
                                <fmt:formatDate value="${obj.quiz.releaseTime}" type="both"/>
                            </span>

                            <span class="fly-list-kiss layui-hide-xs" title="点赞"><img src="/images/community/praise.png"width="25px"height="20px" style="margin-top:-5px;">&nbsp;${obj.quiz.praiseCount}</span>
                            <!--<span class="layui-badge fly-badge-accept layui-hide-xs">已结</span>-->
                            <span class="fly-list-nums">
                                <i class="iconfont icon-pinglun1" title="回答"></i> ${obj.quiz.answerCount}
                            </span>
                        </div>
                        <div class="fly-list-badge">
                            <c:forEach items="${obj.tagList}" var="taglist">
                                <span class="layui-badge layui-bg-red">
                                    <a href="/quiztag/${taglist.tagName}/rt/1">
                                        <c:if test="${taglist.tagName == tagName}">
                                            <p STYLE="color: orange">${taglist.tagName}</p>
                                        </c:if>
                                        <c:if test="${taglist.tagName != tagName}">
                                            <p>${taglist.tagName}</p>
                                        </c:if>
                                    </a>
                                </span>
                            </c:forEach>
                        </div>
                    </li>
                    </c:forEach>
                </ul>
                <div style="text-align: center">
                    <c:choose>
                        <c:when test="${not empty object}">
                            <div class="laypage-main" id="page">
                                <a href="/quiztag/${tagName}/${orderBy}/1">首页</a>
                                <a href="/quiztag/${tagName}/${orderBy}/${PageInfo.prePage}"><<</a>
                                <c:forEach var="i" begin="${PageInfo.navigateFirstPage}" end="${PageInfo.navigateLastPage}">
                                    <a name="${i}" href="/quiztag/${tagName}/${orderBy}/${i}">${i}</a>
                                </c:forEach>
                                <c:choose>
                                    <c:when test="${PageInfo.nextPage==0}">
                                        <a href="/quiztag/${tagName}/${orderBy}/${PageInfo.pages}">>></a>
                                    </c:when>
                                    <c:otherwise>
                                        <a href="/quiztag/${tagName}/${orderBy}/${PageInfo.nextPage}">>></a>
                                    </c:otherwise>
                                </c:choose>
                                <a href="/quiztag/${tagName}/${orderBy}/${PageInfo.pages}">尾页</a>
                            </div>
                        </c:when>
                        <c:otherwise>
                            <span style="text-align: center">小优没有帮您找到数据，过一会儿再来看看吧</span>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>
        </c:if>
        </div>
        <div class="layui-col-md4" id="layui-col-md4">
            <div class="fly-panel">
                <div class="fly-panel-main">
                    <a href="javascript:void(0);" id="question" target="_blank" class="fly-zanzhu" style="background-color: #393D49;">发表提问</a>
                </div>
            </div>
    
            <dl class="fly-panel fly-list-one">
                <!--选出10个评论数最高的问题-->
                <dt class="fly-panel-title">本周热议</dt>
                <c:forEach items="${quizListTop10}" var="q">
                    <dd>
                        <a href="/quiz/${q.quizId}">${q.quizTitle }</a>
                        <span><i class="iconfont icon-pinglun1"></i>${q.answerCount }</span>
                    </dd>
                </c:forEach>

            </dl>



            <div class="fly-panel fly-link">
                <h3 class="fly-panel-title">热门标签</h3>
                <div class="wrapper1">
                    <div class="tagcloud fl">
                        <c:forEach items="${tag}" var="tags">
                            <a href="/quiztag/${tags[0].tagName}/rt/1" target="_blank" class="tag">${tags[0].tagName}&nbsp;&nbsp;${tags[1]}</a>
                        </c:forEach>
                    </div>
                </div><!--wrapper-->
            </div>
        </div>
    </div>
</div>
<%--弹窗登录表单--%>
<%@include file="../common/login.jsp"%>


<%@include file="../common/footer.jsp"%>
</body>

<script src="/js/common/common.js"></script>
<script >
    //添加标签
    var tag = new Tag("tagValue");
    tag.initView();
</script>
<script type="text/javascript">
    /*3D标签云*/
    var radius=document.getElementById("layui-col-md4").offsetWidth;
    console.log(radius);
    tagcloud({
        selector: ".tagcloud",  //元素选择器
        fontsize: 16,       //基本字体大小, 单位px
        radius: radius*0.2,         //滚动半径, 单位px
        mspeed: "normal",   //滚动最大速度, 取值: slow, normal(默认), fast
        ispeed: "normal",   //滚动初速度, 取值: slow, normal(默认), fast
        direction: 0,     //初始滚动方向, 取值角度(顺时针360): 0对应top, 90对应left, 135对应right-bottom(默认)...
        keep: false          //鼠标移出组件后是否继续随鼠标滚动, 取值: false, true(默认) 对应 减速至初速度滚动, 随鼠标滚动
    });
</script>
<script>
    //分页页码选中刷新后样式
    var page=document.getElementById("page");
    var pages=page.getElementsByTagName("a");
    console.log(${PageInfo.pageNum});
    console.log(pages);
    if(${PageInfo.pageNum==Null}){
        pages[0].style.backgroundColor="#009E94";
        pages[0].style.color="#ffffff";
    }else{
        pages[0].style.backgroundColor="";
        for(var i=0;i<pages.length;i++){
            console.log(pages[i].innerHTML);
            if(pages[i].innerHTML=="${PageInfo.pageNum}") {
                pages[i].style.backgroundColor="#009E94";
                pages[i].style.color="#ffffff";
            }
        }
    }
</script>
<script>
    /*弹窗登录功能*/
    var ask=document.getElementById("question");
    var mask=document.getElementsByClassName("mask")[0];
    var modalDialogcontent=document.getElementsByClassName("modalDialogcontent")[0];
    /*获取提交按钮*/
    var submitbutton = document.getElementById("submitbutton");
    /*获取密码框*/
    password = document.getElementById('password');
    textpassword=document.getElementById("login_showPwd");

    /*点击评论提交判断是否是用户，不是用户则弹出框*/
    ask.onclick=function(){
        if(${user==null}){
            mask.style.display="block";
            modalDialogcontent.style.display="block";
        }else{
            window.location.href="/toAddQuestion";
        }
    };

    //判断用户名和密码
    submitbutton.onclick=function(){
        $.ajax({
            //几个参数需要注意一下
            type: "POST",//方法类型
            dataType: "json",//预期服务器返回的数据类型
            url: "/popsupLogin" ,//url
            data: $('#loginform').serialize(),
            success: function (result) {
                console.log(result);//打印服务端返回的数据(调试用)
                if(result==true){
                    console.log("登录成功");
                    window.location.href="/toAddQuestion";
                }else{
                    textpassword.style.display="block";
                    password.style.display="none";
                    textpassword.parentNode.style.border = '1px solid red';
                    textpassword.style.color="red";
                    textpassword.value="密码错误";
                }
            },
            error : function() {
                console.log("网崩了！")
            }
        });
    };
</script>
<script src="/js/common/login.js"></script>
<script src="http://www.jq22.com/jquery/jquery-1.10.2.js"></script>
</html>
