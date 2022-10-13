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
        <title>Edit Question</title>
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
           height: 140px;
           padding: 20px 20px;
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
            margin: 50px 00px 50px 500px ;
            padding: 15px 135px 25px 100px;
            text-align: center;
            width: 100px;
           background-color:rgb(104, 104, 231);
           border: none; height: 30px;
           border-radius: 5px;
        }
        .btn:hover
        {
            background-color:rgb(90,90,140) ;
            color:white;
        }
            <%@include file="css/form.css"%>
        </style>
    </head>
    <body>
        <%@include  file="navbar.jsp" %>
        <h1 style="background-color: rgb(200, 197, 214); width:50%; margin-top:50px;text-align:center;color: rgb(97, 97, 148) ;">Set your Quetion Here ... ... ...</h1>
    <form action="queform" method="post">
        <input type="hidden" name="isUpdate" value="true"/>
        <c:forEach var="i" begin="1" end="${requestScope.number_of_question}" step="1">
            <table class="tbl">
                <tr>
                    <th class="table_head">
                        <h3 style="color: rgb(97, 97, 148)  ;">Question ${i}:</h3>
                    </th>
                    <th class="table_head" style="color:rgb(97,97,148)">Option :</th>
                </tr>
                <tr>
                    <td rowspan="6"><textarea class="table_que" required name="question_${i}" type="text">${requestScope.question[i]}</textarea></td>
                </tr>
                
            
                <tr>
                    <td><input type="text"  class="table_option" required name="question_${i}_1" value="${requestScope.option[i][1]}"/> </td>
                </tr>
                <tr>
                    <td><input type="text" class="table_option" required name="question_${i}_2" value="${requestScope.option[i][2]}" /> </td>
                </tr>
                <tr>
                    <td><input type="text" class="table_option" required name="question_${i}_3" value="${requestScope.option[i][3]}" /> </td>
                </tr>
                <tr>
                    <td><input type="text" class="table_option" required name="question_${i}_4" value="${requestScope.option[i][4]}" /> </td>
                </tr>
                <tr>
                    <td><input type="text" class="table_option" required name="question_${i}_r" value="${requestScope.option[i][5]}" /> </td>
                </tr>
           
            </table>
        </c:forEach>

       <button type="submit" class="btn">Submit</button>
    </form>
    </body>
</html>
