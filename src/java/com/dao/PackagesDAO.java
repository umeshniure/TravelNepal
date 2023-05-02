package com.dao;

import com.config.Config;
import com.model.Packages;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class PackagesDAO {
    public boolean insertPackage(Packages newPackage) throws SQLException {
        String INSERT_PACKAGE_SQL = "INSERT INTO packages" + "  (title, description, location, people, duration, price,  agencyid , picture, updated_date) VALUES " + " (?, ?, ?, ?, ?, ?, ?, ?, ?);";

        try {
            Connection connection = Config.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(INSERT_PACKAGE_SQL);
            preparedStatement.setString(1, newPackage.getTitle());
            preparedStatement.setString(2, newPackage.getDescription());
            preparedStatement.setString(3, newPackage.getLocation());
            preparedStatement.setInt(4, newPackage.getPeople());
            preparedStatement.setInt(5, newPackage.getDuration());
            preparedStatement.setDouble(6, newPackage.getPrice());
            preparedStatement.setInt(7, newPackage.getAgencyid());
            preparedStatement.setString(8, newPackage.getPicture());
            preparedStatement.setDate(9, newPackage.getUpdated_date());
            if (preparedStatement.executeUpdate() > 0) {
                return true;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return false;
    }
}
