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

    public ArrayList<Account> listAccount() {
        ArrayList<Account> list = new ArrayList<>();
        try {
            String query = "select * from [Accounts]";
            con = new DBContext().connection;//mo ket noi voi sql
            ps = con.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Account(
                        rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getDate(5),
                        rs.getBoolean(6),
                        rs.getString(7),
                        rs.getString(8),
                        rs.getString(9),
                        rs.getInt(10),
                        rs.getInt(11)));
            }
        } catch (SQLException e) {
            System.out.println("listAccount: " + e.getMessage());
        }
        return list;
    }

    // Get account by username and password
  public Account getAccount(String username, String password) {
    if (username == null || username.isEmpty() || password == null || password.isEmpty()) {
        return null;
    }

    String sql = "SELECT * FROM Accounts WHERE user_name = ? AND pass_word = ?";
    Account acc = null;

    try (PreparedStatement pre = con.prepareStatement(sql)) {
        // Set the username and password as parameters for the query
        pre.setString(1, username);
        pre.setString(2, password);

        try (ResultSet rs = pre.executeQuery()) {
            if (rs.next()) {
                // Retrieve the username from the database
                String dbUsername = rs.getString("user_name");

                // Check if the lengths of the usernames are equal
                if (username.length() == dbUsername.length()) {
                    // Compare characters one by one
                    boolean isEqual = true;
                    for (int i = 0; i < username.length(); i++) {
                        if (username.charAt(i) != dbUsername.charAt(i)) {
                            isEqual = false;
                            break;
                        }
                    }

                    if (isEqual) {
                        // Username matches, create the Account object
                        acc = new Account(
                                rs.getString(1),
                                rs.getString(2),
                                rs.getString(3),
                                rs.getString(4),
                                rs.getDate(5),
                                rs.getBoolean(6),
                                rs.getString(7),
                                rs.getString(8),
                                rs.getString(9),
                                rs.getInt(10),
                                rs.getInt(11));
                    }
                }
            }
        }
    } catch (SQLException ex) {
        Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, "An error occurred while getting account", ex);
    }

    return acc;
}

    public boolean changePassWord(Account a) {
        String sql = "update Accounts set pass_word=? where user_name=?";
        try (PreparedStatement pre = con.prepareStatement(sql)) {
            pre.setString(1, a.getPassword());
            pre.setString(2, a.getUserName());
            int result = pre.executeUpdate();
            if (result == 1) {
                return true;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return false;
    }

    public static void main(String[] args) {
        AccountDAO dao = new AccountDAO();
        dao.updateAccount("user1", "pham hung son", "2003-12-2", "1", "Thanh hao 123", "2k3sonpham@gmail.com", "123", "01234266733");
        Account a = new Account();
        a.setUserName("tuantu123");
        a.setPassword("12341234");
        if (dao.changePassWord(a)) {
            System.out.println("thanh cong");
        } else {
            System.out.println("that bai");
        }
    }

    public void updateAccount(String username, String fullname, String dob, String sex, String address,
            String gmail, String avatar, String phone) {
        try {
            String query = "UPDATE Accounts \r\n"
                    + //
                    "SET gmail = ?, full_name = ?, dob = ?, sex = ?, address = ?, avatar = ?, phone = ?\r\n"
                    + //
                    "Where user_name = ?";
            con = new DBContext().connection;// mo ket noi voi sql
            ps = con.prepareStatement(query);
            ps.setString(1, gmail);
            ps.setString(2, fullname);
            ps.setString(3, dob);
            ps.setString(4, sex);
            ps.setString(5, address);
            ps.setString(6, avatar);
            ps.setString(7, phone);
            ps.setString(8, username);
            ps.executeUpdate();

        } catch (Exception e) {
            System.out.println("updateAccount: " + e.getMessage());
        }
    }

    public boolean isUsermailAndEmailExists(String username, String gmail) {
        String query = "SELECT COUNT(*) FROM Accounts WHERE user_name = ? AND gmail = ?";
        try (PreparedStatement statement = con.prepareStatement(query)) {
            statement.setString(1, username);
            statement.setString(2, gmail);
            try (ResultSet resultSet = statement.executeQuery()) {
                if (resultSet.next()) {
                    int count = resultSet.getInt(1);
                    return count > 0;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            // Handle any exceptions here
        }
        return false;
    }

}
