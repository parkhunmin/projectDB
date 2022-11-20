package projectDB;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.*; // import JDBC package
import java.util.ArrayList;


public class projectDB {
	public static final String URL = "jdbc:oracle:thin:@localhost:1521:orcl";
	public static final String USER_NAME ="lol";
	public static final String USER_PASSWD ="lol";
	
	public static void main(String[] args) {
		Start s = new Start();
		s.Init(URL, USER_NAME, USER_PASSWD); // 초기화
		
		while (true) { // 반복하며 메뉴 수행
			s.Update();
		}
	}

}
