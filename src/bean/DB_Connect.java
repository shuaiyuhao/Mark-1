package bean;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 * Created by shuaiyuhao on 2017/5/25.
 */
public class DB_Connect {
      public static Connection getConnection() {
          Connection conn = null;
          String driver = "com.mysql.jdbc.Driver";
          try {
              Class.forName(driver);
              String url = "jdbc:mysql://127.0.0.1:3306/exam?charaterEncoding=utf-8&useSSL=true";
              conn = DriverManager.getConnection(url,"root","123456");
          } catch (Exception e) {
              e.printStackTrace();
          }
          return conn;
      }
    public static void closeConnection(Connection conn){
        // 判断conn是否为空
        if(conn != null){
            try {
                conn.close();	// 关闭数据库连接
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

}

