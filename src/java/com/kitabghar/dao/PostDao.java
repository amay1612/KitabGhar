/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.kitabghar.dao;

import com.kitabghar.entities.Category;
import com.kitabghar.entities.Post;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class PostDao {

    Connection con;

    public PostDao(Connection con) 
    {
        this.con = con;
    }
    
     public ArrayList<Category> getAllCategories() 
     {
        ArrayList<Category> list = new ArrayList<>();

        try {
 
            String q = "select * from categories";
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
     
     public boolean savePost(Post p)
             
             
     {
         boolean f=false;
         try 
         {
             String q="insert into posts(bookName,contact,bookPrice,bookPic,address,author,catId,userid) values (?,?,?,?,?,?,?,?)";
             PreparedStatement pst=con.prepareStatement(q);
             pst.setString(1,p.getBookName());
             pst.setString(2,p.getContact());
             pst.setInt(3,p.getBookPrice());
             pst.setString(4, p.getBookPic());
             pst.setString(5, p.getAddress());
             pst.setString(6,p.getAuthor());
             pst.setInt(7,p.getCatId());
             pst.setInt(8, p.getUserId());
             System.out.println("====================================================================================================");
             System.out.println(p.getUserId());
             pst.executeUpdate();
             f=true;
             
             
             
             
         } catch (Exception e) {
             
             e.printStackTrace();
         }
         
         return f;
     }
     
     
     public List<Post> getAllPosts()
     {
         //fetch all posts
         List<Post> list=new ArrayList<>();
         
         try 
         {
             PreparedStatement ps=con.prepareStatement("select * from posts order by pid desc");
             ResultSet rs=ps.executeQuery();
             while(rs.next())
             {
                 int pid=rs.getInt("pid");
                 String bookName=rs.getString("bookName");
                 String contact=rs.getString("contact");
                 int bookPrice=rs.getInt("bookPrice");
                 String bookPic=rs.getString("bookPic");
                 String address=rs.getString("address");
                 String author=rs.getString("author");
                 int catId=rs.getInt("catId");
                 int userId=rs.getInt("userId");
                 Post post=new Post(pid, bookName, contact, bookPrice, bookPic, address, author, catId, userId);
                 list.add(post);
             }
             
         } catch (Exception e)
         {
             e.printStackTrace();
         }
         
         
         return list;
     }
     
      public List<Post> getAllPostsByCatId(int catId)
     {
         //fetch all posts by cat id
         List<Post> list=new ArrayList<>();
          try 
         {
             PreparedStatement ps=con.prepareStatement("select * from posts where catId=?");
             ps.setInt(1, catId);
             ResultSet rs=ps.executeQuery();
             while(rs.next())
             {
                 int pid=rs.getInt("pid");
                 String bookName=rs.getString("bookName");
                 String contact=rs.getString("contact");
                 int bookPrice=rs.getInt("bookPrice");
                 String bookPic=rs.getString("bookPic");
                 String address=rs.getString("address");
                 String author=rs.getString("author");
                
                 int userId=rs.getInt("userId");
                 Post post=new Post(pid, bookName, contact, bookPrice, bookPic, address, author, catId, userId);
                 list.add(post);
             }
             
         } catch (Exception e)
         {
             e.printStackTrace();
         }
         
         return list;
     }
      
      public Post getPostByPostId(int postId)
      {
          Post p=null;
          String q="select * from posts where pid=?";
          try 
          {
              PreparedStatement ps=con.prepareStatement(q);
              ps.setInt(1,postId);
              ResultSet rs = ps.executeQuery();
              if(rs.next())
              {
                 int pid=rs.getInt("pid");
                 String bookName=rs.getString("bookName");
                 String contact=rs.getString("contact");
                 int bookPrice=rs.getInt("bookPrice");
                 String bookPic=rs.getString("bookPic");
                 String address=rs.getString("address");
                 String author=rs.getString("author");
                 int catId=rs.getInt("catId");
                 int userId=rs.getInt("userId");
                 p=new Post(pid, bookName, contact, bookPrice, bookPic, address, author, catId, userId);
              }
              
              
          } catch (Exception e) {
              e.printStackTrace();
          }
          return p;
          
      }


}
