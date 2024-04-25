/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author lenovo
 */
public class MaPhongXuatChieu {
    String MaPhong, XuatChieu;

    public MaPhongXuatChieu(String MaPhong, String XuatChieu) {
        this.MaPhong = MaPhong;
        this.XuatChieu = XuatChieu;
    }

    public String getMaPhong() {
        return MaPhong;
    }

    public void setMaPhong(String MaPhong) {
        this.MaPhong = MaPhong;
    }

    public String getXuatChieu() {
        return XuatChieu;
    }

    public void setXuatChieu(String XuatChieu) {
        this.XuatChieu = XuatChieu;
    }

    @Override
    public String toString() {
        return "MaPhongXuatChieu{" + "MaPhong=" + MaPhong + ", XuatChieu=" + XuatChieu + '}';
    }
}
