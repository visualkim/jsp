package web.tool;

public class Tool {
  public static synchronized String checkNull(String str){
    if (str == null){
      str = "";
    }else{
      if (str.equals("null")){
        str = "";
      }else{
        str = str.trim(); // ���ڿ� �¿��� ���� ����
      }
    }
    
    return str;
  }
  
  // static synchronized: �޼ҵ� ������ ��û�� ���Ͽ� ���������� ���� 
  public static synchronized String convertChar(String str){
    str = str.replaceAll("<", "&lt;");
    str = str.replaceAll(">", "&gt;");
    str = str.replaceAll("'", "&#39;");   // '
    str = str.replaceAll("\"", "&quot;"); // "
    str = str.replaceAll("\r\n", "<BR>");
    
    return str;
  }

  /**
   * ������ Ȯ���ڸ� �����մϴ�.
   * @param name ���ϸ�
   * @return ���� Ȯ���� ��) winter.jpg �� jpg
   */
  public static synchronized String fileExtend(String file){
    if (file != null){
      file = file.toLowerCase();  // �ҹ��ڷ� ����
     
      int point = file.lastIndexOf("."); // ���������� ��Ÿ�� '.'�� ��ġ
      file = file.substring(point+1);  // .jpg --> jpg
    }else{
      file = ""; // null ���� ������ �ʱⰪ 
    }
    return file;
  }
  
  /**
   * ������ ���� ũ�⿡ ������ ������ �߰��մϴ�.
   * @param length
   * @return
   */
  public static synchronized String unit(long length){
    String str = "";
 
    if (length < 1024){  // Byte: 0 ~ 1023
      str = length + " Byte";   
    }else if (length < (1024 * 1024)){ // Byte: 1024 ~ 1048575
      str = length / 1024 + " KB";
    }else if(length < (1024 * 1024 * 1024)){ // Byte: 1048576 ~ 1073741823
      str = length / 1024 / 1024 + " MB";
    }else if(length < (1024L * 1024 * 1024 * 1024)){ // Byte: 1073741824 ~
      str = length / 1024 / 1024 / 1024+ " GB";
    }
    
    return str;
  }
  
  /**
   * �̹������� �˻��մϴ�.
   * @param file �˻��� ���ϸ�
   * @return true: �̹���,  false: �̹��� �ƴ�
   */
  public static synchronized boolean isImage(String file){
    boolean sw = false; // �̹��� ����
    
    if (file != null){
      file = file.toLowerCase();  // �ҹ��ڷ� ����
     
      int point = file.lastIndexOf("."); // ���������� ��Ÿ�� '.'�� ��ġ
      String ext = file.substring(point+1);  // .jpg --> jpg
      
      if (ext.equals("jpg") || ext.equals("gif") || ext.equals("png")){
        sw = true;
      }
    }
    return sw;
  }
  
  
}

