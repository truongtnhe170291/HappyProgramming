/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import models.Blog;
import java.sql.SQLException;
/**
 *
 * @author DIEN MAY XANH
 */
public class BlogDAO {
     private Connection con;
    private String status = "OK";

    PreparedStatement ps;
    ResultSet rs;

    // Data accept object
    public BlogDAO() {
        try {
            con = new DBContext().connection;
        } catch (Exception e) {
            e.printStackTrace();
            status = "Error";
        }
    }


    // Create Blog
    public boolean createBlog(String img, String link, boolean status) {
        String query = "INSERT INTO Blogs (img, link, status) VALUES (?, ?, ?)";
        try {
            ps = con.prepareStatement(query);
            ps.setString(1, img);
            ps.setString(2, link);
            ps.setBoolean(3, status);
            int rowsAffected = ps.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    // Update Blog
    public boolean updateBlog(int blogId, String img, String link, boolean status) {
        String query = "UPDATE Blogs SET img = ?, link = ?, status = ? WHERE blog_id = ?";
        try {
            ps = con.prepareStatement(query);
            ps.setString(1, img);
            ps.setString(2, link);
            ps.setBoolean(3, status);
            ps.setInt(4, blogId);
            int rowsAffected = ps.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    // Delete Blog
    public boolean deleteBlog(int blogId) {
        String query = "DELETE FROM Blogs WHERE blog_id = ?";
        try {
            ps = con.prepareStatement(query);
            ps.setInt(1, blogId);
            int rowsAffected = ps.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }


    // Get List of Blogs
    public List<Blog> getBlogs() {
        List<Blog> blogs = new ArrayList<>();
        String query = "SELECT * FROM Blogs ";
        try {
            ps = con.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                Blog blog = new Blog();
                blog.setBlogId(rs.getInt("blog_id"));
                blog.setImg(rs.getString("img"));
                blog.setLink(rs.getString("link"));
                blog.setStatus(rs.getBoolean("status"));
                blogs.add(blog);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return blogs;
    }
    
    public List<Blog> getTop4newBlogs() {
    List<Blog> blogs = new ArrayList<>();
    String query = "SELECT TOP 4 * FROM Blogs WHERE status = 1 ORDER BY blog_id DESC";
    try {
        ps = con.prepareStatement(query);
        rs = ps.executeQuery();
        while (rs.next()) {
            Blog blog = new Blog();
            blog.setBlogId(rs.getInt("blog_id"));
            blog.setImg(rs.getString("img"));
            blog.setLink(rs.getString("link"));
            blog.setStatus(rs.getBoolean("status"));
            blogs.add(blog);
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }
    return blogs;
}

}


