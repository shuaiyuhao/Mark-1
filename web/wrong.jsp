<%@ page import="bean.user" %><%--
  Created by IntelliJ IDEA.
  User: shuaiyuhao
  Date: 2017/5/26
  Time: 下午6:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>错误</title>
    <link rel="stylesheet" type="text/css" href="result.css">
</head>
<body>
<div class="nav">
    <ul>
        <li><a href="login.jsp">登录</a> </li>
        <li><a href="register.jsp">注册</a> </li>
        <li><a href="result.jsp">查看信息</a> </li>
        <li><a href="upload.jsp">上传文件</a> </li>
    </ul>
</div>
<div id="content">
    <table align="center" width="350" border="1" height="200" bordercolor="#E8F4CC">
    <tr>
        <td align="center" colspan="2" rowspan="2">
            <%
                // 获取提示信息
                String info = (String)request.getAttribute("info");
                // 如果提示信息不为空，则输出提示信息
                if(info != null){
                    out.println(info);
                }
            %>
        </td>
    </tr>
    <tr></tr>
    <tr>
        <td align="center"><a href="login.jsp">返回登录</a> </td>
        <td align="center"><a href="register.jsp">注册账户</a> </td>
    </tr>

</table>
</div>
</body>
</html>
