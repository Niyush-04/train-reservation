package com.trainreservation.model;

public class Ticket {

    private String username;
    private String pnr;
    private String trainNo;
    private String date;
    private String source;
    private String destination;
    private String totalFare;
    private int totalSeats;

    public Ticket() {
    }

    public Ticket(String username, String pnr, String trainNo, String date, String source, String destination, String totalFare, int totalSeats) {
        this.username = username;
        this.pnr = pnr;
        this.trainNo = trainNo;
        this.date = date;
        this.source = source;
        this.destination = destination;
        this.totalFare = totalFare;
        this.totalSeats = totalSeats;
    }

    public String getUsername() {
        return username;
    }

    public void setusername(String username) {
        this.username = username;
    }

    public String getPnr() {
        return pnr;
    }

    public void setPnr(String pnr) {
        this.pnr = pnr;
    }

    public String getTrainNo() {
        return trainNo;
    }

    public void setTrainNo(String trainNo) {
        this.trainNo = trainNo;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getSource() {
        return source;
    }

    public void setSource(String source) {
        this.source = source;
    }

    public String getDestination() {
        return destination;
    }

    public void setDestination(String destination) {
        this.destination = destination;
    }

    public String getTotalFare() {
        return totalFare;
    }

    public void setTotalFare(String totalFare) {
        this.totalFare = totalFare;
    }

    public int getTotalSeats() {
        return totalSeats;
    }

    public void setTotalSeats(int totalSeats) {
        this.totalSeats = totalSeats;
    }

}
