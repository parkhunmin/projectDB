package user;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Connection;
import java.sql.DriverManager;

public class userDAO {

	private Connection conn = null;
	ResultSet rs;
	PreparedStatement ps;
	
	public userDAO() {
		try {
			String serverIP = "localhost";
			String strSID = "orcl";
			String portNum = "1521";
			String user = "lol";
			String pass = "lol";
			String url = "jdbc:oracle:thin:@"+serverIP+":"+portNum+":"+strSID;
	
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection(url,user,pass);
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public int login(String Id, String Password) {
		String sql = "SELECT Password \r\n"
				+ "FROM USERS\r\n"
				+ "WHERE Id = ?";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, Id);
			rs = ps.executeQuery();
			
			if (rs.next()) {
				if(rs.getString(1).equals(Password))
					return 1; // �α��� ����
				else
					return 0; // ��й�ȣ ����ġ
			}
			return -1; // ���̵� ����
		} catch(Exception e) {
			e.printStackTrace();
		}
		return -2;
	}
	
	public int join(User user) {
		String sql = "INSERT INTO USERS VALUES(?, ?, ?, ?)";
		try {
			ps = conn.prepareStatement(sql);

			ps.setString(1, user.getId());
			ps.setString(2, user.getPassword());
			ps.setString(3, user.getName());
			ps.setString(4, user.getEmail());
			
			return ps.executeUpdate();
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return -1; // �����ͺ��̽� ����
	}

}
