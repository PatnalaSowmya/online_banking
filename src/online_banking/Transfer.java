package online_banking;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.DriverManager;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/Transfer")
public class Transfer extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Transfer() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try{
			 Class.forName("com.mysql.jdbc.Driver");
			 Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/demo","root","");
			 Statement stmt =conn.createStatement();
		String ps ="select balance from transaction ORDER BY id DESC LIMIT 1";
				ResultSet rs1 = stmt.executeQuery(ps);
				int total;
		rs1.next();
		 int amount= rs1.getInt(1)-1000;
		String ps1 = "update bank SET balance = ' " + amount + " ' ORDER BY id DESC LIMIT 1";
		 total= stmt.executeUpdate(ps1);
         if(total>0)
			{
	  			response.setContentType("text/html");
				PrintWriter pw =response.getWriter();
				
				RequestDispatcher rd=request.getRequestDispatcher("details.jsp");
				rd.include(request, response);
			}
		}
		catch (Exception e) {
			e.printStackTrace();
		}

}
}

