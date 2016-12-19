package bitcamp.java87.project01.common;

import java.io.File;
import java.io.FileOutputStream;

import org.springframework.web.multipart.MultipartFile;

import bitcamp.java87.project01.domain.Content;

public class Upload {
	private FileOutputStream fos;
    private String filePath;
    private String fileName;
    
    public void uploadFile(MultipartFile file, Content content) {
         
        try{
        	
            byte fileData[] = file.getBytes();
             filePath = "c:/bitshare/"+ content.getTitle() + "/";
             fileName = file.getOriginalFilename();
             
             File dir = new File(filePath);
             
             if (!dir.exists()) { //폴더 없으면 폴더 생성
                 dir.mkdirs();
             }
             
            fos = new FileOutputStream(filePath + fileName);
             
            fos.write(fileData);
            
            content.setFilePath(filePath);
            content.setFileName(fileName);
            
        }catch(Exception e){
             
            e.printStackTrace();
             
        }finally{
             
            if(fos != null){
                 
                try{
                    fos.close();
                }catch(Exception e){}
                 
                }
        }// try end;
    }
}
