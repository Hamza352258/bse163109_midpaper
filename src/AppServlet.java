import extra.DbConnection;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;

@WebServlet(name = "AppServlet")
public class AppServlet extends HttpServlet {

    DbConnection db= new DbConnection();
    String name;
    String email;
    String password;

    String date;
    String time;
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
boolean check=false;
        if (request.getParameter("action1") != null) {
            System.out.println("ac1");
            email = request.getParameter("email");
            password = request.getParameter("pass");
            check=db.checklogin(email,password);
            if (check==false||email.isEmpty()||password.isEmpty()) {

                RequestDispatcher rd = getServletContext().getRequestDispatcher("/login.jsp");
                PrintWriter out = response.getWriter();
                out.write("<p style='color:red;'>Invalid Username or Password</p>");
                rd.include(request, response);
            } else {
                HttpSession session = request.getSession();
                session.setAttribute("email", email);
                session.setMaxInactiveInterval(30 * 60);
                response.sendRedirect("jobs.jsp");
            }
        }
        else if(request.getParameter("action2") != null){


                    boolean chek;
                    Date dd=new Date();
                    Date d=new Date();
                    SimpleDateFormat s=new SimpleDateFormat("hh:mm:ss");
                    SimpleDateFormat p=new SimpleDateFormat("dd:MM:yyyy");
                    String title=request.getParameter("title");
                  String  description = request.getParameter("desc");
                    String type=request.getParameter("type");
                    String  city = request.getParameter("city");

                    chek=  db.insertjob(title,description,type,city,s.format(d),p.format(dd));

                    response.sendRedirect("jobs.jsp");

            System.out.println("ac2");



        }
    }

    }

