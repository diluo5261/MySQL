package com.dilo.JDBCTemplate;

import com.alibaba.druid.pool.DruidDataSourceFactory;
import org.springframework.jdbc.core.JdbcTemplate;

import javax.sql.DataSource;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.Connection;
import java.util.Properties;

public class JDBCTemplateTest {
    public static void main(String[] args) throws Exception {
        // JDBCTemplate是由Spring简单的封装的JDBC
        //1.导入jar包
        //2. 创建JDBCTemplate对象
//        JdbcTemplate jdbcTemplate = new JdbcTemplate(DruidDataSourceFactory.createDataSource(new Properties().load(new FileInputStream("druid.properties"))));
        Properties properties = new Properties();
        properties.load(new FileInputStream("src/druid.properties"));

        DataSource dataSource = DruidDataSourceFactory.createDataSource(properties);
/*        Connection conn  =dataSource.getConnection();
        System.out.println(conn);*/
        JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);

        //3. 执行sql语句
        String sql = "update user set name = '哆啦A梦' where id = ?";
        int count = jdbcTemplate.update(sql,8);
        System.out.println("成功执行"+ count+"条语句");
    }
}
