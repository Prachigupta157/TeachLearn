/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tech.blog.dao;

import com.tech.blog.entities.Category;
import com.tech.blog.entities.Post;
import com.tech.blog.entities.User;
import java.sql.*;
import java.util.ArrayList;
import static java.util.Collections.list;
import java.util.List;

/**
 *
 * @author prachi
 */
public class PostDao {

    Connection con;

    public PostDao(Connection con) {
        this.con = con;
    }

    public ArrayList<Category> getAllCategories() {
        ArrayList<Category> list = new ArrayList<>();
        try {
            String q = "select *from Categories";
            Statement st = this.con.createStatement();
            ResultSet set = st.executeQuery(q);
            while (set.next()) {
                int cid = set.getInt("cid");
                String name = set.getString("name");
                String description = set.getString("description");
                Category c = new Category(cid, name, description);
                list.add(c);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
   
    public boolean savePost(Post p) {
        boolean f = false;
        try {
            String q = "insert into Post(pTitle,pSubContent,pContent,pCode,pPic,catId,userId) values(?,?,?,?,?,?,?)";
            PreparedStatement pstmt = con.prepareStatement(q);
            pstmt.setString(1, p.getpTitle());
            pstmt.setString(2, p.getpSubContent());
            pstmt.setString(3, p.getpContent());
            pstmt.setString(4, p.getpCode());
            pstmt.setString(5, p.getpPic());
            pstmt.setInt(6, p.getCatId());
            pstmt.setInt(7, p.getUserId());
            pstmt.executeUpdate();
            f = true;

        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }

    public List<Post> getAllPost() {
        List<Post> list = new ArrayList<>();
//  fetch all the post

        try {
            PreparedStatement p = con.prepareCall("select * from Post order by pId desc");
            ResultSet set = p.executeQuery();
            while (set.next()) {
                int pid = set.getInt("pId");
                String pTitle = set.getString("pTitle");
                String pSubContent=set.getString("pSubContent");
                String pContent = set.getString("pContent");
                String pCode = set.getString("pCode");
                String pPic = set.getString("pPic");
                Timestamp date = set.getTimestamp("pDate");
                int catId = set.getInt("catId");
                int userId = set.getInt("userId");
                Post post = new Post(pid, pTitle, pSubContent, pContent, pCode, pPic, date, catId, userId);
                list.add(post);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;

    }

public List<Post> getAllPostByUserId(int userId) {
        List<Post> list = new ArrayList<>();
//  fetch all the post

        try {
            PreparedStatement p = con.prepareCall("select * from Post where userId=?");
            p.setInt(1, userId);
            ResultSet set = p.executeQuery();
            while (set.next()) {
                int pid = set.getInt("pId");
                String pTitle = set.getString("pTitle");
                String pSubContent=set.getString("pSubContent");
                String pContent = set.getString("pContent");
                String pCode = set.getString("pCode");
                String pPic = set.getString("pPic");
                Timestamp date = set.getTimestamp("pDate");
                int catId = set.getInt("catId");
               
                Post post = new Post(pid, pTitle, pSubContent, pContent, pCode, pPic, date, catId, userId);
                list.add(post);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;

    }
    public List<Post> getPostByCatId(int catId) {
        List<Post> list = new ArrayList<>();
//    fetch post by  selected id
        try {
            PreparedStatement p = con.prepareCall("select * from Post where catId=?");
            p.setInt(1, catId);
            ResultSet set = p.executeQuery();
            while (set.next()) {
                int pid = set.getInt("pId");
                String pTitle = set.getString("pTitle");
                String pSubContent=set.getString("pSubContent");
                String pContent = set.getString("pContent");
                String pCode = set.getString("pCode");
                String pPic = set.getString("pPic");
                Timestamp date = set.getTimestamp("pDate");

                int userId = set.getInt("userId");
                Post post = new Post(pid, pTitle,pSubContent, pContent, pCode, pPic, date, catId, userId);
                list.add(post);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
public List<Post> getPostByCatIdAndUserId(int catId , int userId) {
        List<Post> list = new ArrayList<>();
//    fetch post by  selected id
        try {
            PreparedStatement p = con.prepareCall("select * from Post where catId=? and userId=?");
            p.setInt(1, catId);
            p.setInt(2, userId);
            ResultSet set = p.executeQuery();
            while (set.next()) {
                int pid = set.getInt("pId");
                String pTitle = set.getString("pTitle");
                String pSubContent=set.getString("pSubContent");
                String pContent = set.getString("pContent");
                String pCode = set.getString("pCode");
                String pPic = set.getString("pPic");
                Timestamp date = set.getTimestamp("pDate");

              
                Post post = new Post(pid, pTitle,pSubContent, pContent, pCode, pPic, date, catId, userId);
                list.add(post);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
    public Post getPostByPostId(int postId) {
        Post post = null;
        String q = "select * from Post where pid=?";
        try {
            PreparedStatement p = this.con.prepareStatement(q);
            p.setInt(1, postId);
            ResultSet set = p.executeQuery();
            if (set.next()) {
                int pid = set.getInt("pId");
                String pTitle = set.getString("pTitle");
                String pSubContent=set.getString("pSubContent");
                String pContent = set.getString("pContent");
                String pCode = set.getString("pCode");
                String pPic = set.getString("pPic");
                Timestamp date = set.getTimestamp("pDate");
                int catId = set.getInt("catId");
                int userId = set.getInt("userId");
                post = new Post(pid, pTitle, pSubContent, pContent, pCode, pPic, date, catId, userId);

            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return post;
    }
}
