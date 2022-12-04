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
		System.out.print("검색하고 싶은 세계관의 이름을 입력하세요 : ");
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
		//쿼리 시작
		try {
			// Q1: Complete your query.
			String sql = "SELECT S.UNI_NAME, U.LORE, COUNT(S.Skin_name)\r\n"
					+ "FROM SKIN_UNIVERSE U, SKIN S\r\n"
					+ "WHERE U.NAME=?\r\n"
					+ "AND S.UNI_NAME= U.Name\r\n"
					+ "GROUP BY S.UNI_NAME, U.LORE";
			/*
			 String sql = "SELECT NAME, Lore \r\n"
					+ "FROM SKIN_UNIVERSE\r\n"
					+ "WHERE NAME=?";
			 * */
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, name);
			rs = ps.executeQuery();
			System.out.println("<< query 1 result >>");
			System.out.println("UNIVERSE_NAME | LORE | SKIN_COUNT");
			System.out.println("------------------------------");
			while(rs.next()) {
				// Fill out your code
				String NAME = rs.getString(1);
				String Lore = rs.getString(2);
				String Count = rs.getString(3);
				System.out.println(NAME + " | " + Lore +" | "+Count);
			}
			rs.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
}
