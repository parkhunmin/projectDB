package projectDB;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Scanner;


public class Start {
	Connection conn = null; // Connection object
	Statement stmt = null;	// Statement object
	public static String _URL = "";
	public static String _USER_NAME ="";
	public static String _USER_PASSWD ="";
	
	Champion _champ;
	Universe _uni;
	Skin _skin;
	User _user;
	boolean LOG = false;
	
	void Init(String url, String name, String passwd) // connect oracle 
	{
		_URL = url;
		_USER_NAME = name;
		_USER_PASSWD = passwd;
		
		try {
			// Load a JDBC driver for Oracle DBMS
			Class.forName("oracle.jdbc.driver.OracleDriver");
			// Get a Connection object 
			System.out.println("Success!");
			}catch(ClassNotFoundException e) {
				System.err.println("error = " + e.getMessage());
				System.exit(1);
			}
		
		// Make a connection
		try{
			conn = DriverManager.getConnection(url, name, passwd); 
			System.out.println("Connected.");
		}catch(SQLException ex) {
			ex.printStackTrace();
			System.err.println("Cannot get a connection: " + ex.getLocalizedMessage());
			System.err.println("Cannot get a connection: " + ex.getMessage());
			System.exit(1);
		}
	}
	
	void Update()
	{
		System.out.println("----------------------------------------------");
		System.out.println("원하는 메뉴를 선택하세요!");
		
		if (LOG == true)
			System.out.println("1) 댓글작성 2) 평점주기 3) 스킨 검색 4) 챔피언 검색 5) 세계관 검색 6) 로그아웃");
		else
			System.out.println("1) 회원가입 2) 로그인 3) 스킨 검색 4) 챔피언 검색 5) 세계관 검색");

		System.out.println("----------------------------------------------");
		System.out.print(">");
		
		int num;
		Scanner sc = new Scanner(System.in);
		
		num = sc.nextInt();
		
		switch(num)
		{
		case 1: {
			_user = new User();
			_user.Init(_URL, _USER_NAME, _USER_PASSWD);
			if (LOG == false) {
				_user.create_User(); // 회원가입
			}
			else {
				_user.create_comment(); // 댓글작성
			}
			
			break;
		}
		case 2: {
			_user = new User();
			_user.Init(_URL, _USER_NAME, _USER_PASSWD);
			if (LOG == false) {
				LOG = _user.Login();
			}
			else {
				_user.rating_Skin();
			}
			
			break;
		}
		case 3: {
			_skin = new Skin();
			_skin.Init(_URL, _USER_NAME, _USER_PASSWD);
			_skin.skin_search();
			break;
		}
		case 4: {
			_champ = new Champion();
			_champ.Init(_URL, _USER_NAME, _USER_PASSWD);
			_champ.champ_Search();
			break;
		}
		case 5: {
			_uni = new Universe();
			_uni.Init(_URL, _USER_NAME,_USER_PASSWD);
			_uni.uni_Search();
			break;
		}
		case 6: {
			if (LOG) {
				LOG = false;
				System.out.println("로그아웃");
			}
			break;
		}
		
		default:
			break;
		}
		
	}
	
}
