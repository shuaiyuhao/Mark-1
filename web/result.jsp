<%--
  Created by IntelliJ IDEA.
  User: shuaiyuhao
  Date: 2017/5/26
  Time: 上午1:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="bean.user_Info" %>
<%@ page import="bean.user" %>
<%@ page import="java.sql.*" %>
<html>
<head>
    <title>信息</title>
    <link rel="stylesheet" type="text/css" href="result.css">
    <link rel="stylesheet" type="text/css" href="module.css">
    <script src="jquery/jquery-3.1.1.js"></script>
    <script src="jquery/jquery.slider.js"></script>
    <style>
        * { padding: 0; margin: 0; }
        #box { margin: 50px auto; height: 40px; background: #ccc; }
        #box ul { position: relative; margin: 0 auto; width: 960px; }
        #box li { float: left; margin-right: 0px; width: 100px; height: 40px;}
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
    $(function() {

        $('div.caption img').click(function(){
            $(this).closest('div.module').find('div.body')
                .toggle('slow',function(){
                    $(this).closest('div.module')
                        .toggleClass('rolledup',$(this).is(':hidden'));
                });
        });

    });

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
    <div class="wrap">
    <%
        // 获取提示信息
        String info = (String)request.getAttribute("info");
        // 如果提示信息不为空，则输出提示信息
        if(info != null){
            out.println(info);
        }
        // 获取登录的用户信息
        user_Info user_info= (user_Info)session.getAttribute("user_Info");
        // 判断用户是否登录
        if(user_info != null){
    %>
    <table align="center" width="250" border="1" height="150" bordercolor="#E8F4CC">
        <tr>
            <td align="center" colspan="2">
                <span style="font-weight: bold;font-size: 18px;"><%=user_info.getUserName() %></span>
                登录成功！
            </td>
        </tr>

    </table>
    <%
        }else{
            out.println("<br>对不起，您还没有登录！");
        }
    %>
    <div class="module">
        <div class="caption">
            <span>查看数据库</span>
            <img src="image/rollup.gif" alt="rollup" title="rolls up this module">
        </div>
        <div class="body" style="display: block">
            <% Connection con;
            Statement sql;
            ResultSet rs = null;
            try{
                Class.forName("com.mysql.jdbc.Driver");
            }
            catch (Exception e){
                out.println("忘记吧。。。。");
            }
            try{
                String uri ="jdbc:mysql://127.0.0.1:3306/exam";
                String user ="root";
                String password="123456";
                con= DriverManager.getConnection(uri,user,password);
                sql = con.createStatement();
                rs = sql.executeQuery("SELECT * FROM user");
                out.print("<table border = 2>");
                out.print("<tr>");
                out.print("<th>" + "name");
                out.print("<th>" + "password");
                out.print("</tr>");
                while (rs.next()){
                    out.print("<tr>");
                    out.print("<td>" +rs.getString("username") + "</td>");
                    out.print("<td>" + rs.getString("password") + "</td>");
                }
                out.print("</table>");
                con.close();
            }
            catch (SQLException e){
                out.print(e);
            }

            %>
        </div>
    </div>
    </div>
    <div class="wrap">
        <form action="/insertServlet" method="post">
            添加新纪录：
            <table border="1">
                <tr><td>用户名：</td><td><input type="text" name="username"> </td></tr>
                <tr><td>密码：</td><td><input type="text" name="password"> </td></tr>

            </table>
            <br><input type="submit" name="submit" value="提交">
        </form>
        <form action="/deleteServlet" method="post">
            删除纪录：
            <table border="1">
                <tr><td>用户名：</td><td><input type="text" name="username"> </td></tr>
            </table>
            <br><input type="submit" name="submit" value="提交">
        </form>
        <form action="/updateServlet" method="post">
            更新纪录：
            <table border="1">
                <tr><td>用户名：</td><td><input type="text" name="username"> </td></tr>
                <tr><td>更新的密码：</td><td><input type="text" name="password"> </td></tr>
            </table>
            <br><input type="submit" name="submit" value="提交">
        </form>
        <form action="select_Result.jsp" method="post">
            查询纪录：
            <table border="1">
                <tr><td>用户名：</td><td><input type="text" name="username"> </td></tr>
            </table>
            <br><input type="submit" name="submit" value="查询">
        </form>
    </div>
</div>
</body>
</html>
