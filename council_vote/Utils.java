// 파일 경로 : src/main/java/Utils.java
package DBPKG;

import java.sql.*;

public class Utils {
	public static Connection getConnection() throws Exception{
		Class.forName("oracle.jdbc.OracleDriver");
		Connection con = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe","system", "1234");
		return con;
	}
}
