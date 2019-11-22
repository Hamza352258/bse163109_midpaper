import extra.DbConnection;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;

@WebServlet(name = "RegistrationServlet")
public class RegistrationServlet extends HttpServlet {
    String name;
    String email;
    String password;

    DbConnection db=new DbConnection();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        boolean flag=true;
        System.out.println(" In servlet!");
        name = request.getParameter("fname");
        email = request.getParameter("email");
        password=request.getParameter("pass");
        System.out.println(name);

flag=db.insertRegis(name,email,password);

        PrintWriter out = response.getWriter();
        if(flag) {

            response.sendRedirect("login.jsp");
        }
        else{
            out.write("Record not save succesfully");
        }

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
