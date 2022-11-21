package projectDB;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Scanner;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
//날짜
import java.time.LocalDate;
import java.time.ZoneId;
import java.util.Date;



public class User extends Start{

	public static String login_id=" ";//얘를 어디에 지정하느냐가 문제
	public static String Login_name="";
	
	//이메일 유효성 검사 함수 출처:https://solbel.tistory.com/309
	//원형은 좀 정석적이라 수정할 필요가 있어보임. 덜까다롭게. 
	//아마 대문자 허용이 안되는듯.되게 바꾸자?
	 public static boolean isValidEmail(String email) {
		  boolean err = false;
		  String regex = "^[_a-z0-9-]+(.[_a-z0-9-]+)*@(?:\\w+\\.)+\\w+$";   
		  Pattern p = Pattern.compile(regex);
		  Matcher m = p.matcher(email);
		  if(m.matches()) {
		   err = true; 
		  }
		  return err;
		 }
	 
	void create_User()
	{
		ResultSet rs = null;
		Scanner sc = new Scanner(System.in); //스캐너 추가
		System.out.println("회원가입");
		//사용되는 변수
		String ID;
		String email;
		String name;
		String PW;
		
		//아이디
		while(true)//수정 필요
		{
			System.out.print("사용하실 아이디를 입력하세요: ");
			ID = sc.next();
			//아이디 중복 검사 필요함
			try {
				// Q1: Complete your query.
				String sql = "SELECT ID \r\n"
						+ "FROM USERS\r\n"
						+ "WHERE ID = ?";
				PreparedStatement ps = conn.prepareStatement(sql);
				ps.setString(1, ID);
				rs = ps.executeQuery();
				

				if(rs.next()==false) {//검색 결과가 없을때
					System.out.println("사용가능한 아이디입니다.");
					break;
				}
				System.out.println("이미 사용중인 아이디입니다.");
				rs.close();
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		//이메일
		while(true)
		{
			System.out.print("이메일 주소를 입력하세요: ");
			email = sc.next();
			//이메일 중복검사 먼저하고 형식 확인하자. 옛날에 넣어놓은게 대문자때문에 틀린게 많음. 이거 어카지 아 ㅋㅋㅋ 일단 나중에 얘기해보자..
			//이메일 형식 확인도 해야함
			
			if (isValidEmail(email)) {
				//이메일 중복 검사 필요함
				try {
					// Q1: Complete your query.
					String sql = "SELECT Email \r\n"
							+ "FROM USERS\r\n"
							+ "WHERE Email = ?";
					PreparedStatement ps = conn.prepareStatement(sql);
					ps.setString(1, email);
					rs = ps.executeQuery();
					
					if(rs.next()==false) {//검색 결과가 없을때
						System.out.println("사용가능한 이메일입니다.");
						break;
					}
					System.out.println("이미 사용중인 이메일입니다.");
					rs.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			else {
				System.out.println("잘못된 이메일 형식입니다.");
			}
						
		}
		//이름
		while(true)
		{
			System.out.print("사용하실 이름을 입력하세요: ");
			name = sc.next();
			//이름 중복 검사 필요함
			try {
				// Q1: Complete your query.
				String sql = "SELECT name \r\n"
						+ "FROM USERS\r\n"
						+ "WHERE name = ?";
				PreparedStatement ps = conn.prepareStatement(sql);
				ps.setString(1, name);
				rs = ps.executeQuery();
				
				if(rs.next()==false) {//검색 결과가 없을때
					System.out.println("사용가능한 이름입니다.");
					break;
				}
				System.out.println("이미 사용중인 이름입니다.");
				rs.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		//비밀번호
		System.out.print("사용하실 비밀번호를 입력하세요: ");
		PW = sc.next();
		
		//계정 추가
		try {
			// Q1: Complete your query.
			String sql = "INSERT INTO USERS VALUES(?, ?, ?, ?)"; //이게 왜 에러가 날까
			PreparedStatement ps = conn.prepareStatement(sql);//이 부분 에러만 해결하면 끝남. 중간에 회원가입 때려치는 버튼 만들어야될 것 같긴함

			ps.setString(1, ID);
			ps.setString(2, PW);
			ps.setString(3, name);
			ps.setString(4, email);
			rs = ps.executeQuery();
			
			System.out.println("회원가입이 완료되었습니다.");
			rs.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	boolean Login()
	{
		System.out.println("로그인");
		//
		ResultSet rs = null;
		Scanner sc = new Scanner(System.in); //스캐너 추가
		//아이디
		while(true)
		{
			System.out.print("아이디를 입력하세요: ");
			String id = sc.next();
			try {
				// Q1: Complete your query.
				String sql = "SELECT Id, Password \r\n"
						+ "FROM USERS\r\n"
						+ "WHERE Id = ?";
				PreparedStatement ps = conn.prepareStatement(sql);
				ps.setString(1, id);
				rs = ps.executeQuery();
				
				while(rs.next()) {//이게 작동을 안함
					String check_id = rs.getString(1);
					String check_pw = rs.getString(2);
					if(check_id.equals(id)) {//검색 결과가 있을때로 해도딜듯
						System.out.print("비밀번호를 입력하세요:");
						//세번 틀리면 탈출시키자 그냥...
						String pw = sc.next();
						
						if(check_pw.equals(pw)) {
							System.out.println("로그인 되었습니다."); //이 시점의 유저 id를 가지고 있어야함.
							//일단 이렇게 처리
							login_id=id;
							return true;
						}
						else {
							System.out.println("비밀번호가 틀렸습니다.");
							return false;
						}
					}
					else {
						return false;
					}
				}
				System.out.println("존재하지 않는 아이디입니다.");//그냥 false시키고 처음 메뉴로 돌아가게하든가
				rs.close();
				return false;
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
	
	void create_comment()
	{
		System.out.println("댓글 작성");
		//댓글을 작성할 스킨 페이지 찾아가기. 없으면 그냥 끝내버려
		//코멘트 작성
		//인서트
		ResultSet rs = null;
		Scanner sc = new Scanner(System.in);

		String skin_name;
		System.out.print("댓글을 남기고 싶은 스킨의 이름을 입력하세요: ");
		skin_name = sc.nextLine(); //띄어쓰기도 받도록해아함
		//System.out.print(skin_name);
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
			String sql = "SELECT Skin_name \r\n"
					+ "FROM skin\r\n"
					+ "WHERE Skin_name = ?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, skin_name);
			rs = ps.executeQuery();

			//스킨이 존재하지 않는 경우
			if(rs.next()==false) {//검색 결과가 없을때
				System.out.println("존재하지 않는 스킨입니다."); //여기 에러남
			}
			
			else {
				System.out.print("작성할 코멘트를 입력하세요: ");
				String content = sc.nextLine();
				//유저 정보 저장하기
				String Login_name="";
				try {
					// Q1: Complete your query.
					sql = "SELECT NAME \r\n"
							+ "FROM USERS\r\n"
							+ "WHERE ID=?";//					
					ps = conn.prepareStatement(sql);
					ps.setString(1, login_id);
					rs = ps.executeQuery();
					
					while(rs.next()) {
						// Fill out your code
						Login_name = rs.getString(1);
					}
					rs.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
				//코멘트 인서트 (얘도 인서트만 고치면됨)
				sql = "INSERT INTO COMMENTS VALUES(?, ?, ?, ?, ?)"; //

				ps = conn.prepareStatement(sql);//이 부분 에러만 해결하면 끝남. 중간에 회원가입 때려치는 버튼 만들어야될 것 같긴함
				LocalDate now = LocalDate.now();
				String date=String.format("%1$tY-%1$tm-%1$td", now);
				//System.out.println(login_id+" "+ Login_name+" "+content+" "+date+" "+skin_name);
				//어떤 값이 널인데
				ps.setString(1, login_id); //이게 문제임
				ps.setString(2, Login_name); //로그인한 유저의 정보를 들고있어야함...
				ps.setString(3, content);
				ps.setString(4, date);//시스템 현재 시각
				ps.setString(5, skin_name);
				int r = ps.executeUpdate();
				System.out.println("댓글이 등록되었습니다.");
				conn.commit();
			}
			
			rs.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	void rating_Skin()
	{
		System.out.println("스킨 평점!");
		//평가할 스킨 페이지 찾아가기. 없으면 그냥 끝내버려
		//평점주기 (1~5) 범위 넘어가면 다시 입력받아야함. 수정도 가능?
		//인서트
		
		ResultSet rs = null;
		Scanner sc = new Scanner(System.in);

		String skin_name;
		System.out.print("평가할 싶은 스킨의 이름을 입력하세요: ");
		skin_name = sc.nextLine(); //띄어쓰기도 받도록해아함
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
			String sql = "SELECT Skin_name \r\n"
					+ "FROM skin\r\n"
					+ "WHERE Skin_name = ?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, skin_name);
			rs = ps.executeQuery();

			//스킨이 존재하지 않는 경우
			if(rs.next()==false) {//검색 결과가 없을때
				System.out.println("존재하지 않는 스킨입니다."); //여기 에러남
			}
			
			else {
				int score=-1;
				while(true) {
					System.out.print("1~5까지 평점을 입력하세요: ");
					score = sc.nextInt();
					if (score>=1 && score<=5) {//소수점 입력하면 이거 어떡하냐...
						break;
					}
					//범위넘으면 다시 받아야함
				}
										
				sql = "INSERT INTO RATING VALUES(?, ?, ?)"; //

				ps = conn.prepareStatement(sql);//이 부분 에러만 해결하면 끝남. 중간에 회원가입 때려치는 버튼 만들어야될 것 같긴함
				//어떤 값이 널인데
				ps.setString(1, login_id); //이게 문제임
				ps.setString(2, skin_name); //로그인한 유저의 정보를 들고있어야함...
				ps.setInt(3, score);

				int r = ps.executeUpdate();
				conn.commit();
				System.out.println("평점이 등록되었습니다.");
			}
			
			rs.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	void skinList()
	{
		ResultSet rs = null;
		Scanner sc = new Scanner(System.in);

		String name;
		System.out.println("평가한 스킨 목록");
		
		try {
			// Q1: Complete your query.
			String sql = "SELECT R.Skin_name, R.Score, C.Content\r\n" 
						+ "FROM USERS U, COMMENTS C, RATING R\r\n"
						+ "WHERE C.Skin_name=R.Skin_name\r\n"
						+ "AND C.ID=?\r\n"
						+ "AND C.ID=R.ID AND C.ID=U.ID\r\n"
						+ "ORDER BY U.Name";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, login_id);
			rs = ps.executeQuery();
			
			System.out.println("Skin_NAME | Score | comment");
			System.out.println("------------------------------");
			while(rs.next()) {
				// Fill out your code
				String skin_name = rs.getString(1);
				int score = rs.getInt(2);
				String content = rs.getString(3);
				System.out.println(skin_name + " | " + score + " |" + content);
			}
			rs.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
}
