package Servlet;

import bean.user_Info;
import bean.user;
import java.io.IOException;
import java.util.ArrayList;
/**
 * Created by shuaiyuhao on 2017/5/26.
 */
public class LoginServlet extends javax.servlet.http.HttpServlet {
    protected void doPost(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {
        //获取用户名
        String username =request.getParameter("username");
        //获取密码
        String password =request.getParameter("password");
        user user = new user();
        user_Info user_info = user.login(username,password);
        //判断user_Info是否为空
        if(user_info != null){

            request.getSession().setAttribute("user_Info",user_info);
            request.getRequestDispatcher("result.jsp").forward(request,response);
        }
        else {
            //登陆失败
            request.setAttribute("info","用户名或密码错误");
            request.getRequestDispatcher("wrong.jsp").forward(request,response);
        }
    }

    protected void doGet(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {
        this.doPost(request,response);
    }
}
