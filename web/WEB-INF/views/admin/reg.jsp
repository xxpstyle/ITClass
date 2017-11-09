<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/10/20
  Time: 20:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <title>Layui</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="<%=path%>/layui/plugins/layui/css/layui.css" media="all"/>
</head>

<body>
<div style="margin: 15px;">

    <fieldset class="layui-elem-field layui-field-title" style="margin-top: 50px;">
        <legend>简洁风格的Tab</legend>
    </fieldset>

    <div class="layui-tab layui-tab-brief" lay-filter="docDemoTabBrief">
        <ul class="layui-tab-title">
            <li><a href="/admin/login">登录</a></li>
            <li class="layui-this">注册</li>
        </ul>
        <div class="layui-tab-content">
            <div class="layui-tab-item layui-show">
                <div class="layui-tab-item layui-show">
                    <div class="layui-form layui-form-pane">
                        <form method="post">
                            <div class="layui-form-item">
                                <label class="layui-form-label">用户名</label>
                                <div class="layui-input-inline">
                                    <input type="text" name="name" placeholder="请输入用户名" lay-verify="required|fname"
                                           autocomplete="off" class="layui-input">
                                </div>
                            </div>
                            <div class="layui-form-item">
                                <label class="layui-form-label">邮箱</label>
                                <div class="layui-input-inline">
                                    <input type="text" id="mail" name="mail" placeholder="请输入邮箱" lay-verify="required|mail"
                                           autocomplete="off" class="layui-input">
                                </div>
                            </div>
                            <div class="layui-form-item">
                                <div class="layui-input-inline">
                                    <input type="text" name="name" placeholder="请输入验证码" lay-verify="required" autocomplete="off" class="layui-input">
                                </div>
                                <input type="button" class="layui-btn" id="btn" value="获取验证码" onclick="settime(this)" />
                            </div>
                            <div class="layui-form-item">
                                <label class="layui-form-label">密码</label>
                                <div class="layui-input-inline">
                                    <input type="password" name="password" placeholder="请输入密码" lay-verify="required|contact"
                                           autocomplete="off" class="layui-input">
                                </div>
                            </div>
                            <div class="layui-form-item">
                                <label class="layui-form-label">确认密码</label>
                                <div class="layui-input-inline">
                                    <input type="password" placeholder="请输入确认密码" lay-verify="required|twopass" autocomplete="off"
                                           class="layui-input">
                                </div>
                            </div>
                            <div class="layui-form-item">
                                <label class="layui-form-label">性别</label>
                                <div class="layui-input-block">
                                    <input type="radio" name="sex" value="1" title="男" checked>
                                    <input type="radio" name="sex" value="0" title="女">
                                </div>
                            </div>
                            <div class="layui-form-item">
                                <button class="layui-btn" lay-filter="*" lay-submit="">立即登录</button>
                                <span style="padding-left:20px;"> <a href="/user/forget">忘记密码？</a> </span>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

</div>
<script type="text/javascript" src="<%=path%>/layui/plugins/layui/layui.js"></script>
<script type="text/javascript" src="<%=path%>/layui/js/tab.js"></script>
<script type="text/javascript" src="<%=path%>/plugins/jquery-1.11.3.min.js"></script>
<script>
    var countdown = 60;
    function settime(obj) {
        var filter  = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
        if (filter.test(mail)) return true;
        else {
            alert('您的电子邮件格式不正确');
            return false;}
        if (countdown == 0) {
            obj.removeAttribute("disabled");
            obj.value = "获取验证码";
            countdown = 60;
            return;
        } else {
            obj.setAttribute("disabled", true);
            obj.value = "重新发送(" + countdown + ")";
            countdown--;
        }
        setTimeout(function () {
                settime(obj)
            }
            , 1000)
    }

</script>
<script>
    layui.use(['form', 'layedit', 'laydate'], function () {
        var form = layui.form()
            , layer = layui.layer
            , layedit = layui.layedit
            , laydate = layui.laydate;

        //自定义验证规则
        var pwd = "";
        form.verify({
            fname: function (value) {
                if (value.length < 4) {
                    return '请输入至少4位的用户名';
                }
            }, contact: function (value) {
                if (value.length < 6) {
                    return '密码至少输入6位字符';
                }
                pwd = value;
            }, twopass: function (value) {

                if (value != pwd) {
                    return "两次输入密码不一致，请重新输入！";
                }
            }
            , phone: [/^1[3|4|5|7|8]\d{9}$/, '手机必须11位，只能是数字！']
            , email: [/^[a-z0-9._%-]+@([a-z0-9-]+\.)+[a-z]{2,4}$|^1[3|4|5|7|8]\d{9}$/, '邮箱格式不对']
        });

        //创建一个编辑器
        layedit.build('LAY_demo_editor');

        //监听提交
        form.on('submit(demo1)', function (data) {
            layer.alert(JSON.stringify(data.field), {
                title: '最终的提交信息'
            })
            return false;
        });


    });
</script>

</body>

</html>