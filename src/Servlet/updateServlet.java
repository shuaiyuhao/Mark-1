package Servlet;

import bean.user;
import bean.user_Info;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by shuaiyuhao on 2017/5/31.
 */
@WebServlet(name = "updateServlet")
public class updateServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        user user = new user();
        if(username != null && !username.isEmpty()){
            if(user.userIsExist(username)){
                request.setAttribute("info","该用户名不存在");
            }
            else {
                user_Info user_info = new user_Info();
                user_info.setUserName(username);
                user_info.setPassword(password);
                user.updatePassword(user_info);
                request.setAttribute("info","更新成功");
            }
        }
        request.getRequestDispatcher("result.jsp").forward(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request,response);
    }
}
