//package bitcamp.java87.project01.web;
//
//import java.io.BufferedInputStream;
//import java.io.FileInputStream;
//import java.io.IOException;
//import java.io.OutputStream;
//
//import javax.servlet.ServletException;
//import javax.servlet.annotation.WebServlet;
//import javax.servlet.http.HttpServlet;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//
//@WebServlet("/test/download")
//public class FileDownloadServlet extends HttpServlet {
//	private static final long serialVersionUID = 1L;
//
//	@Override
//	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//		resp.setContentType("application/image");
//		OutputStream out = resp.getOutputStream();
//		
//		BufferedInputStream fileIn = new BufferedInputStream(new FileInputStream("c:/bitshare/aaa/1.png"));
//		
//		int b = 0;
//		while ((b = fileIn.read()) != -1) {
//			out.write(b);
//		}
//		
//		fileIn.close();
//		out.flush();
//	}
//
//}
