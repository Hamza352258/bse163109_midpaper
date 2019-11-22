<%--
  Created by IntelliJ IDEA.
  User: hshar
  Date: 11/21/2019
  Time: 2:28 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link href="design.css" rel="stylesheet">
    <title>$Title$</title>
    <style>
        .button {
            background-color: deepskyblue;
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

<div class="topcontainer">
    <div class="topbar">
        <i class="fa fa-twitter logocenter" aria-hidden="true"></i>
    </div>

    <div class="AppContent wrapper wrapper-signup" id="page-container">
        <link rel="stylesheet" href="https://abs.twimg.com/a/1511833274/css/t1/t1_signup.bundle.css">
        <div class="page-canvas">
            <div class="signup-wrapper">
                <h1>
                    Sign Up
                </h1>

                <form action="registeration" method="post" >
                    <div class="t1-form signup " id="phx-signup-form">
                        <div class="textbox">

                            <div class="prompt name">
                                <div data-fieldname="name" class="field">

                                    <input type="text" placeholder="Name" name="fname" pattern="^[a-zA-Z]+" aria-required="true" maxlength="50"  class="" required>
                                </div>
                            </div>

                            <div class="prompt name">
                                <div data-fieldname="name" class="field">

                                    <input type="text" placeholder="Email" name="email"  pattern="^[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$" aria-required="true" maxlength="50"  class=""required>
                                </div>
                            </div>
                            <div class="prompt password">
                                <div data-fieldname="password" class="field">

                                    <input type="password" placeholder="Password" name="pass" aria-required="true" id="password" required>
                                </div>
                            </div>
                            <div class="prompt name">
                                    <input type="checkbox" required> I Accept Terms and Conditions<br>
                            </div>

                        </div>

                        <input type="submit" id="submit_button"  >
                    </div>
                </form>

                <form action="login.jsp" method="post">
                    <p>Already register </p>
                    <button type="submit" class="button" >Login</button>
                </form>
            </div>
        </div>
    </div>
</div>
</body>
</html>