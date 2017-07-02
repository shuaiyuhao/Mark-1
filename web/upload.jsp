<%--
  Created by IntelliJ IDEA.
  User: shuaiyuhao
  Date: 2017/5/27
  Time: 上午10:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>上传文件</title>
    <link rel="stylesheet" type="text/css" href="result.css">
    <script src="jquery/jquery-3.1.1.js"></script>
    <script src="jquery/jquery.slider.js"></script>
    <style>
        * { padding: 0; margin: 0; }
        #box { margin: 50px auto; height: 40px; background: #ccc; }
        #box ul { position: relative; margin: 0 auto; width: 960px; }
        #box li { float: left; margin-right: 0px; width: 100px; height: 40px; }
        li { list-style: none; }
        a { font-style: normal; position: relative; color: #efefef; text-align: center; line-height: 40px; text-decoration: none; display: block; z-index: 200 }
        #bgli { position: absolute; background: red; border-radius: 10px; width: 70px; height: 40px; z-index: 100 }
    </style>
</head>
<script>
    $(function(){
        var $li = $("#box>ul li");
        $li.slider($li)
    })
</script>
<body>
<div id="box">
    <ul>
        <li><a href="login.jsp">登录</a> </li>
        <li><a href="register.jsp">注册</a> </li>
        <li><a href="result.jsp">查看信息</a> </li>
        <li><a href="upload.jsp">上传文件</a> </li>
    </ul>
</div>
<div id="content">
    <form action="/uploadServlet" method="post" ENCTYPE="multipart/form-data">
        <input type="file" name="filename" size="40">
        <br>
        <input type="submit" name="g" value="提交">
    </form>
</div>

</body>
</html>
