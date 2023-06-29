package com.model;

import java.sql.Date;

public class Users {

    private int id;
    private int user_type;
    private Long phone_number;
    private Long pan;
    private String name;
    private String email, address;
    private String password;
    private Date dob;

    public Users() {
    }

    public Users(int user_type, String name, String email, String address, Long phone_number, Long pan, Date dob, String password) {
        super();
        this.user_type = user_type;
        this.name = name;
        this.email = email;
        this.address=address;
        this.phone_number = phone_number;
        this.pan = pan;
        this.dob = dob;
        this.password = password;
    }

    public Users(int id, int user_type, String name, String email, String address, Long phone_number, Long pan, Date dob, String password) {
        super();
        this.id = id;
        this.user_type = user_type;
        this.name = name;
        this.email = email;
        this.address=address;
        this.phone_number = phone_number;
        this.pan = pan;
        this.dob = dob;
        this.password = password;
    }
    
    public Users(int id, int user_type, String name, String email, String address, Long phone_number, Long pan, Date dob) {
        super();
        this.id = id;
        this.user_type = user_type;
        this.name = name;
        this.email = email;
        this.address=address;
        this.phone_number = phone_number;
        this.pan = pan;
        this.dob = dob;
    }
    
    public Users(int id, int user_type, String name){
        this.id=id;
        this.user_type=user_type;
        this.name=name;
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
     * @return the user_type
     */
    public int getUser_type() {
        return user_type;
    }

    /**
     * @param user_type the user_type to set
     */
    public void setUser_type(int user_type) {
        this.user_type = user_type;
    }

    /**
     * @return the phone_number
     */
    public Long getPhone_number() {
        return phone_number;
    }

    /**
     * @param phone_number the phone_number to set
     */
    public void setPhone_number(Long phone_number) {
        this.phone_number = phone_number;
    }

    /**
     * @return the pan
     */
    public Long getPan() {
        return pan;
    }

    /**
     * @param pan the pan to set
     */
    public void setPan(Long pan) {
        this.pan = pan;
    }

    /**
     * @return the name
     */
    public String getName() {
        return name;
    }

    /**
     * @param name the name to set
     */
    public void setName(String name) {
        this.name = name;
    }

    /**
     * @return the email
     */
    public String getEmail() {
        return email;
    }

    /**
     * @param email the email to set
     */
    public void setEmail(String email) {
        this.email = email;
    }

    /**
     * @return the password
     */
    public String getPassword() {
        return password;
    }

    /**
     * @param password the password to set
     */
    public void setPassword(String password) {
        this.password = password;
    }

    /**
     * @return the dob
     */
    public Date getDob() {
        return dob;
    }

    /**
     * @param dob the dob to set
     */
    public void setDob(Date dob) {
        this.dob = dob;
    }

    /**
     * @return the address
     */
    public String getAddress() {
        return address;
    }

    /**
     * @param address the address to set
     */
    public void setAddress(String address) {
        this.address = address;
    }
}
