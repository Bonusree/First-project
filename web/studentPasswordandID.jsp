<%-- 
    Document   : studentPasswordandID
    Created on : Aug 25, 2022, 3:36:29 PM
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
                width: 200px;
                margin:0px 0px 0px 0px;
                padding: 20px 25px 10px 22px;

            }
            .card {
                margin: 200px 40px 0px 400px;
                height: 200px;
                width: 550px;
                padding: 15px 0px 0px 30px;
                background-color: white;
                justify-content: left;
                
                border: 15px solid rgb(169, 159, 230);;
            }


            .formbody {

                padding:  0px 50px 0px 30px;
                margin: 15px 8px 10px 25px;
                float: right;

            }
            
            .btn
            {
                margin-top: 10px;
                padding: 10px 10px;
            }

            
        </style>
    </head>

    <body style="background-color: rgb(218, 218, 238);">
       
        <div class="card">
            <img src="img/exam.jpg" alt=""/>
           
                <form action="signup" class="formbody" method="post">
                    <label for="roll">Registration No:</label><br>
                    <input type="text" id="roll" name="roll"required><br><br>
                   
                    <label for="password">Password:</label><br>
                    <input type="password" name="password" required><br><br>
                   
                    <button class="btn" type="submit" style="background-color:rgb(78, 78, 177); border: none; height: 30px;color: white">Submit</button>


                </form>
          
           
        </div>
    </body>


</html>