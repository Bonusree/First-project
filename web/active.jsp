<%-- 
    Document   : afterlog
    Created on : Aug 7, 2022, 1:38:47 AM
    Author     : user
--%>
<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=, initial-scale=1.0">
        <title>Document</title>
        <style>
            img
            {
                width:80px;
                height:60px;
            }
            .navbar {

                height: 70px;
                width: 98%;
                justify-content: space-between;
                display: flex;
                padding: 0px 10px 0px 10px;
                background-color: rgb(203, 218, 230);
                border-radius: 5px;
                color: rgb(21, 21, 104);
            }
            .navbar .logo
            {
                margin: 5px 0px 0px -5px ;
                padding: 0px 0px 0px 0px ;
            }
            .navbar .instution-name {
                margin-right: 250px;
                margin-top: 5px;
            }

            .navbar .menu {
                margin-right: 250px;
                margin-top: 25px;

            }

            .navbar .menu a {
                margin: 10px;
                text-decoration: none;
                padding: 10px 10px;
                border-radius: 5px;
                background-color:rgb(170, 170, 219);
            }

            .navbar .dropdown {
                margin: 10px 5px 10px 5px;
                border-radius: 5px;
                padding: 15px 10px 10px 10px;
                background-color: rgb(170, 170, 219);


            }

            .navbar .dropdown .content {
                display: none;
                position: relative;
                border-top: 4px solid rgb(21, 21, 104);
                width: 130px;
                background-color:  rgb(255, 255, 255);
                box-shadow: 0px 8px 16px 8px rgba(108, 93, 175, 0.2);
                margin: 20px -5px 20px 3px;
                padding: 20px 10px;
                z-index: 1;
            }
            .navbar .dropdown .content button
            {
                margin: 10px 100px 0px 0px;

                width: 100%;
            }

            .navbar .dropdown:hover .content {

                display: block;
            }

            .modal{
                display: none;
                position: fixed;
                z-index: 1;
                left: 0;
                top: 0;
                height: 100%;
                width: 100%;
                overflow: auto;
                background-color: rgba(148, 143, 143, 0.5);
                animation-name: modalopen;
                animation-duration: 1s;
            }
            .modal-content{
                background-color: white;
                border-radius: 5px;
                display: block;
                margin: 8% auto;
                padding: 10px;
                padding-bottom: 40px;
                width: 25%;
                box-shadow: 0 0 19px 4px rgb(214, 211, 211);
                animation-name: modalcontetnopne;

                animation-duration: .5s;
                text-align: center;
            }
            .modal-content input{
                outline: 0;
                border: 0px;
                border-bottom: 1px solid rgb(202, 201, 201);
                background-color: transparent;
                height: 20px;
                width: 60%;
                margin: 15px 20%;
            }

            .closeBtn{
                color: rgb(177, 171, 171);
                float: right;
                font-size: 35px;
                font-weight: 700;
            }
            .closeBtn:hover{
                color: black;
                text-decoration: none;
                cursor: pointer;
            }
            @keyframes modalopen{
                from{
                    opacity: 0;
                }
                to{
                    opacity: 1;
                }
            }
            @keyframes modalcontentopne{
                from{
                    opacity: 0;
                    margin: 0% auto;
                }
                to{
                    opacity: 1;
                    margin: 5% auto;
                }
            }
            .card {
                margin: 100px 40px 40px 350px;
                height: 150px;
                width: 500px;
                padding: 10px 0px 0px 50px;
                background-color:rgb(170, 170, 219);

                color:rgb(59, 59, 138);
                border-radius: 6px;
                justify-content: left;
            }
            .a{

                margin:0px 3px 3px 5px;
                padding: 2px 0px 0px 0px;
                float: left;
            }
            .card input
            {
                border:none;
                border-bottom:1px solid rgb(44, 33, 112);
                outline: 0;
                background-color:rgb(170, 170, 219);
            }
            .b
            {
                margin:5px 0px 5px 0px;
                padding:2px 2px 3px 3px;
            }
            button.c{
                margin: 45px 25px 2px 20px;
                padding:10px 40px 10px 40px;
                background-color: rgb(66, 48, 184);
                color:white;
                border:none;
                border-radius: 5px;
                float: right;
            }


        </style>
    </head>

    <body>
        <div class="navbar">

            <div class="logo">
                <img src="img/comilla (2).jpg" alt=""/>
            </div>
            <div class="instution-name">
                <b>Computer Science and Engineering</b><br><br>
                <b>Online Examination</b>
            </div>
            <div class="menu">
                <a href="active.jsp">Active Exam</a>
                <a href="finished.jsp"> Finished Exam</a>
            </div>
            <div class="dropdown">
                <span><c:out value="${sessionScope.userName}"/></span>
                <div class="content">
                    <button id="modalBtn" >Create question</button>
                    <div id="simpleModal" class="modal">
                        <div class="modal-content">
                            <span class="closeBtn" id="closeBtn"  >&times;</span>
                            <h2>Question Information:</h2>
                            <form action="questioninformation" method="post" class="">
                                <input type="text" name="session_year" placeholder="Session">
                                <input type="text" required name="dept_name" placeholder="Department name">
                                <input type="text" required name="course_name" placeholder="Course Title">
                                <input type="text" required name="course_code" placeholder="Course Code">
                                <input type="datetime-local" required name="start_time" placeholder="Start time">
                                <input type="datetime-local" required name="end_time" placeholder="End time">
                                <input type="text" required name="number_of_question" placeholder="Number of Quetion">
                                <input type="password" required name="password" placeholder="Give Password">
                                <button type="submit" style="background-color:rgb(78, 78, 177); border: none; height: 30px; border-radius: 5px;">Submit</button>
                            </form>
                        </div>
                    </div>


                    <button id="loginModalBtn">Update question</button>
                    <div id="loginModal" class="modal">
                        <div class="modal-content">
                            <span class="closeBtn" >&times;</span>
                            <h2>Question Information:</h2>
                            <form action="questionUpdate" method="post">
                                <input type="text" required name="session_year" placeholder="Session">
                               
                                <input type="text" required name="course_code" placeholder="Course Code">
                                 <input type="password" required name="password" placeholder="Give Password">

                                <button type="submit" style="background-color:rgb(78, 78, 177); border: none; height: 30px; border-radius: 5px;">Submit</button>
                            </form>
                        </div>
                    </div>



                    <button >Logout</button>
                </div>
            </div>
        </div>

         <sql:setDataSource var = "snapshot" driver = "com.mysql.jdbc.Driver"
         url = "jdbc:mysql://localhost/oem"
         user = "root"  password = ""/>
 
      <sql:query dataSource = "${snapshot}" var = "result">
        SELECT * from `questioninformation` WHERE end_date>CURRENT_DATE or ( end_time>=CURRENT_TIME and end_date=CURRENT_DATE);
      </sql:query>

        <c:forEach  var = "row" items = "${result.rows}">
                <div class="card">
                     
                   <div class="a">
                       <form action="studentPasswordandID" method="post">
                          
                           <input type="hidden" name="session_year" value="${row.session_year}"/> 
                           <div class="b"><label name="session_year" > Session Year:<c:out value = "${row.session_year}"/><br></label></div>
                           <div class="b"><label name="course_name"> Course Title:<c:out value = "${row.course_name}"/><br></label></div>
                           <div class="b"><label name="course_code" >Course code:<c:out value = "${row.course_code}"/><br></label></div>
                           <div class="b"><label name="start_time"> Start Time:<c:out value = "${row.start_date}"/>,<c:out value = "${row.start_time}"/><br></label></div>
                           <div class="b"><label name="end_time" >End Time:<c:out value = "${row.end_date}"/>,<c:out value = "${row.end_time}"/><br></label></div>

                       

                   
                   
                        <button id="sModalBtn" class="c">PARTICIPATE</button>
                    </form>
                           </div>
                </div>
    </c:forEach>



    <script>
        var modal = document.getElementById("simpleModal");
        var loginModal = document.getElementById("loginModal");

        var modalBtn = document.getElementById("modalBtn");
        var loginModalBtn = document.getElementById("loginModalBtn");

        var closeBtn = document.getElementsByClassName("closeBtn")[0];
        var logcloseBtn = document.getElementsByClassName("logcloseBtn")[0];

        modalBtn.addEventListener('click', openModal);
        loginModalBtn.addEventListener('click', loginModalOpen);
        closeBtn.addEventListener('click', closeModal);
        logcloseBtn.addEventListener('click', logcloseModal);
        window.addEventListener('click', outsideClick);
        window.addEventListener('click', logoutsideClick);



        function loginModalOpen() {
            loginModal.style.display = "block";
        }

        function openModal() {
            // console.log("kaj kore ni");
            modal.style.display = "block";
        }

        function closeModal() {
            modal.style.display = "none";

        }
        function logcloseModal() {

            loginModal.style.display = "none";
        }

        function outsideClick(e) {
            if (e.target == modal) {
                modal.style.display = "none";

            }
        }
        function logoutsideClick(e) {
            if (e.target == loginModal) {
                loginModal.style.display = "none";

            }
        }
    </script>
</body>

</html>