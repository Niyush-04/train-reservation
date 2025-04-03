package com.trainreservation.model;

public class Ticket {

    private String username;
    private String pnr;
    private String trainNo;
    private String date;
    private String source;
    private String destination;
    private String totalFare;
    private String totalSeats;

    // passenger details 1
    private String P1_name;
    private String P1_age;
    private String P1_gender;
    private String P1_seatNo;

    // passenger details 2
    private String P2_name;
    private String P2_age;
    private String P2_gender;
    private String P2_seatNo;

    // passenger details 3
    private String P3_name;
    private String P3_age;
    private String P3_gender;
    private String P3_seatNo;

    Ticket() {}

    public Ticket(String P1_age, String P1_gender, String P1_name, String P1_seatNo, String P2_age, String P2_gender, String P2_name, String P2_seatNo, String P3_age, String P3_gender, String P3_name, String P3_seatNo, String date, String destination, String pnr, String source, String totalFare, String totalSeats, String trainNo, String username) {
        this.P1_age = P1_age;
        this.P1_gender = P1_gender;
        this.P1_name = P1_name;
        this.P1_seatNo = P1_seatNo;
        this.P2_age = P2_age;
        this.P2_gender = P2_gender;
        this.P2_name = P2_name;
        this.P2_seatNo = P2_seatNo;
        this.P3_age = P3_age;
        this.P3_gender = P3_gender;
        this.P3_name = P3_name;
        this.P3_seatNo = P3_seatNo;
        this.date = date;
        this.destination = destination;
        this.pnr = pnr;
        this.source = source;
        this.totalFare = totalFare;
        this.totalSeats = totalSeats;
        this.trainNo = trainNo;
        this.username = username;
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

    public String getTotalSeats() {
        return totalSeats;
    }

    public void setTotalSeats(String totalSeats) {
        this.totalSeats = totalSeats;
    }

    public String getP1_name() {
        return P1_name;
    }

    public void setP1_name(String P1_name) {
        this.P1_name = P1_name;
    }

    public String getP1_age() {
        return P1_age;
    }

    public void setP1_age(String P1_age) {
        this.P1_age = P1_age;
    }

    public String getP1_gender() {
        return P1_gender;
    }

    public void setP1_gender(String P1_gender) {
        this.P1_gender = P1_gender;
    }

    public String getP1_seatNo() {
        return P1_seatNo;
    }

    public void setP1_seatNo(String P1_seatNo) {
        this.P1_seatNo = P1_seatNo;
    }

    public String getP2_name() {
        return P2_name;
    }

    public void setP2_name(String P2_name) {
        this.P2_name = P2_name;
    }

    public String getP2_age() {
        return P2_age;
    }

    public void setP2_age(String P2_age) {
        this.P2_age = P2_age;
    }

    public String getP2_gender() {
        return P2_gender;
    }

    public void setP2_gender(String P2_gender) {
        this.P2_gender = P2_gender;
    }

    public String getP2_seatNo() {
        return P2_seatNo;
    }

    public void setP2_seatNo(String P2_seatNo) {
        this.P2_seatNo = P2_seatNo;
    }

    public String getP3_name() {
        return P3_name;
    }

    public void setP3_name(String P3_name) {
        this.P3_name = P3_name;
    }

    public String getP3_age() {
        return P3_age;
    }

    public void setP3_age(String P3_age) {
        this.P3_age = P3_age;
    }

    public String getP3_gender() {
        return P3_gender;
    }

    public void setP3_gender(String P3_gender) {
        this.P3_gender = P3_gender;
    }

    public String getP3_seatNo() {
        return P3_seatNo;
    }

    public void setP3_seatNo(String P3_seatNo) {
        this.P3_seatNo = P3_seatNo;
    }


}
