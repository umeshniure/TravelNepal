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

    public List<Booking> findBookingsByPackage(int packageId) {
        List<Booking> bookings = new ArrayList<>();

        try (Connection connection = Config.getConnection()) {
            String query = "SELECT * FROM bookings WHERE package_id = ?";
            PreparedStatement statement = connection.prepareStatement(query);
            statement.setInt(1, packageId);
            ResultSet resultSet = statement.executeQuery();

            while (resultSet.next()) {
                int id = resultSet.getInt("id");
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
}

