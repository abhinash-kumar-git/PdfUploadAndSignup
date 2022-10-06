package www.servlet.com;



import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 * Servlet implementation class Register
 */

@WebServlet("/Register")
@MultipartConfig
public class Register extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Register() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		PrintWriter out= response.getWriter();

		response.setContentType("text/html;charset=UTF-8");
		out.println("<!DOCTYPE html>");
		out.println("<html>");
		out.println("<head>");
		out.println("<title>Register servlet</title>");
		out.println("</head>");
		out.println("<body>");
		String name=request.getParameter("username");
		String email=request.getParameter("user_email");
		String password=request.getParameter("user_password");
		Part p=request.getPart("image");
		String image=p.getSubmittedFileName();
		System.out.println(image);
		
		
		try {
			Thread.sleep(3000);
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/spring_jdbc","root","root");
			String g="insert into signup(name,email,password,image) values(?,?,?,?)";
			PreparedStatement pas=con.prepareStatement(g);
		 
			pas.setString(1,name);
			pas.setString(2,email);
			pas.setString(3,password);
			pas.setString(4, image);
			 int h=pas.executeUpdate();
			 InputStream is=p.getInputStream();
			 byte[]data=new byte[is.available()];
			 is.read();
			 String path=request.getRealPath("/")+"image"+File.separator+image;
			 System.out.println(path);
			 FileOutputStream fos= new FileOutputStream(path);
			 fos.write(data);
			 fos.close(); 
			 System.out.println(h);
			out.println("done......................");
		}catch(Exception e) {
			e.printStackTrace();
			System.out.println(e.getLocalizedMessage());
		}
		
		out.println("</body>");
		out.println("</html>");
	}

}
