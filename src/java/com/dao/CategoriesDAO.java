package com.dao;

import com.config.Config;
import com.model.Category;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class CategoriesDAO {
    public List<Category> selectAllCategory() {
        String SELECT_ALL_CATEGORY = "select * from categories";
        List<Category> category = new ArrayList<>();
        try {
            Connection connection = Config.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_CATEGORY);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                String category_name = rs.getString("name");
                int id = rs.getInt("id");
                category.add(new Category(id, category_name));
            }

        } catch (Exception e) {
            System.out.println(e);
        }
        return category;
    }
}
