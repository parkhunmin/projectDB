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
		System.out.println("�˻��ϰ� ���� ������ �����ϼ���!");
		System.out.println("1) ��Ų�̸� 2) ��Ų ����� 3) è�Ǿ� 4) ��� 5) ũ�θ� 6) ����");
	}

}
