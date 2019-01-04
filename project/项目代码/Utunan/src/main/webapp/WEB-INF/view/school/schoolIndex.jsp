<!--院校库首页2.0-->
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="/intel" prefix="ya" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="zh-cn">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>优图南-院校库</title>
    <link rel="stylesheet" href="/layui/wyd/layui.css">
    <link rel="stylesheet" href="/layui/wyd/global.css">
    <link rel="stylesheet" href="/css/common.css">
    <link rel="stylesheet" href="/css/school/login.css">
    <link rel="stylesheet" href="/css/school/new.css">
    <link rel="shortcut icon" href="/images/favicon.ico" type="image/x-icon">
    <script>
        var pagenum="${PageInfo.pageNum}"
    </script>
</head>
<body>
<%@include file="../common/header.jsp"%>
<%--黑背景--%>
<div class="mask"></div>
<div class="layui-container">
    <div class="layui-row layui-col-space15">
        <div class="back">
            <div class="bigwrapper">
                    <form class="condition" action="/school/displaySchoolBySearch">
                        <div  class="RadioStyle">
                            <div class="options">
                                <span class="optionName">院校所在地 ></span>
                                <div class="option" id="district">
                                    <input class="all" name="schoolProvince" type="checkbox" value="全部" id="所在地全部"><label for="所在地全部">全部</label>
                                    <input class="part" name="schoolProvince" type="checkbox" value="北京" id="北京"><label for="北京">北京</label>
                                    <input class="part" name="schoolProvince" type="checkbox" value="天津" id="天津"><label for="天津">天津</label>
                                    <input class="part" name="schoolProvince" type="checkbox" value="上海" id="上海"><label for="上海">上海</label>
                                    <input class="part" name="schoolProvince" type="checkbox" value="重庆" id="重庆"><label for="重庆">重庆</label>
                                    <input class="part" name="schoolProvince" type="checkbox" value="河北" id="河北"><label for="河北">河北</label>
                                    <input class="part" name="schoolProvince" type="checkbox" value="山西" id="山西"><label for="山西">山西</label>
                                    <input class="part" name="schoolProvince" type="checkbox" value="辽宁" id="辽宁"><label for="辽宁">辽宁</label>
                                    <input class="part" name="schoolProvince" type="checkbox" value="吉林" id="吉林"><label for="吉林">吉林</label>
                                    <input class="part" name="schoolProvince" type="checkbox" value="黑龙江" id="黑龙江"><label for="黑龙江">黑龙江</label>
                                    <input class="part" name="schoolProvince" type="checkbox" value="江苏" id="江苏"><label for="江苏">江苏</label>
                                    <input class="part" name="schoolProvince" type="checkbox" value="浙江" id="浙江"><label for="浙江">浙江</label>
                                    <input class="part" name="schoolProvince" type="checkbox" value="安徽" id="安徽"><label for="安徽">安徽</label>
                                    <input class="part" name="schoolProvince" type="checkbox" value="福建" id="福建"><label for="福建">福建</label>
                                    <input class="part" name="schoolProvince" type="checkbox" value="江西" id="江西"><label for="江西">江西</label>
                                    <input class="part" name="schoolProvince" type="checkbox" value="山东" id="山东"><label for="山东">山东</label>
                                    <input class="part" name="schoolProvince" type="checkbox" value="河南" id="河南"><label for="河南">河南</label>
                                    <input class="part" name="schoolProvince" type="checkbox" value="湖北" id="湖北"><label for="湖北">湖北</label>
                                    <input class="part" name="schoolProvince" type="checkbox" value="湖南" id="湖南"><label for="湖南">湖南</label>
                                    <input class="part" name="schoolProvince" type="checkbox" value="广东" id="广东"><label for="广东">广东</label>
                                    <input class="part" name="schoolProvince" type="checkbox" value="海南" id="海南"><label for="海南">海南</label>
                                    <input class="part" name="schoolProvince" type="checkbox" value="四川" id="四川"><label for="四川">四川</label>
                                    <input class="part" name="schoolProvince" type="checkbox" value="贵州" id="贵州"><label for="贵州">贵州</label>
                                    <input class="part" name="schoolProvince" type="checkbox" value="云南" id="云南"><label for="云南">云南</label>
                                    <input class="part" name="schoolProvince" type="checkbox" value="陕西" id="陕西"><label for="陕西">陕西</label>
                                    <input class="part" name="schoolProvince" type="checkbox" value="甘肃" id="甘肃"><label for="甘肃">甘肃</label>
                                    <input class="part" name="schoolProvince" type="checkbox" value="青海" id="青海"><label for="青海">青海</label>
                                    <input class="part" name="schoolProvince" type="checkbox" value="广西" id="广西"><label for="广西">广西</label>
                                    <input class="part" name="schoolProvince" type="checkbox" value="西藏" id="西藏"><label for="西藏">西藏</label>
                                    <input class="part" name="schoolProvince" type="checkbox" value="内蒙古" id="内蒙古"><label for="内蒙古">内蒙古</label>
                                    <input class="part" name="schoolProvince" type="checkbox" value="宁夏" id="宁夏"><label for="宁夏">宁夏</label>
                                    <input class="part" name="schoolProvince" type="checkbox" value="新疆" id="新疆"><label for="新疆">新疆</label>
                                </div>
                            </div>
                            <div class="options">
                                <span class="optionName">院校特性 ></span>
                                <div class="option" id="kind">
                                    <input class="kind-all" name="schoolType" type="checkbox" value=""  id="院校特性全部"><label for="院校特性全部">全部</label>
                                    <input class="kind-part" name="schoolType" type="checkbox" value="985" id="985院校"><label for="985院校">985院校</label>
                                    <input class="kind-part" name="schoolType" type="checkbox" value="211" id="211院校"><label for="211院校">211院校</label>
                                    <input class="kind-part" name="schoolType" type="checkbox" value="自划线" id="自划线"><label for="自划线">自主划线</label>
                                </div>
                            </div>
                            <div class="options">
                                <span class="optionName">学位类型 ></span>
                                <div class="option" id="degree">
                                    <input class="degree-all" name="degreeType" type="checkbox" value="" id="学位全部"><label for="学位全部">全部</label>
                                    <input class="degree-part" name="degreeType" type="checkbox" value="学硕" id="学硕"><label for="学硕">学硕</label>
                                    <input class="degree-part" name="degreeType" type="checkbox" value="专硕" id="专硕"><label for="专硕">专硕</label>
                                </div>
                            </div>
                            <div class="options">
                                <span class="optionName">考试科目 ></span>
                                <div class="subjectoption">
                                    <div class="option" id="math">
                                        <input class="math-all" name="math" type="checkbox" value="" id="数学全部"><label for="数学全部">全部</label>
                                        <input class="math-part" name="math" type="checkbox" value="一" id="数学(一)"><label for="数学(一)">数学(一)</label>
                                        <input class="math-part" name="math" type="checkbox" value="二" id="数学(二)"><label for="数学(二)">数学(二)</label>
                                    </div>
                                    <div class="option" id="english">
                                        <input class="english-all" name="english" type="checkbox" value="" id="英语全部"><label for="英语全部">全部</label>
                                        <input class="english-part" name="english" type="checkbox" value="一" id="英语(一)"><label for="英语(一)">英语(一)</label>
                                        <input class="english-part" name="english" type="checkbox" value="二" id="英语(二)"><label for="英语(二)">英语(二)</label>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="option-search">
                            <div class="options">
                                <span class="optionName">研究方向 ></span>
                                <input name="directionName" type="text" id="direction"  value="" placeholder="（选填）如：大数据"  class="layui-input">
                            </div>
                            <div class="options">
                                <span class="optionName">院校名称 ></span>
                                <input name="schoolName" type="text" id="sname"  value="" placeholder="（选填）如：河北师范大学"  class="layui-input">
                                <input type="submit" value="搜索" id="search" class="layui-btn layui-btn-normal"/>
                            </div>
                        </div>
                    </form><!--condition-->
                </div><!--bigwrapper-->
            </div>
            <table class="layui-table" lay-skin="line">
                <colgroup>
                    <col width="150">
                    <col width="200">
                    <col>
                </colgroup>
                <thead>
                    <tr>
                        <th>招生单位</th>
                        <th>院系名称</th>
                        <th>学位类型</th>
                        <th>专业</th>
                        <th>研究方向</th>
                        <th>考试范围</th>
                        <th>收藏</th>
                    </tr>
                </thead>
                <tbody>
                <c:set var="sum" value="0"></c:set>
                <%--显示各个学校的各个专业--%>
                <c:forEach items="${schoolList}" var="school" >
                    <c:forEach items="${school.direction}" var="direction" >
                        <tr>
                            <td>${direction.schoolName}</td>
                            <td>${direction.collegeName}</td>
                            <td class="type">&nbsp;&nbsp;${direction.degreeType}</td>
                            <td>${direction.majorlName}</td>
                            <td>${direction.directionName}</td>
                            <td><a href="/school/schooldetail/1" style="color:#FC6111">查看更多</a></td>
                            <%--判断是否是用户所收藏的院校--%>
                            <td>
                            <c:choose>
                                <c:when test="${ya:judge(directionIds,direction.directionId)}">
                                    <a href="javascript:void(0);" onclick="collector(${direction.directionId})"><img id="collect${direction.directionId}" src="/images/school/redheart.svg"  width="20px" height="20px" alt="" srcset=""></a>
                                </c:when>
                                <c:otherwise>
                                    <a href="javascript:void(0);" onclick="collector(${direction.directionId})"><img id="collect${direction.directionId}" src="/images/school/whiteheart.svg"  width="20px" height="20px" alt="" srcset=""></a>
                                </c:otherwise>
                            </c:choose>
                            </td>
                        </tr>
                    </c:forEach>
                </c:forEach>
                </tbody>
            </table>
    </div>
</div>
<%--弹窗登录表单--%>
<%@include file="../common/login.jsp"%>
<%--分页--%>
<nav id="page" class="page">
    <li class="home"><a href="/school/${url}?schoolProvince=${schoolProvince}&schoolType=${schoolType}&degreeType=${degreeType}&math=${math}&english=${english}&directionName=${directionName}&schoolName=${schoolName}">首页</a></li>
    <li class="next"><a href="/school/${url}?schoolProvince=${schoolProvince}&schoolType=${schoolType}&degreeType=${degreeType}&math=${math}&english=${english}&directionName=${directionName}&schoolName=${schoolName}&pageNum=${PageInfo.prePage}">上一页</a></li>
    <c:forEach var="i" begin="${PageInfo.navigateFirstPage}" end="${PageInfo.navigateLastPage}">
        <li class="pagenum"><a name="${i}" href="/school/${url }?schoolProvince=${schoolProvince}&schoolType=${schoolType}&degreeType=${degreeType}&math=${math}&english=${english}&directionName=${directionName}&schoolName=${schoolName}&pageNum=${i}">${i}</a></li>
    </c:forEach>
    <c:choose>
        <c:when test="${PageInfo.nextPage==0}">
            <li class="next"><a href="/school/${url}?schoolProvince=${schoolProvince}&schoolType=${schoolType}&degreeType=${degreeType}&math=${math}&english=${english}&directionName=${directionName}&schoolName=${schoolName}&pageNum=${PageInfo.pages}">下一页</a></li>
        </c:when>
        <c:otherwise>
            <li class="next"><a href="/school/${url}?schoolProvince=${schoolProvince}&schoolType=${schoolType}&degreeType=${degreeType}&math=${math}&english=${english}&directionName=${directionName}&schoolName=${schoolName}&pageNum=${PageInfo.nextPage}">下一页</a></li>
        </c:otherwise>
    </c:choose>
    <li class="tail"><a href="/school/${url}?schoolProvince=${schoolProvince}&schoolType=${schoolType}&degreeType=${degreeType}&math=${math}&english=${english}&directionName=${directionName}&schoolName=${schoolName}&pageNum=${PageInfo.pages}">尾页</a></li>
</nav>
<%@include file="../common/footer.jsp"%>
</body>
<script src="http://www.jq22.com/jquery/jquery-1.10.2.js"></script>
<script src="/js/community/tag.js"></script>
<script>
    /*弹窗登录功能*/
    var mask=document.getElementsByClassName("mask")[0];
    var modalDialogcontent=document.getElementsByClassName("modalDialogcontent")[0];
    /*获取提交按钮*/
    var submit = document.getElementById("submitbutton");
    /*获取密码框*/
    password = document.getElementById('password');
    textpassword=document.getElementById("login_showPwd");

    /*判断是否是用户，是用户则收藏，不是用户则弹出框*/
    function collector(directionId) {
        if(${user==null}){
            mask.style.display="block";
            modalDialogcontent.style.display="block";
        }else{
            $.ajax({
                url:'/school/updateDCollector',//处理数据的地址
                type:'post',//数据提交形式
                data:{'directionId':directionId},
                dataType: "json",
                success:function(d){//数据返回成功的执行放大
                    var res = d.res;
                    if(res=='ok'){//添加收藏
                        console.log("收藏成功！");
                        document.getElementById("collect"+directionId).src="/images/school/redheart.svg";
                    }
                    if(res=='no'){//取消收藏
                        console.log("取消收藏！");
                        document.getElementById("collect"+directionId).src="/images/school/whiteheart.svg";
                    }
                },
                error : function() {
                    console.log("网可能不太好，请您稍等一会~");
                }
            });
        }
    }

    //判断用户名和密码
    submit.onclick=function(){
        $.ajax({
            type: "POST",//方法类型
            dataType: "json",//预期服务器返回的数据类型
            url: "/popsupLogin" ,//url
            data: $('#loginform').serialize(),
            success: function (result) {
                console.log(result);//打印服务端返回的数据(调试用)
                if(result==true){
                    window.location.href="/school/displaySchoolBySearch?schoolProvince=${schoolProvince}&schoolType=${schoolType}&degreeType=${degreeType}&math=${math}&english=${english}&directionName=${directionName}&schoolName=${schoolName}&pageNum=${PageInfo.pageNum}";
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
<script>
    //复选框状态保持
    var district=document.getElementById("district");
    var inputs=district.getElementsByTagName("input");

    if("${schoolProvince}"=="全部"||"${schoolProvince}"==""){
        inputs[0].checked=true;
    }else{
        inputs[0].checked=false;
        for(var j=1;j<inputs.length;j++){
            <c:forEach items="${schoolProvince}" varStatus="status" var="schoolProvince">
            if("${schoolProvince}"==inputs[j].value){
                inputs[j].checked=true;
            }
            </c:forEach>
        }
    }

    var kind=document.getElementById("kind");
    var inputskind=kind.getElementsByTagName("input");

    if("${schoolType}"==""||"${schoolType}"=="全部"){
        inputskind[0].checked = true;
    }else{
        inputskind[0].checked=false;
        for(var j=1;j<inputskind.length;j++){
            <c:forEach items="${schoolType}" varStatus="status" var="schoolType">
            if("${schoolType}"==inputskind[j].value){
                inputskind[j].checked=true;
            }
            </c:forEach>
        }
    }
    var degree=document.getElementById("degree");
    var inputsdegree=degree.getElementsByTagName("input");

    if("${degreeType}"==""||"${degreeType}"=="全部"){
        inputsdegree[0].checked = true;
    }else{
        inputsdegree[0].checked = false;
        for(var j=1;j<inputsdegree.length;j++){
            <c:forEach items="${degreeType}" varStatus="status" var="degreeType">
            if("${degreeType}"==inputsdegree[j].value){
                inputsdegree[j].checked=true;
            }
            </c:forEach>
        }
    }
    var math=document.getElementById("math");
    var inputsmath=math.getElementsByTagName("input");

    if("${math}"==""||"${math}"=="全部"){
        inputsmath[0].checked = true;
    }else{
        inputsmath[0].checked = false;
        for(var j=1;j<inputsmath.length;j++){
            <c:forEach items="${math}" varStatus="status" var="math">
            if("${math}"==inputsmath[j].value){
                inputsmath[j].checked=true;
            }
            </c:forEach>
        }
    }
    var english=document.getElementById("english");
    var inputsenglish=english.getElementsByTagName("input");

    if("${english}"==""||"${english}"=="全部"){
        inputsenglish[0].checked = true;
    }else{
        inputsenglish[0].checked = false;
        for(var j=1;j<inputsenglish.length;j++){
            <c:forEach items="${english}" varStatus="status" var="english">
            if("${english}"==inputsenglish[j].value){
                inputsenglish[j].checked=true;
            }
            </c:forEach>
        }
    }
    //研究方向搜索框文字保持
    var direction=document.getElementById("direction");
    if("${directionName}"!=""){
        direction.value="${directionName}";
    }
    //院校名称搜索框文字保持
    var sname=document.getElementById("sname");
    if("${schoolName}"!=""){
        sname.value="${schoolName}";
    }
</script>
<script>
    //地区
    $(".part").click(function(){
        if($(".all").is(":checked")){//如果点击的时候，当前为选中状态
            $(".all").attr("checked",false);//那么就改为未选中
        }else{
            $(".all").attr("checked",true)//否则就改为选中
        }
    })
    $(".all").click(function(){
        $(".part").attr("checked",false);
    })

    //学校属性
    $(".kind-part").click(function(){
        if($(".kind-all").is(":checked")){//如果点击的时候，当前为选中状态
            $(".kind-all").attr("checked",false);//那么就改为未选中
        }else{
            $(".kind-all").attr("checked",true)//否则就改为选中
        }
    })
    $(".kind-all").click(function(){
        $(".kind-part").attr("checked",false);
    })

    //学位类型
    $(".degree-part").click(function(){
        if($(".degree-all").is(":checked")){//如果点击的时候，当前为选中状态
            $(".degree-all").attr("checked",false);//那么就改为未选中
        }else{
            $(".degree-all").attr("checked",true)//否则就改为选中
        }
    })
    $(".degree-all").click(function(){
        $(".degree-part").attr("checked",false);
    })

    //数学
    $(".math-part").click(function(){
        if($(".math-all").is(":checked")){//如果点击的时候，当前为选中状态
            $(".math-all").attr("checked",false);//那么就改为未选中
        }else{
            $(".math-all").attr("checked",true)//否则就改为选中
        }
    })
    $(".math-all").click(function(){
        $(".math-part").attr("checked",false);
    })

    //英语
    $(".english-part").click(function(){
        if($(".english-all").is(":checked")){//如果点击的时候，当前为选中状态
            $(".english-all").attr("checked",false);//那么就改为未选中
        }else{
            $(".english-all").attr("checked",true)//否则就改为选中
        }
    })
    $(".english-all").click(function(){
        $(".english-part").attr("checked",false);
    })
</script>
<script>
    //分页页码选中刷新后样式
    var page=document.getElementById("page");
    var pages=page.getElementsByTagName("li");
    console.log(${PageInfo.pageNum});
    console.log(pages);
    if(${PageInfo.pageNum==Null}){
        pages[0].style.backgroundColor="RGB(0,150,146)";
    }else{
        pages[0].style.backgroundColor="";
        for(var i=0;i<pages.length;i++){
            console.log(pages[i].getElementsByTagName("a")[0].innerHTML);
            if(pages[i].getElementsByTagName("a")[0].innerHTML=="${PageInfo.pageNum}") {
                pages[i].style.backgroundColor="RGB(0,150,146)";
                pages[i].getElementsByTagName("a")[0].style.color="#ffffff";
            }
        }
    }
</script>
<script src="/js/common/login.js"></script>
<script src="/js/common/common.js"></script>
</html>
