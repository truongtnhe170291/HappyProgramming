/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package services;

import dal.AccountDAO;
import models.Account;

/**
 *
 * @author Admin
 */
public class AccountService {
    private static final AccountService ACCOUNT_SERVICE = new AccountService();
    private final AccountDAO accountDAO;
    
    public static AccountService getInstance(){
        return ACCOUNT_SERVICE;
    }

    private AccountService() {
        accountDAO = new AccountDAO();
    }
    
    public Account getAccount(String userName, String passWord){
        return accountDAO.getAccount(userName, passWord);
    }
    
    public boolean changePassWord(Account a){
        return accountDAO.changePassWord(a);
    }
    
    public boolean isMentee(String userName){
        return accountDAO.isMentee(userName);
    }
}
