package web.tool;

import java.sql.Connection;

public class Test {
  public static void main(String[] args) {
/*    NoticeVO noticeVO = new NoticeVO();
    // noticeVO.noticeno = 2015;
    noticeVO.setNoticeno(2016);
    System.out.println(noticeVO.getNoticeno());
    int noticeno = noticeVO.getNoticeno();
    System.out.println("--> " + noticeno);*/
    
/*    DBOpen dbopen = new DBOpen();
    Connection con = dbopen.getConnection();
    
    if (con != null){
      System.out.println("DBMS ������ �����߽��ϴ�.");
    }else{
      System.out.println("DBMS ������ �����߽��ϴ�.");
    }*/
    
    String col = "rname";
    // 3�� ������: (����)? ���� ��� : ������ ���
    System.out.println((col.equals("rname"))?"selected='selected'":"");
    
  }

}





