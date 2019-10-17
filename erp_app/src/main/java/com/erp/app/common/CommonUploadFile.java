package com.erp.app.common;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.erp.app.dto.MemberDTO;

/**
 * Common
 */
@Service
public class CommonUploadFile {

	  // ������ �������� ���� ��θ� �ۼ� ( ��Ʈ ����� /���� �����Ѵ�. )
	  // �������� workspace�� ����̺긦 �ľ��Ͽ� JVM�� �˾Ƽ� ó�����ش�.
	  // ���� workspace�� C����̺꿡 �ִٸ� C����̺꿡 upload ������ ������ ���ƾ� �Ѵ�.
	  private static final String PREFIX_URL = "/akiid18/tomcat/webapps/upload/profile/";
	   
	  public void restore(HttpServletRequest request, MemberDTO member) {

	    try {
	    	
	      File file = new File(PREFIX_URL + member.getNo() + ".jpg"); 
	      
	      if(file.exists()) 
	      { 
	    	  file.delete();
	      } 

	      // ���� ����
	      String originFilename = member.getFileUpload().getOriginalFilename();
	      String extName = originFilename.substring(originFilename.lastIndexOf("."), originFilename.length());

	      // �������� ���� �� ���� �̸�
	      String saveFileName = member.getNo() + extName;
	       
	      writeFile(request, member.getFileUpload(), saveFileName);
	    }
	    catch (IOException e) {
	      // ������� RuntimeException �� ��ӹ��� ���ܰ� ó���Ǿ�� ������
	      // ���ǻ� RuntimeException�� ������.
	      // throw new FileUploadException(); 
	      throw new RuntimeException(e);
	    }
	  }
	  
	   
	  // ������ ������ write �ϴ� �޼���
	  private boolean writeFile(HttpServletRequest request, MultipartFile multipartFile, String saveFileName) throws IOException
	  {
	    boolean result = false;
	 
	    byte[] data = multipartFile.getBytes();
	    FileOutputStream fos = new FileOutputStream(PREFIX_URL + saveFileName);
	    fos.write(data);
	    fos.close();
	     
	    return result;
	  }

	  
}
