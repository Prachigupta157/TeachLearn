<%@page import="com.tech.blog.entities.User"%>
<%@page import="com.tech.blog.dao.LikeDao"%>
<%@page import="com.tech.blog.entities.Post"%>
<%@page import="java.util.List"%>
<%@page import="com.tech.blog.dao.PostDao"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>


<div class="row">

    <%
        
        User uuu=(User)session.getAttribute("currentUser");
//        Thread.sleep(1000);
        PostDao d = new PostDao(ConnectionProvider.getConnection());

        int cid = Integer.parseInt(request.getParameter("cid"));
       //int userId =Integer.parseInt(request.getParameter("currentUser"));
        List<Post> posts = null;
        if (cid == 0) {
            posts = d.getAllPost();
        } else {
            posts = d.getPostByCatId(cid);
        }
         if(posts.size()==0){
             out.println("<h3 class='display-3 text-center'>No Post available in this category</h3>");
             return;
         }
        for (Post p : posts) {
    %>

    <div class="col-md-6 mt-2">
        <div class="card">
            <img class="card-img-top" src="blog_pics/<%= p.getpPic()%>" >

            <div class="card-body">
                <b><%= p.getpTitle()%></b>
                <br>
                <p><%=p.getpSubContent()%></p>
               

            </div>
        </div>
                <div class="card-footer primary-background text-center">
                    <% 
                    LikeDao ld= new LikeDao(ConnectionProvider.getConnection());
                    
                    %>
                   
                    <a href="#!"   onclick="doLike(<%= p.getPid()%>,<%= uuu.getUserId()%>)" class="btn btn-outline-light btn-sm text-left"><i class="fa fa-thumbs-o-up"></i><span class="like-counter"><%= ld.countLikeOnPost(p.getPid())%></span></a>
                    
                    <a href="show_blog_page.jsp?post_id=<%= p.getPid()%>" class="btn btn-outline-light btn-sm ">Read More..</a>
                  
                </div>


    </div>


    <%
        }


    %>
</div>