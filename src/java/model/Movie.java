/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;


/**
 *
 * @author lenovo
 */
public class Movie {

    private int no,lenght;
    private String name, url,url2, introduce, actor,premiere,Directors ;
    private Category Category1,Category2;

    public Movie(int no, int lenght, String name, String url, String url2, String introduce, String actor, String premiere, String Directors, Category Category1, Category Category2) {
        this.no = no;
        this.lenght = lenght;
        this.name = name;
        this.url = url;
        this.url2 = url2;
        this.introduce = introduce;
        this.actor = actor;
        this.premiere = premiere;
        this.Directors = Directors;
        this.Category1 = Category1;
        this.Category2 = Category2;
    }

    public int getNo() {
        return no;
    }

    public void setNo(int no) {
        this.no = no;
    }

    public int getLenght() {
        return lenght;
    }

    public void setLenght(int lenght) {
        this.lenght = lenght;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public String getUrl2() {
        return url2;
    }

    public void setUrl2(String url2) {
        this.url2 = url2;
    }

    public String getIntroduce() {
        return introduce;
    }

    public void setIntroduce(String introduce) {
        this.introduce = introduce;
    }

    public String getActor() {
        return actor;
    }

    public void setActor(String actor) {
        this.actor = actor;
    }

    public String getPremiere() {
        return premiere;
    }

    public void setPremiere(String premiere) {
        this.premiere = premiere;
    }

    public String getDirectors() {
        return Directors;
    }

    public void setDirectors(String Directors) {
        this.Directors = Directors;
    }

    public Category getCategory1() {
        return Category1;
    }

    public void setCategory1(Category Category1) {
        this.Category1 = Category1;
    }

    public Category getCategory2() {
        return Category2;
    }

    public void setCategory2(Category Category2) {
        this.Category2 = Category2;
    }

    @Override
    public String toString() {
        return "Movie{" + "no=" + no + ", lenght=" + lenght + ", name=" + name + ", url=" + url + ", url2=" + url2 + ", introduce=" + introduce + ", actor=" + actor + ", premiere=" + premiere + ", Directors=" + Directors + ", Category1=" + Category1 + ", Category2=" + Category2 + '}';
    }

}
