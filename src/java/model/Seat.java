/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author lenovo
 */
public class Seat {
    private String name;
    private Schedule Schedule;
    private int idSeat;
    private Boolean trangThai;

    public Seat(String name, Schedule Schedule, int idSeat, Boolean trangThai) {
        this.name = name;
        this.Schedule = Schedule;
        this.idSeat = idSeat;
        this.trangThai = trangThai;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Schedule getSchedule() {
        return Schedule;
    }

    public void setSchedule(Schedule Schedule) {
        this.Schedule = Schedule;
    }

    public int getIdSeat() {
        return idSeat;
    }

    public void setIdSeat(int idSeat) {
        this.idSeat = idSeat;
    }

    public Boolean getTrangThai() {
        return trangThai;
    }

    public void setTrangThai(Boolean trangThai) {
        this.trangThai = trangThai;
    }

    @Override
    public String toString() {
        return "Seat{" + "name=" + name + ", Schedule=" + Schedule + ", idSeat=" + idSeat + ", trangThai=" + trangThai + '}';
    }

    
}
