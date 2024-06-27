/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import models.Transaction;
import models.Wallet;

/**
 *
 * @author Admin
 */
public class WalletDAO {

    private Connection con;

    PreparedStatement ps;
    ResultSet rs;

    public WalletDAO() {
        try {
            con = new DBContext().connection;
        } catch (Exception e) {
        }
    }

    public static void main(String[] args) {
        WalletDAO dao = new WalletDAO();
        List<Transaction> list = dao.getTransactionByPaging("manager", 2);
        System.out.println(list.size());
    }
    public List<Transaction> getTransactionByPaging(String user, int index) {
        List<Transaction> list = new ArrayList<>();
        try {
            String sql = "select * from Transactions t where t.user_receive = ? or t.user_send = ? order by t.create_date desc"
                    + " OFFSET ? ROWS FETCH FIRST 10 ROWS ONLY";
            ps = con.prepareStatement(sql);
            ps.setString(1, user);
            ps.setString(2, user);
            ps.setInt(3, (index-1)*10);
            
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Transaction(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getTimestamp(4).toLocalDateTime(), rs.getLong(5), rs.getString(6)));
            }
        } catch (SQLException e) {
            System.out.println("getWalletByUsenName " + e.getMessage());
        }
        return list;
    }

    public int getNumberPageByUserName(String username) {
        try {
            String sql = "select count(*) from Transactions t where t.user_receive = ? or t.user_send = ?";
            ps = con.prepareStatement(sql);
            ps.setString(1, username);
            ps.setString(2, username);
            rs = ps.executeQuery();
            while (rs.next()) {
                int total = rs.getInt(1);
                int countPage = 0;
                countPage = total / 10;
                if (total % 10 != 0) {
                    countPage++;
                }
                return countPage;
            }
        } catch (SQLException e) {
        }
        return 0;
    }

    public Wallet getWalletByUsenName(String userName) {
        try {
            String sql = "select * from Wallet w where w.wallet_id = ?";
            ps = con.prepareStatement(sql);
            ps.setString(1, userName);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new Wallet(rs.getString(1), rs.getLong(2), rs.getLong(3));
            }
        } catch (SQLException e) {
            System.out.println("getWalletByUsenName " + e.getMessage());
        }
        return null;
    }

    public boolean insertWallet(Wallet wallet) {
        try {
            String sql = "INSERT INTO Wallet(wallet_id, real_binance,avaiable_binance)"
                    + "     VALUES (?, ?, ?)";
            ps = con.prepareStatement(sql);
            ps.setString(1, wallet.getWallet_id());
            ps.setLong(2, wallet.getReal_binance());
            ps.setLong(3, wallet.getAvaiable_binance());
            int result = ps.executeUpdate();
            if (result == 1) {
                return true;
            }
        } catch (SQLException e) {
            System.out.println("insertWallet " + e.getMessage());
        }
        return false;
    }

    public boolean insertTransaction(Transaction transaction) {
        try {
            String sql = "INSERT INTO Transactions (user_send, user_receive, create_date, amount, message )"
                    + "     VALUES (?, ?, ?, ?, ?)";
            ps = con.prepareStatement(sql);
            ps.setString(1, transaction.getUser_send());
            ps.setString(2, transaction.getUser_receive());
            ps.setTimestamp(3, Timestamp.valueOf(transaction.getCreate_date()));
            ps.setLong(4, transaction.getAmount());
            ps.setString(5, transaction.getMessage());
            int result = ps.executeUpdate();
            if (result == 1) {
                return true;
            }
        } catch (SQLException e) {
            System.out.println("insertTransaction" + e.getMessage());
        }
        return false;
    }

    public boolean updateWallet(Wallet wallet) {
        try {
            String sql = "UPDATE Wallet"
                    + "   SET real_binance  = ?, avaiable_binance  = ?"
                    + " WHERE wallet_id = ?";
            ps = con.prepareStatement(sql);
            ps.setLong(1, wallet.getReal_binance());
            ps.setLong(2, wallet.getAvaiable_binance());
            ps.setString(3, wallet.getWallet_id());
            int result = ps.executeUpdate();
            if (result == 1) {
                return true;
            }
        } catch (SQLException e) {
            System.out.println("updateWallet" + e.getMessage());
        }
        return false;
    }

    public List<Transaction> getTransactionsByUserName(String userName) {
        List<Transaction> list = new ArrayList<>();
        try {
            String sql = "select * from Transactions t where t.user_receive = ? or t.user_send = ? order by t.create_date desc";
            ps = con.prepareStatement(sql);
            ps.setString(1, userName);
            ps.setString(2, userName);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Transaction(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getTimestamp(4).toLocalDateTime(), rs.getLong(5), rs.getString(6)));
            }
        } catch (SQLException e) {
            System.out.println("getWalletByUsenName " + e.getMessage());
        }
        return list;
    }
}
