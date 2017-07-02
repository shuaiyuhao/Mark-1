<%--
  Created by IntelliJ IDEA.
  User: shuaiyuhao
  Date: 2017/5/25
  Time: 下午9:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>注册</title>
    <link rel="stylesheet" type="text/css" href="login.css">
    <script src="jquery/jquery-3.1.1.js"></script>
    <script type="text/javascript">
        function Check() {
            var password = document.getElementById("password").value;
            var repassword = document.getElementById("repassword").value;
            if(password != repassword){
                window.alert("密码不一致！");
                return false;
            }
            return true;
        }
    </script>
</head>
<body>
<div id="login">
    <h1>Create Account</h1>
    <form action="RegServlet" method="post" onsubmit="return Check(this)">
        <input type="text" placeholder="用户名" name="username" >
        <input type="text" placeholder="密码" name="password" id="password">
        <input type="text" placeholder="确认密码" name="repassword" id="repassword">
        <button type="submit" class="but" >提交</button>
        <br>
        <button class="but" type="button" onclick="window.open('login.jsp')">返回登录页</button>

    </form>
</div>
</body>
</html>
