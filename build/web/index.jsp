

<%@page import="com.tech.blog.entities.Category"%>
<%@page import="com.tech.blog.dao.LikeDao"%>
<%@page import="java.util.List"%>
<%@page import="com.tech.blog.entities.Post"%>
<%@page import="com.tech.blog.dao.PostDao"%>
<%@page import="com.tech.blog.entities.User"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tech Blog</title>
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
    <body>

        <!--navbar-->
        <%@include file="normal_navbar.jsp" %>


        <!--banner-->

        <div class="container-fluid p-0 m-0 banner-background">

            <div class="jumbotron primary-background text-white">
                <div class="container">
                    <h3 class="display-3">Welcome to TechBlog</h3>
                    <h3>Tech Blog</h3>
                    <p>Welcome to technical vlog, world of technology
                        A programming language is a formal language comprising a set of strings that produce
                        various kinds of machine code output. Programming languages are one kind of computer language,
                        and are used in computer programming to implement algorithms.
                    </p>
                    <p>Most programming languages consist of instructions for computers. There are programmable
                        machines that use a set of specific instructions, rather than general programming languages. 
                        Since the early 1800s, programs have been used to direct the behavior of machines such as Jacquard looms, 
                        music boxes and player pianos.[1] The programs for these machines (such as a player piano's scrolls) 
                        did not produce different behavior in response to different inputs or conditions.
                        Procedural Oriented Programming (POP) language is derived from structured programming and based upon the procedure call concept. It divides a program into small procedures called routines or functions.

                        Procedural Oriented programming language is used by a software programmer to create a program that can be accomplished by using a programming editor like IDE, Adobe Dreamweaver, or Microsoft Visual Studio.

                        The advantage of POP language is that it helps programmers to easily track the program flow and code can be reused in different parts of the program.
                    </p>
<!--                    <button class="btn btn-outline-light btn-lg"><span class="fa fa-user-plus"></span>Start! its Free</button>
                    <a  href="login_page.jsp"class="btn btn-outline-light btn-lg"><span class="fa fa-user-circle fa-spin"></span>Login</a>
               -->
                </div>
            </div>



        </div>
        <!--cards-->

        <div class="container">
            <div class="row mb-2">
                <%

                    User uuu = (User) session.getAttribute("currentUser");
                    //        Thread.sleep(1000);
                    PostDao d = new PostDao(ConnectionProvider.getConnection());

                    List<Post> posts = null;

                    posts = d.getAllPost();

                    for (Post p : posts) {
                %>


                <div class="col-md-6 mt-4">
                    <div class="card">
                        <img class="card-img-top" src="blog_pics/<%= p.getpPic()%>" >
                        <h4 class="post-title text-center"><%= p.getpTitle()%></h4>
                        <div class="card-body">

                            
                            <p><%= p.getpSubContent()%></p>



                        </div>
                    </div>
                    <div class="card-footer primary-background text-center">
                        <a href="show_blog_page.jsp?post_id=<%= p.getPid()%>" class="btn btn-outline-light btn-sm ">Read More..</a>

                    </div>


                </div>
                <%
                    }


                %>

            </div>


        </div>


        <!--javascript-->
        <script
            src="https://code.jquery.com/jquery-3.6.0.min.js"
            integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
        crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

    </body>
</html>
