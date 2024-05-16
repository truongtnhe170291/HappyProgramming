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
import java.sql.Date;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

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
    
    // Get account by username and password
    public Account getAccount(String username, String password) {
        if (username == null || username.isEmpty() || password == null || password.isEmpty()) {
            return null;
        }

        String sql = "SELECT * FROM Account WHERE username = ? AND password = ?";
        Account acc = null;

        try (PreparedStatement pre = con.prepareStatement(sql)) {
            // Set the username and password as parameters for the query
            pre.setString(1, username);
            pre.setString(2, password);

            try (ResultSet rs = pre.executeQuery()) {
                if (rs.next()) {
                    // Map the result set to an Account object
                    String gmail = rs.getString("GMail");
                    String fullName = rs.getString("FullName");
                    Date dateOfBirth = rs.getDate("Dob");
                    String sex = rs.getString("Sex");
                    String address = rs.getString("Address");
                    String phone = rs.getString("Phone");
                    String role = rs.getString("Role");
                    String status = rs.getString("Status");

                    acc = new Account(gmail, username, fullName, password, sex, address, phone, role, status, dateOfBirth);
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, "An error occurred while getting account", ex);
        }

        return acc;
    }
    public void changePassWord(Account a) {
        String sql="update Account set Password=? where Username=?";
        try (PreparedStatement pre = con.prepareStatement(sql)) {
            pre.setString(1, a.getPassWord());
            pre.setString(2, a.getUserName());
            pre.executeUpdate();
        
        }catch(SQLException e){
            System.out.println(e);
        }
    }


}
