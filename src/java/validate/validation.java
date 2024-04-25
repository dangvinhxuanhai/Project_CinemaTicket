/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package validate;

import java.util.ArrayList;
import model.Movie;
import model.MovieDAO;
import model.Schedule;
import model.ScheduleDAO;

/**
 *
 * @author lenovo
 */
public class validation {

    public static boolean checkPhoneNumber(String phoneNumber) {
        if (phoneNumber.length() != 10) {
            return false;
        }
        for (char c : phoneNumber.toCharArray()) {
            if (!Character.isDigit(c)) {
                return false;
            }
        }
        return true;
    }

    public static boolean checkEmail(String email) {
        if (!email.endsWith("@gmail.com")) {
            return false;
        }
        return true;
    }
    
    public static boolean checkMovie( Movie newMovie) {
        ArrayList<Movie> movieList = MovieDAO.getAllMovies();
        for (Movie movie : movieList) {
            if (movie.getName().equals(newMovie.getName()) &&
                movie.getUrl().equals(newMovie.getUrl()) &&
                movie.getUrl2().equals(newMovie.getUrl2()) &&
                movie.getIntroduce().equals(newMovie.getIntroduce()) &&
                movie.getActor().equals(newMovie.getActor()) &&
                movie.getPremiere().equals(newMovie.getPremiere()) &&
                movie.getDirectors().equals(newMovie.getDirectors())) {
                return false; 
            }
        }
        return true;
    }
    
    public static boolean checkSchedule(Schedule newSchedule) {
        ArrayList<Schedule> scheduleList = ScheduleDAO.getAllSchedules();
        for (Schedule schedule : scheduleList) {
            if (schedule.getTimeSlot().equals(newSchedule.getTimeSlot()) &&
                schedule.getTheater().equals(newSchedule.getTheater()) &&
                schedule.getDate().equals(newSchedule.getDate())) {
                return false; // Nếu tất cả các trường cùng lúc giống nhau, trả về false
            }
        }
        return true; // Nếu không có trường nào giống nhau, trả về true
    }
    
    public static boolean checkScheduleUpdate(ArrayList<Schedule> list, Schedule newSchedule) {
        list.remove(newSchedule);
        for (Schedule schedule : list) {
            if (schedule.getTimeSlot().equals(newSchedule.getTimeSlot()) &&
                schedule.getTheater().equals(newSchedule.getTheater()) &&
                schedule.getDate().equals(newSchedule.getDate())) {
                return false; // Nếu tất cả các trường cùng lúc giống nhau, trả về false
            }
        }
        return true; // Nếu không có trường nào giống nhau, trả về true
    }

}
