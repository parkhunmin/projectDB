package projectDB;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;


public class Skin extends Start  {
	String _name;
	int _price;
	String _launch_date;
	boolean _chroma;
	float _Rating;
	String _Kind;
	String _champ_name;
	String _Uni_name;
	
	Skin()
	{
		
	}
	
	void skin_search()
	{
		System.out.println("검색하고 싶은 내용을 선택하세요!");
		System.out.println("1) 스킨이름 2) 스킨 세계관 3) 챔피언 4) 등급 5) 크로마 6) 가격");
	}

}
