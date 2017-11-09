<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/11/6
  Time: 11:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>登录</title>

    <link href="<%=path%>/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="<%=path%>/bootstrap/css/ui2.css" rel="stylesheet">
    <style>
        .clearfix:after {
            content: "\20";
            display: block;
            height: 0;
            clear: both;
            visibility: hidden
        }

        .clearfix {
            zoom: 1
        }

        .tabBar {

        }

        .tabBar span {
            cursor: pointer;
            display: inline-block;
            float: left;
            font-weight: bold;
            font-size: 18px;
            height: 30px;
            line-height: 20px;
            padding: 0 15px;
            text-align: center;
            width:50%;
        }

        .tabBar span.current {
            border-bottom: 2px solid #222;
        }

        .tabCon {
            display: none
        }
        a:link {
            color: #000000;
            text-decoration: none;
        }
        a:visited {
            color: #000000;
            text-decoration: none;
        }
        a:hover {
            color: #000000;
            text-decoration: none;
        }
    </style>
</head>
<body style="background-color: #eee;">
<div style="margin: 50px;">
    <div id="tab_demo" class="HuiTab col-md-4">
        <div class="tabBar clearfix">
            <span class="current"><a href="/admin/login">登录</a></span>
            <span><a href="/admin/reg">注册</a></span>
        </div>
        <br/>
        <form class="login-form clearfix" method="post" action="/admin/tologin">
            <div class="form-arrow"></div>
            <input name="mail" type="text" placeholder="邮箱："/>
            <input name="password" type="password" placeholder="密码："/>
            <input type="submit" name="type" class="button-blue login" value="登录"/>
            <input type="hidden" name="return-url" value="">
            <div class="clearfix"></div>
            <label class="remember">
                <input name="remember" type="checkbox" checked/>
                下次自动登录 </label>
            <a class="forgot">忘记密码？</a>

        </form>
    </div>
    <br/>
    <button type="button" class="btn btn-default" data-container="body" data-toggle="popover" data-placement="right" data-content="Vivamus sagittis lacus vel augue laoreet rutrum faucibus.">
        Popover on 左侧
    </button>
</div>
<script src="<%=path%>/bootstrap/js/jquery.min.js"></script>
<script src="<%=path%>/bootstrap/js/bootstrap.min.js"></script>
<script>
    $(function () {
        $.Huitab("#tab_demo .tabBar span", "#tab_demo .tabCon", "current", "click", "0")
    });
    $(function () {
        $('[data-toggle="popover"]').popover()
    })
</script>
<script src="<%=path%>/bootstrap/js/H-ui-tab.js"></script>

</body>
</html>