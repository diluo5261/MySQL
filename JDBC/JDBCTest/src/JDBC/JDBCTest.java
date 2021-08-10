package JDBC;

import org.junit.Test;

import java.sql.*;

public class JDBCTest {
    @Test
    public void test1(){
        Connection conn = null;
        Statement stm = null;
        try {
            //1、注册驱动
            Driver driver = new com.mysql.cj.jdbc.Driver();
            DriverManager.registerDriver(driver);

            //2、获取连接
            String url = "jdbc:mysql://localhost:3306/test";
            String user = "root";
            String password = "root";
            conn = DriverManager.getConnection(url,user,password);


            //3、获取数据库操纵对象
            stm = conn.createStatement();

            //4、执行sql语句

            String sql = "insert into customers(name,email,birth) values('tom','tom@126.com','2020-05-21')";
            int count = stm.executeUpdate(sql);
            System.out.println(count);

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        } finally {
            //6、释放资源
            try {
                if (stm != null){
                    stm.close();
                }
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }

            try {
                if(conn != null){
                    conn.close();
                }
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
        }

        //5、处理查询结果集
    }

    @Test
    public void test2(){
        Connection conn = null;
        Statement stm = null;
        try {
            //1、注册驱动
            Class.forName("com.mysql.cj.jdbc.Driver");

            //2、获取连接
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/test","root","root");

            //3、获取数据库操作对象
            stm = conn.createStatement();

            //4、执行sql语句
            String sql = "delete from customers where name = 'tom'";
            int count = stm.executeUpdate(sql);
            System.out.println(count == 1 ? "删除成功":"删除失败");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        } finally {
            //6、释放资源
            try {
                if (stm != null){
                    stm.close();
                }
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }

            try {
                if(conn != null){
                    conn.close();
                }
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
        }
    }

    @Test
    public void test3(){


    }
}
