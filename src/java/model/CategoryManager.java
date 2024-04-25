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
public class CategoryManager {
    ArrayList<Category> List ;

    public CategoryManager() {
        List = CategoryDAO.getAllCategorys();
    }
    public Category getCategoryById(int id){
        for(Category fmv:List){
            if(id==fmv.getCategoryID())
                return fmv;
        }
        return null;
    }
}
