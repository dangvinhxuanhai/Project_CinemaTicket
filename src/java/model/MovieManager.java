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
public class MovieManager {
    private ArrayList<Movie> List ;

    public MovieManager() {
        List = MovieDAO.getAllMovies();
    }

    public ArrayList<Movie> getList() {
        return List;
    }
    
    
    
    public Movie getMovieById(int id){
        for(Movie fmv:List){
            if(id==fmv.getNo())
                return fmv;
        }
        return null;
    }
    
    public ArrayList<Movie> searchMoviesByName(String partialName) {
        ArrayList<Movie> foundMovies = new ArrayList<>();
        if("".equals(partialName) || partialName.isEmpty()){
            return null;
        }
        for (Movie movie : List) {
            // Sử dụng phương thức contains() để kiểm tra xem tên phim có chứa phần của tên được cung cấp hay không
            if (movie.getName().toLowerCase().contains(partialName.toLowerCase())) {
                foundMovies.add(movie);
            }
        }
        return foundMovies;
    }
    
    public static void main(String[] args) {
        MovieManager mm = new MovieManager();
        for(Movie mv : mm.getList()){
            System.out.println(mv);
        }
    }
}
