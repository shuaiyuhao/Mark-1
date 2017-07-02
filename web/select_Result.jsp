<%@ page import="java.sql.*" %><%--
  Created by IntelliJ IDEA.
  User: shuaiyuhao
  Date: 2017/6/1
  Time: 上午8:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>查询结果</title>
</head>
<body>
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
        String na = request.getParameter("username");
        rs = sql.executeQuery("SELECT * FROM user WHERE username ='"+na+"' ");
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
</body>
</html>
