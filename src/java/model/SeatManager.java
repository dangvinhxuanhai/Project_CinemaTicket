/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.ArrayList;

/**
 *
 * @author lenovo
 */
public class SeatManager {

    private ArrayList<Seat> List;

    public SeatManager() {
        List = SeatDAO.getAllSeats();
    }

    public ArrayList<Seat> getList() {
        return List;
    }

    public ArrayList<Seat> getSeatBySchedule(int id) {
        ArrayList<Seat> seatList = new ArrayList<>();
        for (Seat fst : List) {
            if (id == fst.getSchedule().getScheduleID()) {
                seatList.add(fst);
            }
        }
        return seatList;
    }
    
    public static void main(String[] args) {
        SeatManager sm = new SeatManager();
        for(Seat st : sm.getSeatBySchedule(1)){
            System.out.println(st);
        }
    }
}
