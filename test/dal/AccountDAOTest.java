/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/UnitTests/JUnit4TestClass.java to edit this template
 */
package dal;

import java.util.ArrayList;
import models.Account;
import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;
import static org.junit.Assert.*;

/**
 *
 * @author Admin
 */
public class AccountDAOTest {
    
    public AccountDAOTest() {
    }
    
    @BeforeClass
    public static void setUpClass() {
    }
    
    @AfterClass
    public static void tearDownClass() {
    }
    
    @Before
    public void setUp() {
    }
    
    @After
    public void tearDown() {
    }

    @Test
    public void testListAccount() {
        System.out.println("listAccount");
        AccountDAO instance = new AccountDAO();
        int expResult = 100;
        ArrayList<Account> result = instance.listAccount();
        int act = result.size();
        assertTrue(act > expResult);
        //fail("The test case is a prototype.");
    }

    @Test
    public void testGetAccount() {
        System.out.println("getAccount");
        String username = "truong";
        String password = "1";
        AccountDAO instance = new AccountDAO();
        
        Account result = instance.getAccount(username, password);
        assertTrue(result.getUserName().equalsIgnoreCase(username) && result.getPassword().equalsIgnoreCase(password));
        //fail("The test case is a prototype.");
    }

    @Test
    public void testChangePassWord() {
        System.out.println("changePassWord");
        Account a = new Account();
        a.setUserName("truong");
        a.setPassword("123");
        AccountDAO instance = new AccountDAO();
        boolean result = instance.changePassWord(a);
        assertTrue(result);
        //fail("The test case is a prototype.");
    }

    @Test
    public void testMain() {
        System.out.println("main");
        String[] args = null;
        AccountDAO.main(args);
        fail("The test case is a prototype.");
    }

   
}
