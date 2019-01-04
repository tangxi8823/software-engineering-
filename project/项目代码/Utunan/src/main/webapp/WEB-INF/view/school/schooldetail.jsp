<!--这是院校库2.0-->
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="/intel" prefix="ya" %>
<html>
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>院校详情</title>
  <link rel="stylesheet" href="/css/common.css">
  <link rel="stylesheet" href="/css/community/layui.css">
  <link rel="stylesheet" href="/css/community/global.css">
  <link rel="stylesheet" href="/css/school/detail.css">
  <link rel="stylesheet" href="/css/community/detail.css">
  <link rel="stylesheet" href="/css/school/login.css">
  <link rel="stylesheet" href="/css/school/animate.css">
  <link rel="stylesheet" href="/css/school/dialog.css">
  <script type="text/javascript" src="https://unpkg.com/wangeditor@3.1.1/release/wangEditor.min.js"></script>
</head>
<body>
<%@include file="../common/header.jsp"%>
<%--黑背景--%>
<div class="mask"></div>

<div class="layui-container">
  <div class="layui-row layui-col-space15">
    <div class="layui-col-md8">
      <div class="fly-panel detail-box" style="margin-bottom: 0;">
        <div class="blank"></div>
        <fieldset class="layui-elem-field">
          <legend>${publishDirection.schoolName} - ${publishDirection.majorlName}</legend>
          <div class="layui-field-box">
            <table>
              <tr>
                  <td class="zsml-title">招生单位：</td>
                  <td class="zsml-summary" >${publishDirection.schoolName}</td>
                  <td class="ssss"></td>
                  <td class="zsml-title">学位类型：</td>
                  <td class="zsml-summary">${publishDirection.degreeType}</td>
              </tr>
              <tr>
                  <td class="zsml-title">所在地：</td>
                  <td class="zsml-summary" >${publishDirection.school.schoolProvince}</td>
                  <td class="ssss"></td>
                  <td class="zsml-title">院系名称：</td>
                  <td class="zsml-summary">${publishDirection.collegeName}</td>
              </tr>
              <tr>
                  <td class="zsml-title">院校特性：</td>
                  <td class="zsml-summary">${publishDirection.school.schoolType}</td>
                  <td class="ssss"></td>
                  <td class="zsml-title">专业名称：</td>
                  <td class="zsml-summary">${publishDirection.degreeType}</td>
              </tr>
              <tr>
                  <td class="zsml-title">院校隶属：</td>
                  <td class="zsml-summary">${publishDirection.school.schoolSubjection}</td>
                  <td class="ssss"></td>
                  <td class="zsml-title">研究方向：</td>
                  <td class="zsml-summary">${publishDirection.directionName}</td>
              </tr>
          </table>
          </div>
        </fieldset>
        <blockquote class="layui-elem-quote layui-quote-nm"><img src="/images/school/note.svg" width="40px"><div class="til">考试范围</div></blockquote>
        <div class="zsml-result">
        <table  cellpadding="10" cellspacing="0" class="scope">
        <colgroup>
          <col width="25%">
          <col width="25%">
          <col width="25%">
          <col width="25%">
        </colgroup>
          <thead>
            <tr>
              <th>政治</th>
              <th>外语</th>
              <th>业务课一</th>
              <th>业务课二</th>
             </tr>    
          </thead>
          <tbody class="zsml-res-items">
            <tr>
              <td>
                  ${publishDirection.politics}
              </td>
              <td>${publishDirection.english}</td>
              <td>${publishDirection.math}</td>
              <td>${publishDirection.majorBasics}</td>
            </tr>
          </tbody>
        </table>
          <blockquote class="layui-elem-quote layui-quote-nm"><img src="/images/school/menwei.svg" width="50px"><div class="til">官方公告</div></blockquote>
        <ul class="layui-timeline">
          <li class="layui-timeline-item">
            <i class="layui-icon layui-timeline-axis"></i>
            <div class="layui-timeline-content layui-text">
              <%--判断是否有今年的招生简章--%>
              <c:choose>
                <c:when test="${not empty EGfile}">
                  <div class="layui-timeline-title">&nbsp;&nbsp;<a href="/file/${EGfile.fileId}">查看《${year}年${publishDirection.schoolName}硕士研究生招生简章》</a></div>
                </c:when>
                <c:otherwise>
                  <div class="layui-timeline-title">《${year}年${publishDirection.schoolName}硕士研究生招生简章》暂缺&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="/share1">我要上传</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="/searchfile?school=${publishDirection.schoolName}&fileType=招生简章&keyWord=">查看往年招生简章</a></div>
                </c:otherwise>
              </c:choose>
            </div>
          </li>
          <li class="layui-timeline-item">
            <i class="layui-icon layui-timeline-axis"></i>
            <div class="layui-timeline-content layui-text">
              <%--判断是否有今年的招生目录--%>
              <c:choose>
                <c:when test="${not empty AGfile}">
                  <div class="layui-timeline-title">&nbsp;&nbsp;<a href="/file/${AGfile.fileId}">查看《${year}年${publishDirection.schoolName}硕士研究生招生目录》</a></div>
                </c:when>
                <c:otherwise>
                  <div class="layui-timeline-title">《${year}年${publishDirection.schoolName}硕士研究生招生目录》暂缺&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="/share1">我要上传</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="/searchfile?school=${publishDirection.schoolName}&fileType=招生专业目录&keyWord=">查看往年招生目录</a></div>
                </c:otherwise>
              </c:choose>
            </div>
          </li>
        </ul>
        <blockquote class="layui-elem-quote layui-quote-nm"><img src="/images/school/hua.svg" width="40px"><div class="til">评论区&nbsp;&nbsp;&nbsp;&nbsp;</div></blockquote>
        <ul class="jieda" id="jieda">
          <c:forEach items="${publishDirection.directionComments}" var="dcomment">
          <li data-id="111" class="jieda-daan">
            <a name="item-1111111111"></a>
            <div class="detail-about detail-about-reply">
              
              <div class="fly-detail-user">
                <a href="" class="fly-link">
                  <cite>${dcomment.user.userNickName}</cite>
                </a>
                
                <span> 发表于<fmt:formatDate value='${dcomment.directionCommentTime}' type='date' pattern='yyyy-MM-dd HH:mm:ss'/></span>
              </div>

            </div>
            <div class="detail-body jieda-body photos">
              <p>${dcomment.directionCommentContent}</p>
            </div>
            <div class="jieda-reply">
              <%--点赞--%>
              <span class="jieda-zan zanok" type="zan">
                <c:choose>
                  <c:when test="${ya:judge(directionCommentGreatList,dcomment.directionCommentId)}">
                    <a style="color: #ff5722;" id="zan${dcomment.directionCommentId}" href="javascript:void(0)" onclick="apraise(${dcomment.directionCommentId})"><i class="iconfont icon-zan"></i></a>
                    <em id="directionComment${dcomment.directionCommentId}">${dcomment.directionCommentPraiseCount}</em>
                  </c:when>
                  <c:otherwise>
                    <a style="color: #333;" id="zan${dcomment.directionCommentId}" href="javascript:void(0)" onclick="apraise(${dcomment.directionCommentId},${dcomment.directionCommentPraiseCount})"><i class="iconfont icon-zan"></i></a>
                    <em id="directionComment${dcomment.directionCommentId}">${dcomment.directionCommentPraiseCount}</em>
                  </c:otherwise>
                </c:choose>
              </span>
              <%--判断是否是管理员或者是用户本人--%>
              <c:if test="${user.userIdentity==1 || (user.userIdentity==3 && user.userId==dcomment.user.userId)}">
              <span type="reply">
                <i class="iconfont icon-svgmoban53"></i>
                <a href="/school/deleteDirectionComment?directionCommentId=${dcomment.directionCommentId}&directionId=${publishDirection.directionId}">删除</a>
              </span>
              </c:if>
            </div>
          </li>
          </c:forEach>
          <!-- 无数据时 -->
          <!-- <li class="fly-none">消灭零回复</li> -->
        </ul>
          <div class="write-answer" class="layui-form layui-form-pane">
             <div class="write-answer-top">
               <img src="/images/community/write.svg" width="25px" height="25px">
               <div class="write-answer-top">&nbsp;&nbsp;&nbsp;&nbsp;写回答</div>
             </div>
             <!--富文本编辑器-->
             <form name="fuform" onsubmit="return false" action="/school/insertDirectionComment?directionId=${publishDirection.directionId}" method="post">
               <div class="text">
                 <div id="div1" class="toolbar" style="height: 35px"></div>
                 <div id="div2" style="height: 130px"></div>
                 <textarea id="text1" style="display: none" name="content"></textarea>
               </div>
               <div class="write-answer-bottom">
                 <div class="write-answer-bottom-content">
                   <button  type="submit" class="layui-btn layui-btn-fluid" id="comsub" width="50px">提交回答</button>
                 </div>
               </div>
             </form>
        </div>
      </div><!--zsml-result-->
        

      </div>
    </div>
    <div class="layui-col-md4">
        <div class="fly-panel">
            <img src="/images/school/rabit.png" width="70px" id="cute"/>
            <div class="count">共&nbsp;<span class="timer count-title" id="count-number" data-to="${viewCount}" data-speed="3000" style="color:darkorange"></span>&nbsp;次浏览</div>
            <div class="scollect"><a href="javascript:void(0);" onclick="addCollector(${publishDirection.directionId})">点此加入院校收藏夹！</a> </div>
        </div>
        <div class="fly-panel">
            <div class="fly-panel-main">
              <a href="/searchfile?school=${publishDirection.schoolName}&fileType=全部&keyWord=" target="_blank" class="fly-zanzhu" style="background-color: #393D49;">搜索 [${publishDirection.schoolName}] 考研资料</a>
            </div>
        </div>
      <dl class="fly-panel fly-list-one">
        <dt class="fly-panel-title">[${publishDirection.schoolName}]热门资料</dt>
        <c:forEach items="${top9file}" var="file">
        <dd>
          <a href="/file/${file.fileId}">${file.fileTitle}</a>
          <span><i class="iconfont icon-pinglun1"></i>${file.downloadNumber}</span>
        </dd>
        </c:forEach>
      </dl>
    </div>
  </div>
</div>
<%@include file="../common/footer.jsp"%>
<%--弹窗登录表单--%>
<%@include file="../common/login.jsp"%>

<script src="/layui/layui.js"></script>
<script src="http://www.jq22.com/jquery/jquery-1.10.2.js"></script>
<script src="/js/community/tag.js"></script>
<script>
layui.cache.page = 'jie';
layui.cache.user = {
  username: '游客'
  ,uid: -1
  ,avatar: '../../res/images/avatar/00.jpg'
  ,experience: 83
  ,sex: '男'
};
layui.config({
  version: "3.0.0"
  ,base: '../../res/mods/'
}).extend({
  fly: 'index'
}).use('fly');
</script>
</body>
<script type="text/javascript">
    var E = window.wangEditor
    var editor = new E('#div1', '#div2')
    editor.customConfig.uploadImgShowBase64 = true   // 使用 base64 保存图片
    editor.customConfig.uploadImgMaxSize = 3 * 1024 * 1024   //每张图片最大上传大小
    editor.customConfig.uploadImgMaxLength = 5              //每次最多上传5张
    var $text1 = $('#text1')
    editor.customConfig.onchange = function (html) {
        // 监控变化，同步更新到 textarea
        $text1.val(html)
    }
    //自定义菜单
    editor.customConfig.menus = [
        'head',  // 标题
        'bold',  // 粗体
        'fontSize',  // 字号
        'fontName',  // 字体
        'italic',  // 斜体
        'underline',  // 下划线
        'strikeThrough',  // 删除线
        'foreColor',  // 文字颜色
        'backColor',  // 背景颜色
        'link',  // 插入链接
        'list',  // 列表
        'quote',  // 引用
        'emoticon',  // 表情
        'image',  // 插入图片
        'table',  // 表格
        'code'  // 插入代码
    ]
    editor.create()
</script>

<script>
    /*弹窗登录功能*/
    var ask=document.getElementById("comsub");
    var mask=document.getElementsByClassName("mask")[0];
    var modalDialogcontent=document.getElementsByClassName("modalDialogcontent")[0];
    /*获取提交按钮*/
    var submit = document.getElementById("submitbutton");
    /*获取文本框*/
    var text = document.getElementById("text1");
    /*获取密码框*/
    password = document.getElementById('password');
    textpassword=document.getElementById("login_showPwd");

    /*点击评论提交判断是否是用户，不是用户则弹出框*/
    ask.onclick=function(){
        if(${user==null}){
            mask.style.display="block";
            modalDialogcontent.style.display="block";
        }else{
            //判断文本框是否为空
            var str = text.value.replace(/(^\s*)|(\s*$)/g, '');//去除空格;
            if(str == '' || str == undefined || str == null){
                //文本框为空
                javascript:$('body').dialog({type:'success'});
            }else{
                //满足条件，可以提交
                document.fuform.submit();
            }
        }
    };

    //判断用户名和密码
    submit.onclick=function(){
        $.ajax({
            //几个参数需要注意一下
            type: "POST",//方法类型
            dataType: "json",//预期服务器返回的数据类型
            url: "/popsupLogin" ,//url
            data: $('#loginform').serialize(),
            success: function (result) {
                console.log(result);//打印服务端返回的数据(调试用)
                if(result==true){
                    window.location.href="/school/schooldetail/${publishDirection.directionId}";
                }else{
                    /*document.getElementById("reply").innerHTML="通行证或密码错误";*/
                    textpassword.style.display="block";
                    password.style.display="none";
                    textpassword.parentNode.style.border = '1px solid red';
                    textpassword.style.color="red";
                    textpassword.value="密码错误";
                }
            },
            error : function() {
                /*document.getElementById("reply").innerHTML="网可能不太好，请您稍等一下~";*/
                console.log("网崩了！")
            }
        });
    };
    /*是否点赞*/
    function apraise(directionCommentId){
        if(${user==null}){
            mask.style.display="block";
            modalDialogcontent.style.display="block";
        }else{
            $.ajax({
                url:'/school/updateDCPraiseCount',//处理数据的地址
                type:'post',//数据提交形式
                data:{'directionCommentId':directionCommentId},//需要提交的数据
                dataType: "json",
                success:function(d){//数据返回成功的执行放大
                    var res = d.res;
                    var praiseCount = d.praiseCount;
                    if(res=='ok'){//成功
                        document.getElementById("directionComment"+directionCommentId).innerHTML=praiseCount;
                        document.getElementById("zan"+directionCommentId).style.color="#ff5722";
                    }
                    if(res=='no'){//失败
                        document.getElementById("directionComment"+directionCommentId).innerHTML=praiseCount;
                        document.getElementById("zan"+directionCommentId).style.color="#333";
                    }
                },
            });
        }
    }

</script>

<script>
  /*加入院校收藏夹*/
  function addCollector(directionId){
      if(${user==null}){
          mask.style.display="block";
          modalDialogcontent.style.display="block";
      }else{
          $.ajax({
              url:'/school/addDController',//处理数据的地址
              type:'post',//数据提交形式
              data:{'directionId':directionId},//需要提交的数据
              dataType: "json",
              success:function(d){//数据返回成功的执行放大
                  var res = d.res;
                  var praiseCount = d.praiseCount;
                  if(res=='ok'){//成功加入收藏夹
                      console.log("加入成功！")
                      javascript:$('body').colector({type:'success'});
                  }
                  if(res=='already'){//已经加入了
                      console.log("已经加了!")
                      javascript:$('body').alreadycolector({type:'success'});
                  }
              },
          });
      }
  }
</script>

<script charset="UTF-8" type="text/javascript"  src="/js/school/dialog.js"></script>
<script src="/js/common/login.js"></script>
<script src="/js/common/common.js"></script>
<script src="/js/school/index.js"></script>
</html>