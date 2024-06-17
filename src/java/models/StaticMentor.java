/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package models;

/**
 *
 * @author Admin
 */
public class StaticMentor {
    private int acceptedRequests;
    private int invitedRequests;
    private int canceledRequests;
    private double cancelPercentage;
    private double completePercentage;
    private double ratingStars;

    public int getAcceptedRequests() {
        return acceptedRequests;
    }

    public void setAcceptedRequests(int acceptedRequests) {
        this.acceptedRequests = acceptedRequests;
    }

    public int getInvitedRequests() {
        return invitedRequests;
    }

    public void setInvitedRequests(int invitedRequests) {
        this.invitedRequests = invitedRequests;
    }

    public int getCanceledRequests() {
        return canceledRequests;
    }

    public void setCanceledRequests(int canceledRequests) {
        this.canceledRequests = canceledRequests;
    }

    public double getCancelPercentage() {
        return cancelPercentage;
    }

    public void setCancelPercentage(double cancelPercentage) {
        this.cancelPercentage = cancelPercentage;
    }

    public double getCompletePercentage() {
        return completePercentage;
    }

    public void setCompletePercentage(double completePercentage) {
        this.completePercentage = completePercentage;
    }

    public double getRatingStars() {
        return ratingStars;
    }

    public void setRatingStars(double ratingStars) {
        this.ratingStars = ratingStars;
    }

    public StaticMentor() {
    }

    public StaticMentor(int acceptedRequests, int invitedRequests, int canceledRequests, double cancelPercentage, double completePercentage, double ratingStars) {
        this.acceptedRequests = acceptedRequests;
        this.invitedRequests = invitedRequests;
        this.canceledRequests = canceledRequests;
        this.cancelPercentage = cancelPercentage;
        this.completePercentage = completePercentage;
        this.ratingStars = ratingStars;
    }

    @Override
    public String toString() {
        return "StaticMentor{" + "acceptedRequests=" + acceptedRequests + ", invitedRequests=" + invitedRequests + ", canceledRequests=" + canceledRequests + ", cancelPercentage=" + cancelPercentage + ", completePercentage=" + completePercentage + ", ratingStars=" + ratingStars + '}';
    }
    
    
    

}
