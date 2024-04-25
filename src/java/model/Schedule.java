package model;


public class Schedule {
    private int scheduleID;
    private Movie movie;
    private String timeSlot;
    private String theater;
    private String date;

    public Schedule() {
    }

    public Schedule(int scheduleID, Movie movie, String timeSlot, String theater, String date) {
        this.scheduleID = scheduleID;
        this.movie = movie;
        this.timeSlot = timeSlot;
        this.theater = theater;
        this.date = date;
    }

    public int getScheduleID() {
        return scheduleID;
    }

    public void setScheduleID(int scheduleID) {
        this.scheduleID = scheduleID;
    }

    public Movie getMovie() {
        return movie;
    }

    public void setMovie(Movie movie) {
        this.movie = movie;
    }

    public String getTimeSlot() {
        return timeSlot;
    }

    public void setTimeSlot(String timeSlot) {
        this.timeSlot = timeSlot;
    }

    public String getTheater() {
        return theater;
    }

    public void setTheater(String theater) {
        this.theater = theater;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    @Override
    public String toString() {
        return "Schedule{" + "scheduleID=" + scheduleID + ", movie=" + movie + ", timeSlot=" + timeSlot + ", theater=" + theater + ", date=" + date + '}';
    }

}
