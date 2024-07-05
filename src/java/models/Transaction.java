/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package models;

import java.time.LocalDateTime;

/**
 *
 * @author Admin
 */
public class Transaction {

    private int transaction_id;
    private String user_send;
    private String user_receive;
    private LocalDateTime create_date;
    private long amount;
    private String message;

    public Transaction(int transaction_id, String user_send, String user_receive, LocalDateTime create_date, long amount, String message) {
        this.transaction_id = transaction_id;
        this.user_send = user_send;
        this.user_receive = user_receive;
        this.create_date = create_date;
        this.amount = amount;
        this.message = message;
    }

    public Transaction() {
    }

    public int getTransaction_id() {
        return transaction_id;
    }

    public void setTransaction_id(int transaction_id) {
        this.transaction_id = transaction_id;
    }

    public String getUser_send() {
        return user_send;
    }

    public void setUser_send(String user_send) {
        this.user_send = user_send;
    }

    public String getUser_receive() {
        return user_receive;
    }

    public void setUser_receive(String user_receive) {
        this.user_receive = user_receive;
    }

    public LocalDateTime getCreate_date() {
        return create_date;
    }

    public void setCreate_date(LocalDateTime create_date) {
        this.create_date = create_date;
    }

    public long getAmount() {
        return amount;
    }

    public void setAmount(long amount) {
        this.amount = amount;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public String formatMoney() {
        String output = formatStringMoney(this.amount);
        return output;
    }
    
    public static String formatStringMoney(long amount) {
        String formattedAmount;
        if (amount < 0) {
            formattedAmount = "-" + formatStringMoney(-amount);
        } else {
            String amountStr = String.valueOf(amount);
            int length = amountStr.length();
            StringBuilder sb = new StringBuilder();
            for (int i = 0; i < length; i++) {
                if (i > 0 && (length - i) % 3 == 0) {
                    sb.append(".");
                }
                sb.append(amountStr.charAt(i));
            }
            formattedAmount = sb.toString() + " vnđ";
        }
        return formattedAmount;
    }

    @Override
    public String toString() {
        return "Transaction{" + "transaction_id=" + transaction_id + ", user_send=" + user_send + ", user_receive=" + user_receive + ", create_date=" + create_date + ", amount=" + amount + ", message=" + message + '}';
    }

}
