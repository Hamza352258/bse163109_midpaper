<%--
  Created by IntelliJ IDEA.
  User: hshar
  Date: 11/21/2019
  Time: 2:29 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link href="design.css" rel="stylesheet">
    <title>$Title$</title>
    <style>
        .button {
            background-color: dodgerblue;
            border: none;
            color: white;
            padding: 15px 32px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 16px;
            margin: 4px 2px;
            cursor: pointer;
        }
    </style>
</head>

<body class="segoe">
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
        <link rel="stylesheet" href="https://abs.twimg.com/a/1511833274/css/t1/t1_signup.bundle.css">
        <div class="page-canvas">
            <div class="signup-wrapper">
                <h1>
                    Welcome to Jobs
                </h1>

                <div class="t1-form signup " id="phx-signup-form">
                    <div class="textbox">

                        <h1>Enter Job</h1>

                        <form action="loginS" method="post">
                            <div class="prompt name">
                                <div data-fieldname="name" class="field">

                                    <input type="text" placeholder="Title" name="title" aria-required="true" maxlength="50"  class="" required>
                                </div>
                            </div>
                            <div>
                                <textarea type="text" name="desc" required></textarea>
                            </div>
                            <div class="prompt name">
                                <br data-fieldname="name" class="field">
                                    <label>Job Type:</label></br>
                                    <input type="radio" name="type" value="PartTime">PartTime<br>
                                    <input type="radio" name="type" value="FullTime">FullTime<br>
                                </div>

                            <div class="prompt name">
                                <div data-fieldname="name" class="field">
                                    <fieldset>
                                        <label >Job City:</label>
                                        <select id="job" name="city">
                                            <option value="Islamabad" >Islamabad</option>
                                            <option value="Karachi">Karachi</option>
                                            <option value="Lahore">Lahore</option>
                                            <option value="Rawalpindi">Rawalpindi</option>
                                        </select>
                                    </fieldset>
                                </div>
                            </div>
                            <input type="submit" class="button" name="action2" value="Post Job">
                        </form>

                    </div>

                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
