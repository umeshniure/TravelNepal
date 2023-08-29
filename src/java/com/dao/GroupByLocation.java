/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.dao;

import com.config.Config;
import com.model.HotLocations;
import com.model.Packages;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Subin
 */
public class GroupByLocation {
    public List<HotLocations> getLocations(){
        String GET_PACKAGES_SQL = "SELECT *,COUNT(*) as count from packages group by location;";
        List<HotLocations> LocData = new ArrayList<>();
        try {
            Connection connection = Config.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(GET_PACKAGES_SQL);
            ResultSet rs = preparedStatement.executeQuery();
            while(rs.next()){  
                HotLocations packag = null;
                Date date= Date.valueOf(rs.getString("updated_date"));
                packag = new HotLocations(rs.getInt("count"),rs.getString("location"),rs.getString("picture"));
                
                LocData.add(packag);
            }
        }catch(SQLException e){
            System.out.println(e);
        }
        
        return LocData;
    }
}
