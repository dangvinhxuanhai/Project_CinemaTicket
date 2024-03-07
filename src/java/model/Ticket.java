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
    int MaVe;
    String MaPhong;
    Boolean TrangThai;
    Movie movie;

    public Ticket(int MaVe, String MaPhong, Boolean TrangThai, Movie movie) {
        this.MaVe = MaVe;
        this.MaPhong = MaPhong;
        this.TrangThai = TrangThai;
        this.movie = movie;
    }

    
    public int getMaVe() {
        return MaVe;
    }

    public void setMaVe(int MaVe) {
        this.MaVe = MaVe;
    }

    public String getMaPhong() {
        return MaPhong;
    }

    public void setMaPhong(String MaPhong) {
        this.MaPhong = MaPhong;
    }

    public Boolean getTrangThai() {
        return TrangThai;
    }

    public void setTrangThai(Boolean TrangThai) {
        this.TrangThai = TrangThai;
    }

    public Movie getMovie() {
        return movie;
    }

    public void setMovie(Movie movie) {
        this.movie = movie;
    }

    @Override
    public String toString() {
        return "Ticket{" + "MaVe=" + MaVe + ", MaPhong=" + MaPhong + ", TrangThai=" + TrangThai + ", movie=" + movie + '}';
    }
}
