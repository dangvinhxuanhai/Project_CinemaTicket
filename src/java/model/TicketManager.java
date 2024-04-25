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
public class TicketManager {
    private ArrayList<Ticket> List ;

    public TicketManager() {
        List = TicketDAO.getAllTickets();
    }

    public ArrayList<Ticket> getList() {
        return List;
    }
    
    public ArrayList<Ticket> getTicketByIdUser(int id){
        ArrayList<Ticket> userTicket = new ArrayList<>();
        for(Ticket tk:List){
            if(id==tk.getUser().getId())
                userTicket.add(tk);
        }
        return userTicket;
    }
    public static void main(String[] args) {
        TicketManager tkm = new TicketManager();
        for(Ticket tk :tkm.getList()){
            System.out.println(tk);
        }
    }
}
