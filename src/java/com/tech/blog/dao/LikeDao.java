package com.tech.blog.dao;

import java.sql.*;

public class LikeDao {

    Connection con;

    public LikeDao(Connection con) {
        this.con = con;
    }

    public boolean insertLike(int pId, int uId) {
        boolean f = false;
        try {
            String q = "insert into Liked(pId,uId) values(?,?)";
            PreparedStatement p = this.con.prepareStatement(q);
//           values..
            p.setInt(1, pId);
            p.setInt(2, uId);
            p.executeUpdate();
            f = true;

        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }

    public int countLikeOnPost(int pId) {
        int count = 0;
        String q = "select count(*) from Liked where pId=?";
        try {
            PreparedStatement p = this.con.prepareStatement(q);
            p.setInt(1, pId);
            ResultSet set = p.executeQuery();
            if (set.next()) {
                count = set.getInt("count(*)");

            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return count;
    }

    public boolean isLikedByUser(int pId, int uId) {
        boolean f = false;
        try {
            PreparedStatement p = this.con.prepareStatement("select * from Liked where pId=? and uId=?");
            p.setInt(1, pId);
            p.setInt(2, uId);
            ResultSet set = p.executeQuery();
            if (set.next()) {
                f = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return f;

    }

    public boolean deleteLike(int pId, int uId) {
        boolean f = false;
        try {
            PreparedStatement p = this.con.prepareStatement("delete from Liked where pId=? and uId=?");
            p.setInt(1, pId);
            p.setInt(2, uId);
            p.executeUpdate();
            f = true;
        } catch (Exception e) {
            e.printStackTrace();
        }

        return f;
    }

}
