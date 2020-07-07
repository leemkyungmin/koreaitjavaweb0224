package com.koreait.projectE.db;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnect {

	// 필드
	private static String jdbcDriver = "oracle.jdbc.driver.OracleDriver";
	private static String url = "jdbc:oracle:thin:@127.0.0.1:1521:xe";
	private static String user = "JAVAWEB0224";
	private static String password = "1111";
	
	// 메소드
	public static Connection getConnection() throws Exception {
		Class.forName(jdbcDriver);
		return DriverManager.getConnection(url, user, password);
	}
	
}