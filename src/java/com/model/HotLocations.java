/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.model;

/**
 *
 * @author Subin
 */
public class HotLocations {
    private int Number;
    private String Location;
    private String picture;

    public HotLocations(){
        
    }
    
    public HotLocations(int Number, String Location, String picture) {
        this.Number = Number;
        this.Location = Location;
        this.picture = picture;
    }

    public int getNumber() {
        return Number;
    }

    public void setNumber(int Number) {
        this.Number = Number;
    }

    public String getLocation() {
        return Location;
    }

    public void setLocation(String Location) {
        this.Location = Location;
    }

    public String getpicture() {
        return picture;
    }

    public void setpicture(String picture) {
        this.picture = picture;
    }
    
}
