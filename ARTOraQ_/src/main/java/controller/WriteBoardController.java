package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.face.BoardService;
import service.impl.BoardServiceImpl;



@WebServlet("/write")
public class WriteBoardController extends HttpServlet {
   private static final long serialVersionUID = 1L;

   //서비스 객체
   private BoardService boardService = new BoardServiceImpl(); 
   
   @Override
   protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
      
      req.getRequestDispatcher("/WEB-INF/views/page1/write.jsp").forward(req, resp);
      
   }
   
   @Override
   protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
	   
      //작성글 삽입
	   boardService.write(req);

      //목록으로 리다이렉트
     resp.sendRedirect("/infoBoard");
      
   }
   
}
