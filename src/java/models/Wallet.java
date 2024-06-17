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
    private long real_binance, avaiable_binance;

    public Wallet(String wallet_id, long real_binance, long avaiable_binance) {
        this.wallet_id = wallet_id;
        this.real_binance = real_binance;
        this.avaiable_binance = avaiable_binance;
    }

    public String getWallet_id() {
        return wallet_id;
    }

    public void setWallet_id(String wallet_id) {
        this.wallet_id = wallet_id;
    }

    public long getReal_binance() {
        return real_binance;
    }

    public void setReal_binance(long real_binance) {
        this.real_binance = real_binance;
    }

    public long getAvaiable_binance() {
        return avaiable_binance;
    }

    public void setAvaiable_binance(long avaiable_binance) {
        this.avaiable_binance = avaiable_binance;
    }

   
}
