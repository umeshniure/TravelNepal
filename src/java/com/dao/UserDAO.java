package com.dao;

import com.config.Config;
import com.model.Users;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class UserDAO {

    public boolean insertUser(Users newUser) throws SQLException {
        String INSERT_USER_SQL = "INSERT INTO users" + "  (name, email, phone, address, pan, dob, password, user_type) VALUES " + " (?, ?, ?, ?, ?, ?, ?, ?);";

        try {
            Connection connection = Config.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(INSERT_USER_SQL);
            preparedStatement.setString(1, newUser.getName());
            preparedStatement.setString(2, newUser.getEmail());
            preparedStatement.setLong(3, newUser.getPhone_number());
            preparedStatement.setString(4, newUser.getAddress());
            preparedStatement.setLong(5, newUser.getPan());
            preparedStatement.setDate(6, newUser.getDob());
            preparedStatement.setString(7, newUser.getPassword());
            preparedStatement.setInt(8, newUser.getUser_type());
            if (preparedStatement.executeUpdate() > 0) {
                return true;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return false;
    }
}