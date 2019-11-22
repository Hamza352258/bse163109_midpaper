<%--
  Created by IntelliJ IDEA.
  User: hshar
  Date: 11/21/2019
  Time: 2:29 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page import="extra.jobdata"%>
<%@page import="extra.DbConnection"%>
<%@page import="java.util.ArrayList"%>
<%@ page import="java.io.PrintWriter" %>



<html>
<head>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">

    <link href="design.css" rel="stylesheet">
    <title>$Title$</title>
    <style>
        form {
            display: inline-block;
         align:left;
        }
        .button {
            background-color: dodgerblue;
            border: 1px;
            color: white;
            padding: 10px 24px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 16px;
            margin: 4px 2px;
            cursor: pointer;
        }
    </style>
</head>
<body class="segoe">;
<%
    String email = null;
    HttpSession session1 = request.getSession(false);
    if (session1!=null){
        if(session1.getAttribute("email")!=null){
            email = (String)session1.getAttribute("email");
        }else
            response.sendRedirect("login.jsp");
    }

%>
<%
    ArrayList<jobdata> NA=new ArrayList<jobdata>();
    DbConnection db= new DbConnection();

    NA=db.getjob();

%>


<div class="topcontainer">

    <div class="topbar">
        <i class="fa fa-twitter logocenter" aria-hidden="true"> <h3 align="left"><%out.println("User Email:"+email); %></h3></i>

            <form action="postjob.jsp" method="post">
                <button type="submit" class ="button" value="Logout">New Job</button>
            </form>
        <form action="logout" method="post">
            <button type="submit" class = "button" value="Logout">Logout</button>
        </form>
    <br>
        <br>
    </div>


    <div class="AppContent wrapper wrapper-signup" id="page-container">







        </tr>
        <link rel="stylesheet" href="https://abs.twimg.com/a/1511833274/css/t1/t1_signup.bundle.css">
        <div class="page-canvas" align="center;">

            <div>


                <%for(jobdata t:NA){%>
                <div class="card text-white bg-primary mb-3" style="max-width: 45rem; margin-left:100px;">
                    <div class="card-header" ><pre> <% out.println(t.getTitle()+"                   "+t.getTime()+"   "+t.getDate()); %></pre></div>
                    <div class="card-header" ><pre> <% out.println("Job Type:"+t.getJobtype()+"     City:"+t.getJobcity()); %></pre></div>
                    <div class="card-body" style="background-color:#00BFFF;height:15rem;">
                        <p class="card-text"> <% out.println("  "+t.getDescription()); %>></p>
                    </div>
                </div>
                <hr>
                <hr>
                <% }%>




            </div>

        </div>
    </div>
</div>
</body>
</html>