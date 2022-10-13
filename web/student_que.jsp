<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%@page import="com.entities.user"%>
<%@page import="com.sevlets.signup"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <style>
        .a {
            background-color: rgb(200, 197, 214);
            color: rgb(58, 44, 121);
            text-align: center;
        }
        button.c{
            margin: 45px 30px 2px 120px;
            padding:10px 40px 10px 40px;
            background-color: rgb(66, 48, 184);
            color:white;
            border:none;
            border-radius: 5px;
          }
          <%@include file="form.css" %>
          
    </style>
</head>

<body>
    <%@include file="navbar.jsp" %>
    <h1 class="a">*** Read Carefully and try to give CORRECT answer***</h1>
    <form action="" method="">
        <c:forEach var="i" begin="1" end="${requestScope.number_of_question}" step="1">
            <h3  style="color: blue;">Question ${i}:</h3>
            <p >${requestScope.question[i]}</p>
            <input type="radio" name="option1" value="${requestScope.option[i][1]}">
            <label for="option1" >${requestScope.option[i][1]}</label><br>
            <input type="radio" name="option2" value="${requestscope.option[i][2]}">
            <label for="option2" >${requestscope.option[i][2]}</label><br>
            <input type="radio" name="option3" value="${requestscope.option[i][3]}">
            <label for="option3" >${requestscope.option[i][3]}</label><br>
            <input type="radio" name="option4" value="${requestscope.option[i][4]}">
            <label for="option4" >${requestscope.option[i][4]}</label><br>
        </c:forEach>
        <button class="c">Submit</button> 
    </form>
</body>


</html>