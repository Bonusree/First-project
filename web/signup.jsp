
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Document</title>
        <style>
            img
            {
                z-index: -1;
                height: 150px;
                width: 215px;
                margin:30px 10px 30px 30px;
                padding: 50px 71px 10px 22px;

            }
            .card {
                margin: 0px 40px 40px 400px;
                height: 400px;
                width: 650px;
                padding: 40px 0px 0px 50px;
                background-color: white;
                justify-content: left;
            }

            .cardhaed {
                margin: 100px 0px 00px 210px;
                height: 10px;

                padding: 0px 0px 0px 150px;
                background-color:rgb(218, 218, 238);

            }


            .formbody {

                padding:  0px 50px 0px 40px;
                margin: 65px 8px 10px 25px;
                float: right;

            }
            
            .btn
            {
                margin-top: 10px;
                padding: 10px 10px;
            }

            .link {

                padding: 30px 144px 10px 144px;
                background-color: rgb(179, 179, 212);
                list-style-type: none;
                float: left;

            }
            .link2 {

                padding: 30px 144px 10px 144px;
                background-color:white;
                border-top: 3px solid rgb(63, 63, 168);
                ;
                list-style-type: none;
                float: left;

            }
            .msg
            {
                text-align: center;
                margin-top: 25px;
            }

        </style>
    </head>

    <body style="background-color: rgb(218, 218, 238);">
        <div class="cardhaed">
            <ul>
                <li class="link2" ><a href="signup.jsp" id="demo"  style="text-decoration: none;"><b>SIGN UP</b></a></li>
                <li class="link"><a href="signin.jsp" style="text-decoration: none;"><b>SIGN IN</b></a></li>
            </ul>

        </div>
        <div class="card">
             
            <c:if test="${requestScope.isNotValid==true}">
                <div style="color:red" class="msg">this email has used</div>
            </c:if>
            <img src="img/exam.jpg" alt=""/>
           
                <form action="signup" class="formbody" method="post">
                    <label for="fname">User Name:</label><br>
                        <input type="text" id="fname" name="name" required><br><br>
                        <label for="email">Email:</label><br>
                        <input type="email" id="email" name="email"required><br><br>
                        <label for="password">Password:</label><br>
                        <input type="password" id="pswd" name="password" required><br>
                        <label for="">Confirm Password:</label><br>
                        <input type="password" id="cpswd" name="confirmPassword" required><br>
                        <button class="btn" type="submit" onclick="checkPassword()" style="background-color:rgb(78, 78, 177); border: none; height: 30px; color: white">Submit</button>



                </form>
            <br><p style="text-align: center;">Are you new? <a href="signup.jsp">Sing Up</a></p>
           
        </div>
        
        <script>
            
                        function checkPassword(form) {
                            pw = form.password.value;
                            cpw = form.confirmPassword.value;
                            if (pw == "") {
                                alert("Fill the password field");
                                return false;
                            } else if (pw != cpw) {
                                alert("Confirm password doesn't match\n");
                                return false;
                            } else {
                                return true;
                            }
                        }
                    </script>
    </body>


</html>