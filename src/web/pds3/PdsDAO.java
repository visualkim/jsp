package web.pds3;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import web.tool.DBClose;
import web.tool.DBOpen;

public class PdsDAO {
  DBOpen dbopen = null;
  DBClose dbclose = null;
  Connection con = null;
  PreparedStatement pstmt = null;
  ResultSet rs = null;
  StringBuffer sql = null;
  
  public PdsDAO(){
    dbopen = new DBOpen();
    dbclose = new DBClose();
  }

  public int insert(PdsVO pdsVO){
    int count = 0;    // ó���� ���ڵ� ����
    
    try{
      con = dbopen.getConnection();
      
      sql = new StringBuffer();
      sql.append(" INSERT INTO pds3(pdsno, rname, email, title, content, passwd, cnt, rdate, url, file1, size1)");
      sql.append(" VALUES((SELECT NVL(MAX(pdsno), 0)+1 as max FROM pds3),");
      sql.append("   ?, ?, ?, ?, ?, 0, sysdate, ?, ?, ?)");
      
      pstmt = con.prepareStatement(sql.toString());      
      pstmt.setString(1, pdsVO.getRname());
      pstmt.setString(2, pdsVO.getEmail());
      pstmt.setString(3, pdsVO.getTitle());
      pstmt.setString(4, pdsVO.getContent());
      pstmt.setString(5, pdsVO.getPasswd());
      pstmt.setString(6, pdsVO.getUrl());
      pstmt.setString(7, pdsVO.getFile1());
      pstmt.setLong(8,  pdsVO.getSize1());
      
      count = pstmt.executeUpdate();  // ����, insert ���� ����
    }catch(Exception e){
      e.printStackTrace();
    }finally{
      dbclose.close(con, pstmt);  // �޸� ����
    }
    
    return count; 
  }

  public ArrayList<PdsVO> list(){
    ArrayList<PdsVO> list = new ArrayList<PdsVO>();
    
    try{
      con = dbopen.getConnection();
      
      sql = new StringBuffer();
      sql.append(" SELECT pdsno, rname, email, title, passwd, cnt, rdate, url, file1, size1");
      sql.append(" FROM pds3");
      sql.append(" ORDER BY pdsno DESC");
      
      pstmt = con.prepareStatement(sql.toString());      
      rs = pstmt.executeQuery();
      
      // rs.next(): ���� ȣ��� ù��° ���ڵ�� �̵�
      // rs.next(): ������ ���ڵ���� ���������� �ڵ� �̵�
      while(rs.next() == true){
        // DBMS --> JAVA ��ü�� ��ȯ
        PdsVO pdsVO = new PdsVO();
        pdsVO.setPdsno(rs.getInt("pdsno"));
        pdsVO.setRname(rs.getString("rname"));
        pdsVO.setEmail(rs.getString("email"));
        pdsVO.setTitle(rs.getString("title"));
        pdsVO.setPasswd(rs.getString("passwd"));
        pdsVO.setCnt(rs.getInt("cnt")); 
        pdsVO.setRdate(rs.getString("rdate"));
        pdsVO.setUrl(rs.getString("url") );
        pdsVO.setFile1(rs.getString("file1"));
        pdsVO.setSize1(rs.getLong("size1"));
        
        list.add(pdsVO);
      }
    }catch(Exception e){
      e.printStackTrace();
    }finally{
      dbclose.close(con, pstmt, rs);  // �޸� ����
    }
    
    return list; 
  }

  /**
   * ��ȸ�� ����
   * @param pdsno
   */
  public void increaseCnt(int pdsno){
    try{
      con = dbopen.getConnection();
      
      sql = new StringBuffer();
      sql.append(" UPDATE pds3");
      sql.append(" SET cnt = cnt + 1");
      sql.append(" WHERE pdsno=?");
      
      pstmt = con.prepareStatement(sql.toString());      
      pstmt.setInt(1, pdsno);
      
      pstmt.executeUpdate();  // ����, insert ���� ����
    }catch(Exception e){
      e.printStackTrace();
    }finally{
      dbclose.close(con, pstmt);  // �޸� ����
    }
  }

  /**
   * ��ȸ
   * @param pdsno
   * @return
   */
  public PdsVO read(int pdsno){
    PdsVO pdsVO = null;
    
    try{
      con = dbopen.getConnection();
      
      sql = new StringBuffer();
      sql.append(" SELECT pdsno, rname, email, title, content, passwd, cnt, rdate, url, file1, size1");
      sql.append(" FROM pds3");
      sql.append(" WHERE pdsno = ?");
      
      pstmt = con.prepareStatement(sql.toString());
      pstmt.setInt(1, pdsno);
      
      rs = pstmt.executeQuery();
      
      // rs.next(): ���� ȣ��� ù��° ���ڵ�� �̵�
      // rs.next(): ������ ���ڵ���� ���������� �ڵ� �̵�
      if(rs.next() == true){
        // DBMS --> JAVA ��ü�� ��ȯ
        pdsVO = new PdsVO();
        pdsVO.setPdsno(rs.getInt("pdsno"));
        pdsVO.setRname(rs.getString("rname"));
        pdsVO.setEmail(rs.getString("email"));
        pdsVO.setTitle(rs.getString("title"));
        pdsVO.setContent(rs.getString("content"));
        pdsVO.setPasswd(rs.getString("passwd"));
        pdsVO.setCnt(rs.getInt("cnt")); 
        pdsVO.setRdate(rs.getString("rdate"));
        pdsVO.setUrl(rs.getString("url") );
        pdsVO.setFile1(rs.getString("file1"));
        pdsVO.setSize1(rs.getLong("size1"));
      }
    }catch(Exception e){
      e.printStackTrace();
    }finally{
      dbclose.close(con, pstmt, rs);  // �޸� ����
    }
    
    return pdsVO; 
  }

  /**
   * �˻� ��� ����
   * @param col �˻� �÷�
   * @param word �˻���
   * @return
   */
  public ArrayList<PdsVO> list(String col, String word){
    ArrayList<PdsVO> list = new ArrayList<PdsVO>();
    
    try{
      con = dbopen.getConnection();
      sql = new StringBuffer();
      
      if (col.equals("rname")){
        sql.append(" SELECT pdsno, rname, email, title, passwd, cnt, rdate, url, file1, size1");
        sql.append(" FROM pds3");
        sql.append(" WHERE rname LIKE ?");
        sql.append(" ORDER BY pdsno DESC");
        
        pstmt = con.prepareStatement(sql.toString());     
        pstmt.setString(1, "%"+word+"%");
        
      }else if (col.equals("title")){
        sql.append(" SELECT pdsno, rname, email, title, passwd, cnt, rdate, url, file1, size1");
        sql.append(" FROM pds3");
        sql.append(" WHERE title LIKE ?");
        sql.append(" ORDER BY pdsno DESC");
        
        pstmt = con.prepareStatement(sql.toString());     
        pstmt.setString(1, "%"+word+"%");
      }else if (col.equals("content")){
        sql.append(" SELECT pdsno, rname, email, title, passwd, cnt, rdate, url, file1, size1");
        sql.append(" FROM pds3");
        sql.append(" WHERE content LIKE ?");
        sql.append(" ORDER BY pdsno DESC");
        
        pstmt = con.prepareStatement(sql.toString());     
        pstmt.setString(1, "%"+word+"%");
      }else if (col.equals("title_content")){
        sql.append(" SELECT pdsno, rname, email, title, passwd, cnt, rdate, url, file1, size1");
        sql.append(" FROM pds3");
        sql.append(" WHERE title LIKE ? OR content LIKE ?");
        sql.append(" ORDER BY pdsno DESC");
        
        pstmt = con.prepareStatement(sql.toString());     
        pstmt.setString(1, "%"+word+"%");
        pstmt.setString(2, "%"+word+"%");
      }else{
        sql.append(" SELECT pdsno, rname, email, title, passwd, cnt, rdate, url, file1, size1");
        sql.append(" FROM pds3");
        sql.append(" ORDER BY pdsno DESC");
        
        pstmt = con.prepareStatement(sql.toString());     
      }
 
      rs = pstmt.executeQuery();
      
      // rs.next(): ���� ȣ��� ù��° ���ڵ�� �̵�
      // rs.next(): ������ ���ڵ���� ���������� �ڵ� �̵�
      while(rs.next() == true){
        // DBMS --> JAVA ��ü�� ��ȯ
        PdsVO pdsVO = new PdsVO();
        pdsVO.setPdsno(rs.getInt("pdsno"));
        pdsVO.setRname(rs.getString("rname"));
        pdsVO.setEmail(rs.getString("email"));
        pdsVO.setTitle(rs.getString("title"));
        pdsVO.setPasswd(rs.getString("passwd"));
        pdsVO.setCnt(rs.getInt("cnt")); 
        pdsVO.setRdate(rs.getString("rdate"));
        pdsVO.setUrl(rs.getString("url") );
        pdsVO.setFile1(rs.getString("file1"));
        pdsVO.setSize1(rs.getLong("size1"));
        
        list.add(pdsVO);
      }
    }catch(Exception e){
      e.printStackTrace();
    }finally{
      dbclose.close(con, pstmt, rs);  // �޸� ����
    }
    
    return list; 
  }

  /**
   * �˻��� ���ڵ� ������ ���մϴ�.
   * @param col �˻� �÷�
   * @param word �˻���
   * @return �˻��� ���ڵ� ����
   */
  public int count(String col, String word){
    int count = 0;
    try{
      con = dbopen.getConnection();
      sql = new StringBuffer();
      
      if (col.equals("rname")){
        sql.append(" SELECT COUNT(*) as cnt");
        sql.append(" FROM pds3");
        sql.append(" WHERE rname LIKE ?");
        
        pstmt = con.prepareStatement(sql.toString());     
        pstmt.setString(1, "%"+word+"%");
        
      }else if (col.equals("title")){
        sql.append(" SELECT COUNT(*) as cnt");
        sql.append(" FROM pds3");
        sql.append(" WHERE title LIKE ?");
        
        pstmt = con.prepareStatement(sql.toString());     
        pstmt.setString(1, "%"+word+"%");
      }else if (col.equals("content")){
        sql.append(" SELECT COUNT(*) as cnt");
        sql.append(" FROM pds3");
        sql.append(" WHERE content LIKE ?");
        
        pstmt = con.prepareStatement(sql.toString());     
        pstmt.setString(1, "%"+word+"%");
      }else if (col.equals("title_content")){
        sql.append(" SELECT COUNT(*) as cnt");
        sql.append(" FROM pds3");
        sql.append(" WHERE title LIKE ? OR content LIKE ?");
        
        pstmt = con.prepareStatement(sql.toString());     
        pstmt.setString(1, "%"+word+"%");
        pstmt.setString(2, "%"+word+"%");
      }else{
        sql.append(" SELECT COUNT(*) as cnt");
        sql.append(" FROM pds3");
        sql.append(" ORDER BY pdsno DESC");
        
        pstmt = con.prepareStatement(sql.toString());     
      }
 
      rs = pstmt.executeQuery();

      if(rs.next() == true){
        count = rs.getInt("cnt");
      }
    }catch(Exception e){
      e.printStackTrace();
    }finally{
      dbclose.close(con, pstmt, rs);  // �޸� ����
    }

    return count;
  }

  /**
   * �˻� ��� ����
   * @param col �˻� �÷�
   * @param word �˻���
   * @param nowPage ���� ������
   * @param recordPerPage �������� ����� ���ڵ��� ����
   * @return
   */
  public ArrayList<PdsVO> list(String col, String word, int nowPage, int recordPerPage){
    ArrayList<PdsVO> list = new ArrayList<PdsVO>();
    
    int startRow = ((nowPage-1) * recordPerPage) + 1;
    int endRow = nowPage * recordPerPage;
    
    /*
    1) 1 ������: 1~10�� ���ڵ�, r >= 1 AND r <=10 
    int startRow = (( 1 - 1 ) * 10) + 1 �� 1 
    int endRow = 1 * 10 �� 10
        
    2) 2 ������:11~20�� ���ڵ�, r >=11 AND r <=20
    int startRow = (( 2 - 1 ) * 10) + 1 �� 11 
    int endRow = 2 * 10 �� 20    
     
    3) 3 ������:21~30�� ���ڵ�, r >=21 AND r <=30 
    int startRow = (( 3 - 1 ) * 10) + 1 �� 21 
    int endRow = 3 * 10 �� 30        
    */
    
    try{
      con = dbopen.getConnection();
      sql = new StringBuffer();
      
      if (col.equals("rname")){
        sql.append(" SELECT pdsno, rname, email, title, passwd, cnt, rdate, url, file1, size1, r");
        sql.append(" FROM (");
        sql.append("           SELECT pdsno, rname, email, title, passwd, cnt, rdate, url, file1, size1, rownum as r");
        sql.append("           FROM (");
        sql.append("                     SELECT pdsno, rname, email, title, passwd, cnt, rdate, url, file1, size1");
        sql.append("                     FROM pds3");
        sql.append("                     WHERE rname LIKE ?");
        sql.append("                     ORDER BY pdsno DESC");
        sql.append("           )");
        sql.append(" )");
        sql.append(" WHERE r >="+startRow+" AND r <= " + endRow);
        
        pstmt = con.prepareStatement(sql.toString());     
        pstmt.setString(1, "%"+word+"%");
        
      }else if (col.equals("title")){
        sql.append(" SELECT pdsno, rname, email, title, passwd, cnt, rdate, url, file1, size1, r");
        sql.append(" FROM (");
        sql.append("           SELECT pdsno, rname, email, title, passwd, cnt, rdate, url, file1, size1, rownum as r");
        sql.append("           FROM (");
        sql.append("                     SELECT pdsno, rname, email, title, passwd, cnt, rdate, url, file1, size1");
        sql.append("                     FROM pds3");
        sql.append("                     WHERE title LIKE ?");
        sql.append("                     ORDER BY pdsno DESC");
        sql.append("           )");
        sql.append(" )");
        sql.append(" WHERE r >="+startRow+" AND r <= " + endRow);

        
        pstmt = con.prepareStatement(sql.toString());     
        pstmt.setString(1, "%"+word+"%");
      }else if (col.equals("content")){
        sql.append(" SELECT pdsno, rname, email, title, passwd, cnt, rdate, url, file1, size1, r");
        sql.append(" FROM (");
        sql.append("           SELECT pdsno, rname, email, title, passwd, cnt, rdate, url, file1, size1, rownum as r");
        sql.append("           FROM (");
        sql.append("                     SELECT pdsno, rname, email, title, passwd, cnt, rdate, url, file1, size1");
        sql.append("                     FROM pds3");
        sql.append("                     WHERE content LIKE ?");
        sql.append("                     ORDER BY pdsno DESC");
        sql.append("           )");
        sql.append(" )");
        sql.append(" WHERE r >="+startRow+" AND r <= " + endRow);

        
        pstmt = con.prepareStatement(sql.toString());     
        pstmt.setString(1, "%"+word+"%");
      }else if (col.equals("title_content")){
        sql.append(" SELECT pdsno, rname, email, title, passwd, cnt, rdate, url, file1, size1, r");
        sql.append(" FROM (");
        sql.append("           SELECT pdsno, rname, email, title, passwd, cnt, rdate, url, file1, size1, rownum as r");
        sql.append("           FROM (");
        sql.append("                     SELECT pdsno, rname, email, title, passwd, cnt, rdate, url, file1, size1");
        sql.append("                     FROM pds3");
        sql.append("                     WHERE title LIKE ? OR content LIKE ?");
        sql.append("                     ORDER BY pdsno DESC");
        sql.append("           )");
        sql.append(" )");
        sql.append(" WHERE r >="+startRow+" AND r <= " + endRow);

        pstmt = con.prepareStatement(sql.toString());     
        pstmt.setString(1, "%"+word+"%");
        pstmt.setString(2, "%"+word+"%");
      }else{
        sql.append(" SELECT pdsno, rname, email, title, passwd, cnt, rdate, url, file1, size1, r");
        sql.append(" FROM (");
        sql.append("           SELECT pdsno, rname, email, title, passwd, cnt, rdate, url, file1, size1, rownum as r");
        sql.append("           FROM (");
        sql.append("                     SELECT pdsno, rname, email, title, passwd, cnt, rdate, url, file1, size1");
        sql.append("                     FROM pds3");
        sql.append("                     ORDER BY pdsno DESC");
        sql.append("           )");
        sql.append(" )");
        sql.append(" WHERE r >="+startRow+" AND r <= " + endRow);

        pstmt = con.prepareStatement(sql.toString());     
      }
 
      rs = pstmt.executeQuery();
      
      // rs.next(): ���� ȣ��� ù��° ���ڵ�� �̵�
      // rs.next(): ������ ���ڵ���� ���������� �ڵ� �̵�
      while(rs.next() == true){
        // DBMS --> JAVA ��ü�� ��ȯ
        PdsVO pdsVO = new PdsVO();
        pdsVO.setPdsno(rs.getInt("pdsno"));
        pdsVO.setRname(rs.getString("rname"));
        pdsVO.setEmail(rs.getString("email"));
        pdsVO.setTitle(rs.getString("title"));
        pdsVO.setPasswd(rs.getString("passwd"));
        pdsVO.setCnt(rs.getInt("cnt")); 
        pdsVO.setRdate(rs.getString("rdate"));
        pdsVO.setUrl(rs.getString("url") );
        pdsVO.setFile1(rs.getString("file1"));
        pdsVO.setSize1(rs.getLong("size1"));
        
        list.add(pdsVO);
      }
    }catch(Exception e){
      e.printStackTrace();
    }finally{
      dbclose.close(con, pstmt, rs);  // �޸� ����
    }
    
    return list; 
  }

  /**
   * �н����� �˻�
   * @param pdsno �۹�ȣ
   * @param passwd �н�����
   * @return ����
   */
  public int passwordCheck(int pdsno, String passwd){
    int count = 0;              // ���ڵ��

    try{
      con = dbopen.getConnection();
      
      sql = new StringBuffer();
      sql.append(" SELECT count(*) as cnt");
      sql.append(" FROM pds3 ");
      sql.append(" WHERE pdsno=? AND passwd=?");
      
      pstmt = con.prepareStatement(sql.toString());
      pstmt.setInt(1, pdsno);
      pstmt.setString(2, passwd);
      rs= pstmt.executeQuery();  // SELECT
     
      if(rs.next() == true){ 
        count = rs.getInt("cnt");
      }
    }catch(Exception e){
      e.printStackTrace();
    }finally{
      dbclose.close(con, pstmt, rs);
    }

    return count;
  }

  public int updateFile(PdsVO pdsVO){
    int count = 0;    // ó���� ���ڵ� ����
    
    try{
      con = dbopen.getConnection();
      
      sql = new StringBuffer();
      sql.append(" UPDATE pds3");
      sql.append(" SET file1=?, size1=?");
      sql.append(" WHERE pdsno=?");
      
      pstmt = con.prepareStatement(sql.toString());      
      pstmt.setString(1, pdsVO.getFile1());
      pstmt.setLong(2,  pdsVO.getSize1());
      pstmt.setInt(3, pdsVO.getPdsno());
      
      count = pstmt.executeUpdate();  // ����, insert ���� ����
    }catch(Exception e){
      e.printStackTrace();
    }finally{
      dbclose.close(con, pstmt);  // �޸� ����
    }
    
    return count; 
  }

  /**
   * ��ϵ� ������ �����մϴ�.
   * @param vo ������ ������ ��ü
   * @return ����� ���ڵ� ��
   */
  public int update(PdsVO vo){
    int count = 0;            // ó���� ���ڵ� ����

    try{
      con = dbopen.getConnection();

      sql = new StringBuffer();
      sql.append(" UPDATE pds3");
      sql.append(" SET rname=?, email=?, title=?, content=?, url=?");
      sql.append(" WHERE pdsno = ?");
      
      pstmt = con.prepareStatement(sql.toString());
      pstmt.setString(1, vo.getRname());
      pstmt.setString(2, vo.getEmail());
      pstmt.setString(3, vo.getTitle());       
      pstmt.setString(4, vo.getContent());  
      pstmt.setString(5, vo.getUrl());
      pstmt.setInt(6, vo.getPdsno());
      
      count = pstmt.executeUpdate();
      
    }catch(Exception e){
      e.printStackTrace();
    }finally{
      dbclose.close(con, pstmt);
    }

    return count;
  }
  
  /**
   * ��ϵ� ������ �����մϴ�.
   * @param pdsno ������ �� ��ȣ
   * @return ������ ���ڵ� ��
   */
  public int delete(int pdsno){
    int count = 0;            // ó���� ���ڵ� ����
  
    try{
      con = dbopen.getConnection();
  
      sql = new StringBuffer();
      sql.append(" DELETE FROM pds3");
      sql.append(" WHERE pdsno = ?");
      
      pstmt = con.prepareStatement(sql.toString());
      pstmt.setInt(1, pdsno);
      
      count = pstmt.executeUpdate();  // INSERT, UPDATE, DELETE
      
    }catch(Exception e){
      e.printStackTrace();
    }finally{
      dbclose.close(con, pstmt);
    }
  
    return count;
  }
  
}


