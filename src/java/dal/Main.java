/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.util.List;
import models.Account;

/**
 *
 * @author ADMIN
 */
public class Main {
    public static void main(String[] args) {
        AccountDAO accountDAO = new AccountDAO();
        List<Account> list = accountDAO.listAccount();
        for (Account account : list) {
            System.out.println("name: " + account.getUserName() + " pass: " + account.getPassWord());
        }
    }
}
