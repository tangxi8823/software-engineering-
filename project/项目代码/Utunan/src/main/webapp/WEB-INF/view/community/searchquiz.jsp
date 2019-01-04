<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 孙程程
  Date: 2018/12/8
  Time: 14:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>搜索结果</title>
    <link rel="stylesheet" href="/css/common.css">
    <link rel="stylesheet" type="text/css" href="/css/community/questionIndex.css"/>
    <link rel="stylesheet" href="/css/community/layui.css">
    <link rel="stylesheet" href="/css/community/global.css">
    <link rel="stylesheet" href="/css/community/tagCloud.css">
    <script type="text/javascript" src="/js/community/tagcloud.js"></script>
    <script> var pagenum="${PageInfo.pageNum}"</script>
    <script type="text/javascript" src="https://unpkg.com/wangeditor@3.1.1/release/wangEditor.min.js"></script>
    <!--<script src="http://code.jquery.com/jquery-1.4.2.min.js"></script>-->
    <script src="/js/community/jquery-1.10.2.js"></script>
    <script src="/js/community/tag.js"></script>
</head>

<body>
<%@include file="../common/header.jsp"%>
    <!--内容-->
    <div class="layui-container">
        <div class="layui-row layui-col-space15">
            <div class="layui-col-md8">
                    <div class="fly-panel" style="margin-bottom: 0;">
                        <div class="fly-panel-title fly-filter">
                            <a href="/searchquiz/1?wd=${keyWord}"class="${statelist[1]}">搜索提问</a>
                            <span class="fly-mid"></span>
                            <a href="/searchanswer/1?wd=${keyWord}"class="${statelist[1]}">搜索回答</a>
                        </div>

                        <c:if test="${url=='/searchquiz'}">
                            <ul class="fly-list">
                                <c:forEach items="${object}" var="obj">
                                    <li>
                                        <a href="/member/${obj.quiz.user.userId}" class="fly-avatar">
                                            <img src="${obj.quiz.user.userHeadImg}" alt="昵称">
                                        </a>
                                        <h2>
                                            <a href="/quiz/${obj.quiz.quizId}">${obj.quiz.quizTitle}</a>
                                        </h2>
                                        <!--<span class="question-description">${obj.quiz.quizContent}</span>-->
                                        <div class="fly-list-info">
                                            <a href="/member/${obj.quiz.user.userId}" link>
                                                    ${obj.quiz.user.userNickName}
                                            </a>
                                            <span>
                                                <fmt:formatDate value="${obj.quiz.releaseTime}" type="both"/>
                                            </span>

                                            <span class="fly-list-kiss layui-hide-xs" title="点赞"><img src="/images/community/praise.png" width="25px" height="20px" style="margin-top:-5px;">&nbsp;${obj.quiz.praiseCount}</span>
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
                            <!--分页-->
                            <%@include file="page.jsp"%>
                        </c:if>
                        <c:if test="${url=='/searchanswer'}">
                            <ul class="list">
                                <c:forEach items="${object}" var="answer">
                                    <li>
                                        <div class="detail-about">
                                            <a class="fly-avatar" href="/member/${answer.user.userId}" class="fly-avatar">
                                                <img src="${answer.user.userHeadImg}" alt="昵称">
                                            </a>
                                            <div class="fly-detail-user">
                                                回复：
                                                <a href="/quiz/${answer.quiz.quizId}" class="fly-link">
                                                    <cite>${answer.quiz.quizTitle}</cite>
                                                </a>
                                                <span>
                                            <fmt:formatDate value="${answer.answerTime}" type="both"/>
                                        </span>
                                                <span title="点赞">点赞量：${answer.praiseCount}</span>
                                                <span>${answer.parentAnswer}</span>
                                            </div>
                                            <div class="detail-hits">
                                                <div style="padding-right: 10px; color: #FF7200">${answer.answerContent}</div>
                                            </div>
                                        </div>
                                    </li>

                                </c:forEach>
                            </ul>
                            <!--分页-->
                            <%@include file="page.jsp"%>
                        </c:if>

                 </div>
            </div>
            <div class="layui-col-md4" id="layui-col-md4">
                <div class="fly-panel">
                    <div class="fly-panel-main">
                        <a href="/quiz" target="_blank" class="fly-zanzhu" style="background-color: #393D49;">发表提问</a>
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

<%@include file="../common/footer.jsp"%>
</body>
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
</html>
