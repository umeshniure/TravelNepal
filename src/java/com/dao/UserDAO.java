package com.dao;

import com.config.Config;
import com.model.Users;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
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

    public Users selectUserByEmailAndPassword(String email, String password) {
        String SELECT_USER_BY_EMAIL_AND_PASSWORD = "select id, user_type, name from users where email = ? and password = ?";
        Users user = null;
        try {
            Connection connection = Config.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_USER_BY_EMAIL_AND_PASSWORD);
            preparedStatement.setString(1, email);
            preparedStatement.setString(2, password);
            ResultSet rs = preparedStatement.executeQuery();
            if (rs.next()) {
                int id = rs.getInt("id");
                int user_type = rs.getInt("user_type");
                String firstname = rs.getString("name");
                user = new Users(id, user_type, firstname);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return user;
    }
}
