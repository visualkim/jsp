package web.tool;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBOpen {
  public Connection getConnection(){
    Connection con = null;
    // ��: String url = "jdbc:oracle:thin:@127.0.0.1:1521:XE";
    String url = "jdbc:oracle:thin:@127.0.0.1:1521:XE";
    // MySQL: String url = "jdbc:mysql://localhost:3306/web?useUnicode=true&characterEncoding=euckr";
    String id="system";
    String passwd = "oracle";
    
    try {
      Class.forName("oracle.jdbc.driver.OracleDriver");
      // MySQL: "org.gjt.mm.mysql.Driver"; 
      con = DriverManager.getConnection(url, id, passwd);
    } catch (ClassNotFoundException e) {
      System.out.println("Oracle ����̹��� �����ϴ�.");
      e.printStackTrace();
    } catch (SQLException e) {
      System.out.println("����Ŭ ���� ������ ������ �ֽ��ϴ�.");
      e.printStackTrace();
    }
    
    return con;
  }
}
