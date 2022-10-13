<%-- 
    Document   : index
    Created on : Aug 8, 2022, 10:06:34 PM
    Author     : user
--%>


<%@page import="com.sevlets.ConnectionProvider"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>

        <!<!-- css -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

        <link herf="css/mystyle.css" rel="stylesheet" type="text/css"/>

        <!-- Compiled and minified CSS -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">

        <!-- Compiled and minified JavaScript -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>

        <style>
            img {
                display: block;
                margin-left: auto;
                margin-right: auto;
            }
            .card{
                margin:30px 0px 0px 165px;
                padding: 50px 50px;
                width: 60%;
                border: 3px solid #73AD21;
               
            }
        </style>





    </head>
    <body>
        <%
            Connection con = ConnectionProvider.getConnection();

        %> 
        <div class="container" >
            
                    <div class="card" style="center">
                        <img src="img/comilla (2).jpg" alt=""/>
                        <div class="card-body" >
                            <h5 class="card-title fw-bol" style="text-align:center;"><b>Comilla University</b></h5>
                            <h6 class="card-subtitle mb-2 text-muted" style="text-align:center;"><b>Online Examination Management</b></h6>
                            <p style="text-align:center"><a href="signup.jsp" class="btn btn-primary" style="text-align:center;" >Get Started</a></p>
                            
                        </div>
                    </div>        
               
        </div>





        <!<!-- js -->
        <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    </body>
</html>
