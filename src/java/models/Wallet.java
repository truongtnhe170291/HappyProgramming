/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package models;

/**
 *
 * @author Admin
 */
public class Wallet {
    private String wallet_id;
    private long real_balance, avaiable_balance;

    public Wallet(String wallet_id, long real_balance, long avaiable_balance) {
        this.wallet_id = wallet_id;
        this.real_balance = real_balance;
        this.avaiable_balance = avaiable_balance;
    }

    public String getWallet_id() {
        return wallet_id;
    }

    public void setWallet_id(String wallet_id) {
        this.wallet_id = wallet_id;
    }

    public long getReal_balance() {
        return real_balance;
    }

    public void setReal_balance(long real_balance) {
        this.real_balance = real_balance;
    }

    public long getAvaiable_balance() {
        return avaiable_balance;
    }

    public void setAvaiable_balance(long avaiable_balance) {
        this.avaiable_balance = avaiable_balance;
    }
    
}
