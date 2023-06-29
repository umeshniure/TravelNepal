package com.dao;

import com.config.Config;
import com.model.Packages;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.sql.Date;
import java.util.List;

public class PackagesDAO {
    public boolean insertPackage(Packages newPackage) throws SQLException {
        String INSERT_PACKAGE_SQL = "INSERT INTO packages" + "  (title, description, location, people, duration, price,  agencyid , picture, updated_date, category) VALUES " + " (?, ?, ?, ?, ?, ?, ?, ?, ?, ?);";

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
            preparedStatement.setInt(10, newPackage.getCategory());
            if (preparedStatement.executeUpdate() > 0) {
                return true;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return false;
    }
    
    public boolean updatePackage(int id, Packages newPackage){
        String INSERT_PACKAGE_SQL = "Update packages set title=?, description=?, location=?, people=?, duration=?, price=?,  agencyid=?, picture=?, updated_date=?, category=? WHERE id = ?;";

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
            preparedStatement.setInt(10, newPackage.getCategory());
            preparedStatement.setInt(11, id);
            if (preparedStatement.executeUpdate() > 0) {
                return true;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return false;
    }
    
    public List<Packages> getPackageList(){
        List<Packages> packageList = new ArrayList<>();
        String GET_PACKAGES_SQL = "SELECT * from packages;";

        try {
            Connection connection = Config.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(GET_PACKAGES_SQL);
            ResultSet rs = preparedStatement.executeQuery();
            while(rs.next()){       
                Date date= Date.valueOf(rs.getString("updated_date"));
                Packages packag = new Packages(rs.getInt("id"),rs.getString("title"),rs.getInt("category"),rs.getString("description"), rs.getString("location"),rs.getInt("people"),rs.getInt("duration"),rs.getDouble("price"),rs.getInt("agencyid"),rs.getString("picture"),date);
                packageList.add(packag);
            }
        }catch(SQLException e){
            System.out.println(e);
        }
        
        return packageList;
    }

    public Packages getPackage(int id){
        Packages packag = null;
        String GET_PACKAGES_SQL = "SELECT * from packages where id =?;";

        try {
            Connection connection = Config.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(GET_PACKAGES_SQL);
            preparedStatement.setInt(1, id);
            ResultSet rs = preparedStatement.executeQuery();
            while(rs.next()){       
                Date date= Date.valueOf(rs.getString("updated_date"));
                packag = new Packages(rs.getInt("id"),rs.getString("title"),rs.getInt("category"),rs.getString("description"), rs.getString("location"),rs.getInt("people"),rs.getInt("duration"),rs.getDouble("price"),rs.getInt("agencyid"),rs.getString("picture"),date);
            }
        }catch(SQLException e){
            System.out.println(e);
        }
        
        return packag;
    }
    
    public boolean deletePackage(int id){
        String INSERT_PACKAGE_SQL = "DELETE from packages WHERE id = ?;";

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
