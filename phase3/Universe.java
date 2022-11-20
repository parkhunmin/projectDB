package projectDB;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Scanner;

public class Universe extends Start {
	
	Universe()
	{
		
	}
	
	void uni_Search()
	{
		ResultSet rs = null;
		Scanner sc = new Scanner(System.in);

		String name;
		System.out.println("검색하고 싶은 세계관의 이름을 입력하세요.");
		name = sc.next();
		
		try {
			conn.setAutoCommit(false); // auto-commit disabled  
			// Create a statement object
			stmt = conn.createStatement();
			// Let's execute an SQL statement.
		}catch(SQLException ex2) {
			System.err.println("sql error = " + ex2.getMessage());
			System.exit(1);
		}
		
	}
}
