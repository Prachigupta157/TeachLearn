<%@page import="com.tech.blog.helper.ConnectionProvider"%>

<%@page import="com.tech.blog.entities.Message"%>
<%@page import="com.tech.blog.entities.User" %>
<%@page errorPage="error.jsp" %>
<%
    User user = (User) session.getAttribute("currentUser");
    if (user == null) {
        response.sendRedirect("login_page.jsp");

    }
    
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Contact</title>
        <!--css-->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="css/mystyle.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

        <style>
            .banner-background{

                clip-path: polygon(50% 0%, 100% 0, 100% 35%, 100% 99%, 80% 90%, 50% 100%, 27% 90%, 0 100%, 0% 35%, 0 0);
            }
            
        </style>
    </head>
    <body >
         <%@include file="normal_navbar.jsp" %>
         <form class="  form-control col-md-6 mt-2">
       
        <div class="card banner-background text-center">
            <h3 class="primary-background">Provide the information here... </h3>

            <div class="card-body">
                <input type="email" class="form-control" name="user_email" value="email">  
                <textarea rows="3" class="form-contrl" name="user_problem" value="problem">write your problem...</textarea> 

            </div>
        </div>
                <div class="card-footer primary-background text-center">
                   
                   <div class="container text-center">
                       <a href="index.jsp" class="btn btn-outline-light btn-sm ">Submit</a>
                            </div>
                    
                </div>


             </form>
    </body>
</html>
