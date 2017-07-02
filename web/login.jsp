<%--
  Created by IntelliJ IDEA.
  User: shuaiyuhao
  Date: 2017/5/15
  Time: 下午12:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <title>login</title>
    <link rel="stylesheet" type="text/css" href="login.css">
    <script src="jquery/jquery-3.1.1.js"></script>

    <script type="text/javascript">
        function Check() {
            var username = $("#username").val();
            var password = $("#password").val();
            if(username === ""){
                window.alert("用户名不能为空");
            }
            if(password === ""){
                window.alert("密码不能为空")
            }

        }
    </script>
</head>
<body>
<div id="login">
    <h1>Login</h1>
    <form  action="LoginServlet" method="post" onsubmit="return Check(this)">
        <input type="text" placeholder="用户名" name="username" id="username">
        <input type="text" placeholder="密码" name="password" id="password">
        <button class="but" type="submit">登录</button>
        <br>
        <button class="but" type="button" onclick="window.open('register.jsp')">注册</button>
    </form>
</div>
</body>
</html>

