package projectDB;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Scanner;


public class Skin extends Start  {
	String _name;
	int _price;
	String _launch_date;
	boolean _chroma;
	float _Rating;
	String _Kind;
	String _champ_name;
	String _Uni_name;
	
	void skin_search()
	{
		System.out.println("알고 싶은 내용을 선택하세요!");
		System.out.println("1) 스킨정보 2) 스킨 출시일 3) 챔피언별 스킨 4) 스킨 평점 5) 스킨별 댓글 6) 스킨 변경점 7) 등급과 크로마");
		System.out.print(">");
		int num;
		Scanner sc = new Scanner(System.in);
		
		num = sc.nextInt();
		
		switch(num)
		{
		case 1: {
			skin_info();
			break;
			}
		case 2: {
			skin_released_date();
			break;
			}
		case 3: {
			skin_by_champion();
			break;
		}
		case 4: {
			skin_score();
			break;
		}
		case 5: {
			skin_comment();
			break;
		}
		case 6: {
			skin_changeInfo();
			break;
		}
		case 7: {
			skin_level();
			break;
		}
		
		}
	}
	
	void skin_info() //1번
	{
		ResultSet rs = null;
		Scanner sc = new Scanner(System.in);

		String name;
		System.out.print("알고 싶은 스킨의 이름을 입력하세요 : ");
		name = sc.nextLine();
		
		try {
			// Q1: Complete your query.
			String sql = "SELECT SKIN_NAME, PRICE, LAUNCH_DATE, KIND \r\n"
					+ "FROM SKIN\r\n"
					+ "WHERE SKIN_NAME = ?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, name);
			rs = ps.executeQuery();
			
			System.out.println("SKIN_NAME | PRICE | LAUNCH_DATE | KIND");
			System.out.println("------------------------------");
			while(rs.next()) {
				// Fill out your code
				String skin_name = rs.getString(1);
				int price = rs.getInt(2);
				String launch_date = rs.getString(3);
				String kind = rs.getString(4);
				System.out.println(skin_name + " | " + price + " |" + launch_date + " |" + kind);
			}
			rs.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	void skin_released_date()//2
	{
		ResultSet rs = null;
		Scanner sc = new Scanner(System.in);

		String date;//말이 좀 이상해서 바꿔야할듯...
		System.out.print("특정 날짜 이후로 출시된 스킨을 검색합니다. 날짜를 YYYYMMDD 형식으로 입력하세요 : ");
		date = sc.nextLine();
		
		try {
			// Q1: Complete your query.
			String sql = "SELECT SKIN_NAME, PRICE, LAUNCH_DATE, KIND \r\n"
					+ "FROM SKIN\r\n"
					+ "WHERE ? <TO_CHAR(launch_date, 'YYYYMMDD')";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, date);
			rs = ps.executeQuery();
			System.out.println("<< query 1 result >>");
			System.out.println("SKIN_NAME | PRICE | LAUNCH_DATE | KIND");
			System.out.println("------------------------------");
			while(rs.next()) {
				// Fill out your code
				String skin_name = rs.getString(1);
				int price = rs.getInt(2);
				String launch_date = rs.getString(3);//출력방식 수정해야할듯
				String kind = rs.getString(4);
				System.out.println(skin_name + " | " + price + " |" + launch_date + " |" + kind);
			}
			rs.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	void skin_by_champion()//3 챔피언별 스킨
	{
		ResultSet rs = null;
		Scanner sc = new Scanner(System.in);

		String name;
		System.out.print("스킨 목록을 알고싶은 챔피언을 입력하세요 : ");
		name = sc.nextLine();
		
		try {//타입3 쿼리라 멀티조인으로 구성해야함
			// Q1: Complete your query.
			String sql = "SELECT C.NAME, SKIN_NAME, PRICE, LAUNCH_DATE, KIND \r\n"
					+ "FROM SKIN S, CHAMPION C\r\n"
					+ "WHERE C.NAME = ? "
					+ "AND C.NAME=S.CHAMP_NAME";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, name);
			rs = ps.executeQuery();
			System.out.println("<< query 1 result >>");
			System.out.println("CHAMP_NAME | SKIN_NAME | PRICE | LAUNCH_DATE | KIND");
			System.out.println("------------------------------");
			while(rs.next()) {
				// Fill out your code
				String champ_name=rs.getString(1);
				String skin_name = rs.getString(2);
				int price = rs.getInt(3);
				String launch_date = rs.getString(4);
				String kind = rs.getString(5);
				System.out.println(champ_name+"|"+skin_name + " | " + price + " |" + launch_date + " |" + kind);
			}
			rs.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	void skin_score()//4. 스킨평점
	{
		ResultSet rs = null;
		Scanner sc = new Scanner(System.in);

		String name;
		System.out.print("스킨 평점을 알고싶은 챔피언을 입력하세요 : ");
		name = sc.nextLine();
		
		int number;
		System.out.print("알고 싶은 내용을 선택하세요 : ");
		System.out.print("1) 모든 스킨의 평균 평점 2) 유저의 스킨 평점 목록  ");
		number = sc.nextInt();
		
		if (number==1) {
			try {//타입3 쿼리라 멀티조인으로 구성해야함. 아니면 아예 스킨 평점 띄워주게 새로 쿼리 짜는게?
				// Q1: Complete your query.
				String sql = "SELECT S.CHAMP_NAME, R.Skin_name, AVG(Score) \r\n"
						+ "FROM SKIN S ,RATING R\r\n"
						+ "WHERE S.CHAMP_NAME=? \r\n"
						+ "AND S.Skin_name= R.Skin_name\r\n"
						+ "GROUP BY R.Skin_name, S.CHAMP_NAME\r\n"
						+ "ORDER BY AVG(Score) DESC";
				PreparedStatement ps = conn.prepareStatement(sql);
				ps.setString(1, name);
				rs = ps.executeQuery();
				System.out.println("<< query 1 result >>");
				System.out.println("CHAMP_NAME | SKIN_NAME | SCORE");
				System.out.println("------------------------------");
				while(rs.next()) {
					// Fill out your code
					String champ_name = rs.getString(1);
					String skin_name = rs.getString(2);
					int score = rs.getInt(3);
					System.out.println(champ_name + " | " + skin_name + " |" + score);
				}
				rs.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		else if(number==2) {
			try {//타입3 쿼리라 멀티조인으로 구성해야함. 아니면 아예 스킨 평점 띄워주게 새로 쿼리 짜는게?
				// Q1: Complete your query.
				String sql = "SELECT S.CHAMP_NAME, S.SKIN_NAME, R.SCORE \r\n"
						+ "FROM SKIN S, RATING R \r\n"
						+ "WHERE S.CHAMP_NAME  = ? "
						+ "AND S.SKIN_NAME=R.SKIN_NAME";
				PreparedStatement ps = conn.prepareStatement(sql);
				ps.setString(1, name);
				rs = ps.executeQuery();
				System.out.println("<< query 1 result >>");
				System.out.println("CHAMP_NAME | SKIN_NAME | SCORE");
				System.out.println("------------------------------");
				while(rs.next()) {
					// Fill out your code
					String champ_name = rs.getString(1);
					String skin_name = rs.getString(2);
					int score = rs.getInt(3);
					System.out.println(champ_name + " | " + skin_name + " |" + score);
				}
				rs.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
	}
	
	void skin_comment() // 5번
	{
		ResultSet rs = null;
		Scanner sc = new Scanner(System.in);

		String name;
		System.out.print("알고 싶은 스킨의 이름을 입력하세요 : ");
		name = sc.nextLine();
		
		try {
			// Q1: Complete your query.
			String sql = "SELECT c.skin_name, U.Name, c.content \r\n"
					+ "FROM USERS U, comments c\r\n"
					+ "WHERE EXISTS (SELECT U.Name FROM USERS U, RATING R WHERE R.ID=U.ID)\r\n"
					+ "and c.skin_name = ?\r\n"
					+ "and U.ID = c.ID\r\n";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, name);
			rs = ps.executeQuery();
			
			System.out.println("SKIN_NAME | USER_NAME | COMMENT");
			System.out.println("------------------------------");
			while(rs.next()) {
				// Fill out your code
				String skin_name = rs.getString(1);
				String user_name = rs.getString(2);
				String comment = rs.getString(3);
				System.out.println(skin_name + " | " + user_name + " |" + comment);
			}
			rs.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	void skin_changeInfo() //6번
	{
		ResultSet rs = null;
		Scanner sc = new Scanner(System.in);

		String name;
		System.out.print("알고 싶은 스킨의 이름을 입력하세요 : ");
		name = sc.nextLine();
		
		try {
			// Q1: Complete your query.
			String sql = "SELECT S.skin_name, SK.effects, SK.animations, S.chroma\r\n"
					+ "FROM SKIN S, SKIN_CHANGES SK\r\n"
					+ "WHERE S.SKIN_NAME=SK.SKIN_NAME\r\n"
					+ "AND S.SKIN_NAME = ?\r\n"
					+ "ORDER BY S.SKIN_NAME";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, name);
			rs = ps.executeQuery();
			
			System.out.println("SKIN_NAME | EFFECTS | ANIMATIONS | CHROMA");
			System.out.println("------------------------------");
			while(rs.next()) {
				// Fill out your code
				String skin_name = rs.getString(1);
				String effects = rs.getString(2);
				String animations = rs.getString(3);
				String chroma = rs.getString(4);
				System.out.println(skin_name + " | " + effects + " |" + animations + " |" + chroma);
			}
			rs.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	void skin_level() // 7번
	{
		ResultSet rs = null;
		Scanner sc = new Scanner(System.in);

		int kind_num, chro_num;
		String kind = "";
		String chroma = "";
		
		System.out.println("등급을 선택하세요 : 1) Epic 2) Legendary 3) Mythic 4) Regular");
		System.out.print(">");
		kind_num = sc.nextInt();
		
		switch(kind_num)
		{
		case 1: 
			kind = "Epic";
			break;
		case 2:
			kind = "Legendary";
			break;
		case 3:
			kind = "Mythic";
			break;
		case 4:
			kind = "Regular";
			break;
		}
		
		System.out.println("크로마를 선택하세요 : 1) True 2) False");
		System.out.print(">");
		chro_num = sc.nextInt();
		
		switch(chro_num)
		{
		case 1:
			chroma = "True";
			break;
		case 2:
			chroma = "False";
			break;
		}
		
		try {
			// Q1: Complete your query.
			String sql = "SELECT * FROM SKIN WHERE Kind=?\r\n"
					+ "INTERSECT\r\n"
					+ "SELECT * FROM SKIN WHERE Chroma=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, kind);
			ps.setString(2, chroma);
			rs = ps.executeQuery();
			
			System.out.println("SKIN_NAME | PRICE | LAUNCH_DATE | CHROMA | KIND | CHAMP_NAME | UNI_NAME");
			System.out.println("------------------------------");
			while(rs.next()) {
				// Fill out your code
				String skin_name = rs.getString(1);
				int price = rs.getInt(2);
				String date = rs.getString(3);
				String Chroma = rs.getString(4);
				String Kind = rs.getString(5);
				String champ_name = rs.getString(6);
				String uni_name = rs.getString(7);
				System.out.println(skin_name+" | "+price+" |"+date+" |"+Chroma+" |"+Kind+" |"+champ_name+" |"+uni_name);
			}
			rs.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
