package kr.or.studdit.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;
import java.util.ResourceBundle;

public class DBUtil {
	// static 초기화 블럭
	static Properties prop; // Properties 객체 변수 선언
	static ResourceBundle bundle = null;
	static {
		try {
			bundle = ResourceBundle.getBundle("kr.or.studdit.config.dbinfo");
			Class.forName(bundle.getString("driver"));
		} catch (Exception e) {
			System.out.println("driver loading failed...");
		}
	}

	// DB에 접속하고 접속이 성공하면 Connection객체를 반환하는 메서드
	public static Connection getConnection() {
		try {
			// return DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe",
			// "ddit", "java");
			return DriverManager.getConnection(bundle.getString("url"), bundle.getString("user"),
					bundle.getString("pass"));
		} catch (SQLException e) {
			System.out.println("DB Connection Failed...");
			return null;
		}
	}
}
