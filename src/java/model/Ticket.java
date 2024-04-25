/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author lenovo
 */
public class Ticket {

    private int MaVe;
    private Account User;
    private String MaPhong;
    private int TrangThai, soluong;
    private Movie movie;
    private Schedule schedule;
    private int totalPrice;
    private String time;

    public Ticket(int MaVe, Account User, String MaPhong, int TrangThai, int soluong, Movie movie, Schedule schedule, int totalPrice, String time) {
        this.MaVe = MaVe;
        this.User = User;
        this.MaPhong = MaPhong;
        this.TrangThai = TrangThai;
        this.soluong = soluong;
        this.movie = movie;
        this.schedule = schedule;
        this.totalPrice = totalPrice;
        this.time = time;
    }

    public int getMaVe() {
        return MaVe;
    }

    public void setMaVe(int MaVe) {
        this.MaVe = MaVe;
    }

    public Account getUser() {
        return User;
    }

    public void setUser(Account User) {
        this.User = User;
    }

    public String getMaPhong() {
        return MaPhong;
    }

    public void setMaPhong(String MaPhong) {
        this.MaPhong = MaPhong;
    }

    public int getTrangThai() {
        return TrangThai;
    }

    public void setTrangThai(int TrangThai) {
        this.TrangThai = TrangThai;
    }

    public int getSoluong() {
        return soluong;
    }

    public void setSoluong(int soluong) {
        this.soluong = soluong;
    }

    public Movie getMovie() {
        return movie;
    }

    public void setMovie(Movie movie) {
        this.movie = movie;
    }

    public Schedule getSchedule() {
        return schedule;
    }

    public void setSchedule(Schedule schedule) {
        this.schedule = schedule;
    }

    public int getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(int totalPrice) {
        this.totalPrice = totalPrice;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    @Override
    public String toString() {
        return "Ticket{" + "MaVe=" + MaVe + ", User=" + User + ", MaPhong=" + MaPhong + ", TrangThai=" + TrangThai + ", soluong=" + soluong + ", movie=" + movie + ", schedule=" + schedule + ", totalPrice=" + totalPrice + ", time=" + time + '}';
    }

}
