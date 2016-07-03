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
      System.out.println("DBMS 연결이 성공했습니다.");
    }else{
      System.out.println("DBMS 연결이 성공했습니다.");
    }*/
    
    String col = "rname";
    // 3항 연산자: (조건)? 참일 경우 : 거짓일 경우
    System.out.println((col.equals("rname"))?"selected='selected'":"");
    
  }

}





