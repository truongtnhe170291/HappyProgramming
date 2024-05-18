/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import models.Account;
import models.Mentee;


/**
 *
 * @author Admin
 */
public class MentorDAO {
    private Connection con;
    private String status = "OK";

    PreparedStatement ps;
    ResultSet rs;

    // Data accept object
    public MentorDAO(){
         try {
            con = new DBContext().connection;
        } catch (Exception e) {
            e.printStackTrace();
            status = "Error";
        }
    }
}
