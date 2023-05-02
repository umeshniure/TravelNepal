package com.model;

import java.sql.Date;

public class Packages {

    private int id;
    private int people;
    private int duration;
    private int  agencyid ;
    private double price;
    private String title;
    private String description;
    private String location;
    private String picture;
    private Date updated_date;

    public Packages() {
    }

    public Packages(String title, String description, String location, int people, int duration, double price, int  agencyid , String picture, Date updated_date) {
        super();
        this.title = title;
        this.description = description;
        this.location = location;
        this.people = people;
        this.duration = duration;
        this.price = price;
        this. agencyid  =  agencyid ;
        this.picture = picture;
        this.updated_date = updated_date;
    }

    public Packages(int id, String title, String description, String location, int people, int duration, double price, int  agencyid , String picture, Date updated_date) {
        super();
        this.id = id;
        this.title = title;
        this.description = description;
        this.location = location;
        this.people = people;
        this.duration = duration;
        this.price = price;
        this. agencyid  =  agencyid ;
        this.picture = picture;
        this.updated_date = updated_date;
    }

    /**
     * @return the id
     */
    public int getId() {
        return id;
    }

    /**
     * @param id the id to set
     */
    public void setId(int id) {
        this.id = id;
    }

    /**
     * @return the people
     */
    public int getPeople() {
        return people;
    }

    /**
     * @param people the people to set
     */
    public void setPeople(int people) {
        this.people = people;
    }

    /**
     * @return the duration
     */
    public int getDuration() {
        return duration;
    }

    /**
     * @param duration the duration to set
     */
    public void setDuration(int duration) {
        this.duration = duration;
    }

    /**
     * @return the  agencyid 
     */
    public int getAgencyid() {
        return  agencyid ;
    }

    /**
     * @param  agencyid  the  agencyid  to set
     */
    public void setAgencyid(int  agencyid ) {
        this. agencyid  =  agencyid ;
    }

    /**
     * @return the price
     */
    public double getPrice() {
        return price;
    }

    /**
     * @param price the price to set
     */
    public void setPrice(double price) {
        this.price = price;
    }

    /**
     * @return the title
     */
    public String getTitle() {
        return title;
    }

    /**
     * @param title the title to set
     */
    public void setTitle(String title) {
        this.title = title;
    }

    /**
     * @return the description
     */
    public String getDescription() {
        return description;
    }

    /**
     * @param description the description to set
     */
    public void setDescription(String description) {
        this.description = description;
    }

    /**
     * @return the location
     */
    public String getLocation() {
        return location;
    }

    /**
     * @param location the location to set
     */
    public void setLocation(String location) {
        this.location = location;
    }

    /**
     * @return the picture
     */
    public String getPicture() {
        return picture;
    }

    /**
     * @param picture the picture to set
     */
    public void setPicture(String picture) {
        this.picture = picture;
    }

    /**
     * @return the updated_date
     */
    public Date getUpdated_date() {
        return updated_date;
    }

    /**
     * @param updated_date the updated_date to set
     */
    public void setUpdated_date(Date updated_date) {
        this.updated_date = updated_date;
    }

}
