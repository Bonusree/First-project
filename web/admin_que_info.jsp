<%-- 
    Document   : questionFrom
    Created on : Aug 12, 2022, 1:25:56 AM
    Author     : USER
--%>

<%--<%@page contentType="text/html" pageEncoding="UTF-8"%>--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Question Form</title>
        <style>
          .tbl {
            width: 100%;
            margin: 0px auto;
            border: none;
            margin: 50px;
        }
        .table_head
        {
            text-align: left;
        }

        .table_que
        {
           width: 450px;
           padding: 100px 100px;
           background-color: rgb(203, 218, 230);
           border-bottom: 3px solid rgb(41, 41, 117);
           color: rgb(51, 51, 177);
           border-radius: 10px;
           
        }
        .table_option
        {
            width: 450px;
            height: 30px;
            background-color:  rgb(203, 218, 230);
            border-bottom: 3px solid rgb(41, 41, 117) ;
            border-top: none;
            border-left: none;
            border-right: none;
            outline:0;
            color: rgb(51, 51, 177);
            

        }
        .table_option:hover{
            color:rgb(51, 51, 177);
        }

        /* button {
            padding: 10px;
            width: 120px;
            background-color: #818181;
            border-color: #818181;
            border-radius: 5px;
            color: white;
        } */

        

        .btn {
            margin: 50px 350px;
            padding: 15px 310px;
            text-align: center;
            width: 4%;
            color: rgb(100, 133, 161);
            border: none;
            border-radius: 10px;
            background-color: rgb(78, 78, 177);
            color:white;
        }
        .btn:hover
        {
            background-color: rgb(13, 13, 73);
            color:white;
        }
            <%@include file="css/form.css"%>
        </style>
    </head>
    <body>
        <%@include  file="navbar.jsp" %>
        <h1 style="background-color:rgb(200, 197, 214);color: rgb(97, 97, 148) ;text-align:center">Set your Quetion Here ... ... ...</h1>
    <form action="queform" method="post">
        <c:forEach var="i" begin="1" end="${sessionscope.number_of_que}" step="1">
            <table class="tbl">
                <tr>
                    <th class="table_head">
                        <h3 style="color: rgb(97, 97, 148)  ;">Question ${i}:</h3>
                    </th>
                    <th class="table_head" style="color:rgb(97,97,148)">Option :</th>
                </tr>
                <tr>
                    <td rowspan="6"><textarea class="table_que" required name="question_${i}" type="text"
                            placeholder="Write here your question"></textarea></td>
                </tr>
                
            
                <tr>
                    <td><input type="text"  class="table_option" required name="question_${i}_1" placeholder="Option A" /> </td>
                </tr>
                <tr>
                    <td><input type="text" class="table_option" required name="question_${i}_2" placeholder="Option B" /> </td>
                </tr>
                <tr>
                    <td><input type="text" class="table_option" required name="question_${i}_3" placeholder="Option C" /> </td>
                </tr>
                <tr>
                    <td><input type="text" class="table_option" required name="question_${i}_4" placeholder="Option D" /> </td>
                </tr>
                <tr>
                    <td><input type="text" class="table_option" required name="question_${i}_r" placeholder="Correct Option" /> </td>
                </tr>
           
            </table>
        </c:forEach>

       <button class="btn"  type="submit">submit</button>
    </form>
    </body>
</html>
