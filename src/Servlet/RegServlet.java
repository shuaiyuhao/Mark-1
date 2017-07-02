package Servlet;
import bean.user;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import bean.user_Info;
/**
 * Created by shuaiyuhao on 2017/5/26.
 */
@WebServlet(name = "RegServlet")
public class RegServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        user user = new user();
        if(username != null && !username.isEmpty()){
            if(user.userIsExist(username)){
                user_Info user_info = new user_Info();
                user_info.setUserName(username);
                user_info.setPassword(password);
                user.saveUser(user_info);
                request.setAttribute("info","注册成功");
            }
            else {
                request.setAttribute("info","该用户名已存在");
            }
        }
        request.getRequestDispatcher("wrong.jsp").forward(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request,response);
    }
}
