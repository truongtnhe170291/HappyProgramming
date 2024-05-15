/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import models.Account;

/**
 *
 * @author 2k3so
 */
public class AccountDAO {
    private Connection con;
    private String status = "OK";

    PreparedStatement ps;
    ResultSet rs;

    // Data accept object
    public AccountDAO() {
        try {
            con = new DBContext().connection;
        } catch (Exception e) {
            e.printStackTrace();
            status = "Error";
        }
    }
    
//    public void insertAcocount(String gmail,String userName,String fullName,String passWord,String dob,String sex,String address,String phone,String role,String status ){
//        try {
//            String query = "";
//        } catch (Exception e) {
//            System.out.println("insertAcocount: " + e.getMessage());
//        }
//    }
    
    public ArrayList<Account> listAccount(){
        ArrayList<Account> list = new ArrayList<>();
        try {
            String query = "select * from [Account]";
            con = new DBContext().connection;//mo ket noi voi sql
            ps = con.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Account(
                        rs.getString(1), 
                        rs.getString(2), 
                        rs.getString(3), 
                        rs.getString(4), 
                        rs.getString(5), 
                        rs.getString(6), 
                        rs.getString(7),
                        rs.getString(8), 
                        rs.getString(9),
                        rs.getDate(10)));
            }
        } catch (Exception e) {
            System.out.println("listAccount: " + e.getMessage());
        }
        return list;
    }
    
}
