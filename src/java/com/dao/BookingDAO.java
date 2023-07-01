/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.dao;

/**
 *
 * @author Subin
 */
import com.config.Config;
import com.model.Booking;
import com.model.Packages;
import java.sql.*;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class BookingDAO {
    public boolean makeBooking(int packageId, String customerName, String customerEmail, Date bookingDate, int numberOfPeople) {
        try (Connection connection = Config.getConnection()) {
            String query = "INSERT INTO bookings (package_id, customer_name, customer_email, booking_date, number_of_people) " +
                    "VALUES (?, ?, ?, ?, ?)";

            PreparedStatement statement = connection.prepareStatement(query);
            statement.setInt(1, packageId);
            statement.setString(2, customerName);
            statement.setString(3, customerEmail);
            statement.setDate(4, new java.sql.Date(bookingDate.getTime()));
            statement.setInt(5, numberOfPeople);
            
            if (statement.executeUpdate() > 0) {
                return true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public List<Booking> checkAllBookings() {
        List<Booking> bookings = new ArrayList<>();

        try (Connection connection = Config.getConnection()) {
            String query = "SELECT * FROM bookings";
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery(query);

            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                int packageId = resultSet.getInt("package_id");
                String customerName = resultSet.getString("customer_name");
                String customerEmail = resultSet.getString("customer_email");
                Date bookingDate = resultSet.getDate("booking_date");
                int numberOfPeople = resultSet.getInt("number_of_people");

                Booking booking = new Booking(id, packageId, customerName, customerEmail, bookingDate, numberOfPeople);
                bookings.add(booking);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return bookings;
    }

    public Booking findBookingsById(int Id) {
        Booking booking = null;

        try (Connection connection = Config.getConnection()) {
            String query = "SELECT * FROM bookings WHERE id = ?";
            PreparedStatement statement = connection.prepareStatement(query);
            statement.setInt(1, Id);
            ResultSet resultSet = statement.executeQuery();

            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                int package_id = resultSet.getInt("package_id");
                String customerName = resultSet.getString("customer_name");
                String customerEmail = resultSet.getString("customer_email");
                Date bookingDate = resultSet.getDate("booking_date");
                int numberOfPeople = resultSet.getInt("number_of_people");

                booking = new Booking(id, package_id, customerName, customerEmail, bookingDate, numberOfPeople);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return booking;
    }
    
    public List<Booking> findBookingsByPackage(int agentId) {
        List<Booking> bookings = new ArrayList<>();

        try (Connection connection = Config.getConnection()) {
            String query = "SELECT * FROM bookings inner join packages on bookings.package_id = packages.id WHERE packages.agencyid = ?";
            PreparedStatement statement = connection.prepareStatement(query);
            statement.setInt(1, agentId);
            ResultSet resultSet = statement.executeQuery();

            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String customerName = resultSet.getString("customer_name");
                String customerEmail = resultSet.getString("customer_email");
                Date bookingDate = resultSet.getDate("booking_date");
                int numberOfPeople = resultSet.getInt("number_of_people");
                java.sql.Date date= java.sql.Date.valueOf(resultSet.getString("updated_date"));
                Packages packag = new Packages(resultSet.getInt("id"),resultSet.getString("title"),resultSet.getInt("category"),resultSet.getString("description"), resultSet.getString("location"),resultSet.getInt("people"),resultSet.getInt("duration"),resultSet.getDouble("price"),resultSet.getInt("agencyid"),resultSet.getString("picture"),date);

                Booking booking = new Booking(id, packag, customerName, customerEmail, bookingDate, numberOfPeople);
                bookings.add(booking);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return bookings;
    }

    public List<Booking> findBookingsByEmail(String customerEmail) {
        List<Booking> bookings = new ArrayList<>();

        try (Connection connection = Config.getConnection()) {
            String query = "SELECT * FROM bookings WHERE customer_email = ?";
            PreparedStatement statement = connection.prepareStatement(query);
            statement.setString(1, customerEmail);
            ResultSet resultSet = statement.executeQuery();

            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                int packageId = resultSet.getInt("package_id");
                String customerName = resultSet.getString("customer_name");
                Date bookingDate = resultSet.getDate("booking_date");
                int numberOfPeople = resultSet.getInt("number_of_people");

                Booking booking = new Booking(id, packageId, customerName, customerEmail, bookingDate, numberOfPeople);
                bookings.add(booking);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return bookings;
    }
    
    public boolean deleteBooking(int id){
        String INSERT_PACKAGE_SQL = "DELETE from bookingss WHERE id = ?;";

        try {
            Connection connection = Config.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(INSERT_PACKAGE_SQL);
            preparedStatement.setInt(1, id);
            if (preparedStatement.executeUpdate() > 0) {
                return true;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return false;
    }
}

