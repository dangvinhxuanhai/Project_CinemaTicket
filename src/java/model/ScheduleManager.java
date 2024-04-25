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
public class ScheduleManager {

    private ArrayList<Schedule> List;

    public ScheduleManager() {
        List = ScheduleDAO.getAllSchedules();
    }

    public ArrayList<Schedule> getList() {
        return List;
    }

    public Schedule getScheduleById(int id) {
        for (Schedule facc : List) {
            if (id == facc.getScheduleID()) {
                return facc;
            }
        }
        return null;
    }

    public ArrayList<MaPhongXuatChieu> getMaPhongXuatChieuByIdMovie(int id, ArrayList<Schedule> ar) {
        ArrayList<MaPhongXuatChieu> mpxc = new ArrayList<>();
        for (Schedule facc : ar) {
            if (id == facc.getMovie().getNo()) {
                mpxc.add(new MaPhongXuatChieu(facc.getTheater(), facc.getTimeSlot()));
            }
        }
        return mpxc;
    }

    public ArrayList<Schedule> getScheduleByDate(String date) {
        ArrayList<Schedule> lists = new ArrayList<>();
        for (Schedule facc : List) {
            if (date.equalsIgnoreCase(facc.getDate())) {
                lists.add(facc);
            }
        }
        return lists;
    }

    public ArrayList<Movie> getMovieByDate(String date) {
        ArrayList<Movie> lists = new ArrayList<>();
        for (Schedule facc : List) {
            if (date.equalsIgnoreCase(facc.getDate())) {
                if (!lists.contains(facc.getMovie())) {
                    lists.add(facc.getMovie());
                }
            }
        }
        return lists;
    }

    public int getScheduleIdByDayTimeSlot(String room, String timeSlot, String date) {
        for (Schedule facc : List) {
            if (date.equalsIgnoreCase(facc.getDate()) && timeSlot.equalsIgnoreCase(facc.getTimeSlot()) && room.equalsIgnoreCase(facc.getTheater())) {
                return facc.getScheduleID();
            }
        }
        return 0;
    }

    public static void main(String[] args) {
        ScheduleManager sm = new ScheduleManager();
//        for (Schedule st : sm.getList()) {
//            System.out.println(st);
//        }
        System.out.println(sm.getScheduleById(1));
    }
}
