
import dal.AccountDAO;
import java.util.ArrayList;
import models.Account;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

/**
 *
 * @author 2k3so
 */
public class Testing {
    public static void main(String[] args) {
        AccountDAO dao = new AccountDAO();
        ArrayList<Account> list = dao.listAccount();
        for (Account a : list) {
            System.out.println(a.toString());
        }
    }
}
