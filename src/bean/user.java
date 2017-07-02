package bean;
import bean.user_Info;

import javax.print.attribute.standard.PresentationDirection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;


/**
 * Created by shuaiyuhao on 2017/5/26.
 */
public class user {
    //添加用户
    public void saveUser(user_Info user_info){
        Connection conn = DB_Connect.getConnection();
        //插入用户注册信息的sql语句
        String sql = "insert into user(username,password) values(?,?)";
        try{
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1,user_info.getUserName());
            ps.setString(2,user_info.getPassword());
            ps.executeUpdate();
            ps.close();
        }
        catch (Exception e){
            e.printStackTrace();
        }
        finally {
            DB_Connect.closeConnection(conn);
        }
    }
    //用户登陆
    public user_Info login(String username,String password) {
        user_Info user_info = null;
        Connection conn = DB_Connect.getConnection();
        //根据用户名和密码查询用户信息
        String sql = "select * from user where username = ? and password = ?";
        try {
            // 获取PreparedStatement对象
            PreparedStatement ps = conn.prepareStatement(sql);
            // 对SQL语句的占位符参数进行动态赋值
            ps.setString(1, username);
            ps.setString(2, password);
            // 执行查询获取结果集
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                user_info = new user_Info();
                user_info.setUserName(rs.getString("username"));
                user_info.setPassword(rs.getString("password"));
                rs.close();
                ps.close();
            }
        } catch (Exception e) {
        e.printStackTrace();
        } finally {
            DB_Connect.closeConnection(conn);
        }
        return user_info;
    }
    //判断用户是否存在
    public boolean userIsExist(String username){
        Connection conn = DB_Connect.getConnection();
        //根据指定用户名查询用户信息
        String sql ="select * from user where username = ?";
        try{
            // 获取PreparedStatement对象
            PreparedStatement ps = conn.prepareStatement(sql);
            // 对用户对象属性赋值
            ps.setString(1, username);
            // 执行查询获取结果集
            ResultSet rs = ps.executeQuery();
            // 判断结果集是否有效
            if(!rs.next()){
                // 如果无效则证明此用户名可用
                return true;
            }
            // 释放此 ResultSet 对象的数据库和 JDBC 资源
            rs.close();
            // 释放此 PreparedStatement 对象的数据库和 JDBC 资源
            ps.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }finally{
            // 关闭数据库连接
            DB_Connect.closeConnection(conn);
        }
        return false;
    }
    //删除用户
    public void deleteUser(user_Info user_info){
        Connection conn = DB_Connect.getConnection();
        String sql = "delete from user where username = ?";
        try{
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1,user_info.getUserName());
            ps.executeLargeUpdate();
            ps.close();
        }
        catch (Exception e){
            e.printStackTrace();
        }
    }
    //更新密码
    public void updatePassword(user_Info user_info){
        Connection conn = DB_Connect.getConnection();
        String sql = "update user set password = ? WHERE username = ?";
        try{
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(2,user_info.getUserName());
            ps.setString(1,user_info.getPassword());
            ps.executeLargeUpdate();
            ps.close();
        }
        catch (Exception e){
            e.printStackTrace();
        }
    }
    //查询密码
    public void selectPassword(user_Info user_info){
        Connection conn = DB_Connect.getConnection();
        String sql = "select password from user where username = ?";
        try{
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1,user_info.getUserName());
            ResultSet rs = ps.executeQuery();
            rs.getString(1);
            ps.close();
        }
        catch (SQLException e){
            e.printStackTrace();
        }
    }
}

