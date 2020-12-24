package com.kitabghar.dao;

import com.kitabghar.entities.User;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserDao {

    private Connection conn;

    public UserDao(Connection conn) {
        this.conn = conn;
    }

    public boolean saveuser(User user) {
        boolean f = false;

        try {
            String query = "insert into user(name,email,password,college,gender,about) values(?,?,?,?,?,?)";
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setString(1, user.getName());
            ps.setString(2, user.getEmail());
            ps.setString(3, user.getPassword());
            ps.setString(4, user.getCollege());
            ps.setString(5, user.getGender());
            ps.setString(6, user.getAbout());
            ps.executeUpdate();
            f = true;

        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }

    public User getuserbyemailandpassword(String email, String password) {
        User user = null;
        try {
            String query = "select * from user where email=? and password=?";
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setString(1, email);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                user = new User();
                String name = rs.getString("name");
                user.setName(name);
                user.setId((rs.getInt("id")));
                user.setEmail(rs.getString("email"));
                user.setPassword(rs.getString("password"));
                user.setCollege(rs.getString("college"));
                user.setGender(rs.getString("gender"));
                user.setAbout(rs.getString("about"));
                user.setProfile(rs.getString("profile"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return user;
    }

    public boolean updateUser(User user) {

        boolean f = false;
        try {
            

            String query = "update user set name=? , email=? , password=? , gender=? ,about=? , profile=? where  id =?";
           
            PreparedStatement p = conn.prepareStatement(query);
            p.setString(1, user.getName());
            p.setString(2, user.getEmail());
            p.setString(3, user.getPassword());
            p.setString(4, user.getGender());
            p.setString(5, user.getAbout());
            p.setString(6, user.getProfile());
            p.setInt(7, user.getId());
            

            p.executeUpdate();
            f = true;

        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }
    
     public User getUserByUserId(int userId) {
        User user = null;
        try {
            String q = "select * from user where id=?";
            PreparedStatement ps = this.conn.prepareStatement(q);
            ps.setInt(1, userId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                user = new User();
                String name = rs.getString("name");
                user.setName(name);
                user.setId((rs.getInt("id")));
                user.setEmail(rs.getString("email"));
                user.setPassword(rs.getString("password"));
                user.setCollege(rs.getString("college"));
                user.setGender(rs.getString("gender"));
                user.setAbout(rs.getString("about"));
                user.setProfile(rs.getString("profile"));
                

             
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return user;
    }

}
