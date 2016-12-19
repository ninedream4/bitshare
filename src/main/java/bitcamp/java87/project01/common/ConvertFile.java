package bitcamp.java87.project01.common;

import java.awt.Image;
import java.awt.image.RenderedImage;
import java.io.File;
import java.io.FileOutputStream;
import java.util.List;

import javax.imageio.ImageIO;

import org.apache.commons.io.IOUtils;
import org.ghost4j.document.PDFDocument;
import org.ghost4j.renderer.SimpleRenderer;

public class ConvertFile {
	public static void convertFileToJpg(String filePath, String fileName) throws Exception {
		System.out.println("convertFIle start======");
		FileOutputStream fos = null;
		System.out.println(filePath+fileName);
		
		try {
			PDFDocument document = new PDFDocument();
			document.load(new File(filePath+fileName));
			
			SimpleRenderer renderer = new SimpleRenderer();

		    // set resolution (in DPI)
		    renderer.setResolution(150);
		    
		    List<Image> images = renderer.render(document);
		    
		    for (int i = 0; i < images.size(); i++) {
                ImageIO.write((RenderedImage) images.get(i), "png", new File(filePath + (i + 1) + ".png"));
            }
		    
		}catch (Exception e) { 
	      System.out.println("ERROR: " + e.getMessage());
	  } finally{
	      IOUtils.closeQuietly(fos);
	  }
	}
}
