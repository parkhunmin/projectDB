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
		System.out.println("알고 싶은 내용을 선택하세요!");
		System.out.println("1) 스킨정보 2) 스킨 출시일 3) 챔피언별 스킨 4) 스킨 평점 5) 스킨별 댓글 6) 스킨 변경점 7) 등급과 크로마");
		
		
	}

}
