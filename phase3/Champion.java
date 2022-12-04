package projectDB;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Scanner;

public class Champion extends Start {
	
	Champion()
	{
		
	}

	void champ_Search()
	{
		ResultSet rs = null;
		Scanner sc = new Scanner(System.in);

		String name;
		System.out.print("검색하고 싶은 챔피언의 이름을 입력하세요 : ");
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
		
		try {
			// Q1: Complete your query.
			String sql = "SELECT NAME, TITLE, CLASS \r\n"
					+ "FROM CHAMPION\r\n"
					+ "WHERE NAME = ?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, name);
			rs = ps.executeQuery();
			
			System.out.println("CHAMP_NAME | TITLE | CLASS");
			System.out.println("------------------------------");
			while(rs.next()) {
				// Fill out your code
				String champ_name = rs.getString(1);
				String title = rs.getString(2);
				String Class = rs.getString(3);
				System.out.println(champ_name + " | " + title + " |" + Class);
			}
			rs.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
}
