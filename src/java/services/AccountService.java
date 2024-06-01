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
    
    //invoke to create an instance of AccountService
    public static AccountService getInstance(){
        return ACCOUNT_SERVICE;
    }

    private AccountService() {
        accountDAO = new AccountDAO();
    }
    
    //method to get username and password of account from DAO
    public Account getAccount(String userName, String passWord){
        return accountDAO.getAccount(userName, passWord);
    }
    
    //method to change password from DAO
    public boolean changePassWord(Account a){
        return accountDAO.changePassWord(a);
    }
    
}
