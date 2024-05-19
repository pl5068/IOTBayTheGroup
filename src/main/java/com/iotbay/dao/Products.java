package com.iotbay.dao;

import java.sql.*;
import java.sql.Timestamp;
import java.util.Date;
import misc.Utils;
import com.iotbay.iotbaydemo.Product;
import java.util.ArrayList;
import java.util.List;

public class Products {
  private static Statement st;

  public Products(Connection conn) throws SQLException {
      st = conn.createStatement();
  }

  public static Product get(int productID) throws SQLException {
    String fetch = "select * from `iotbay-database`.products where productID = '" + productID + "'"; 
    ResultSet rs = st.executeQuery(fetch);
    
    while (rs.next()) {
        int id = rs.getInt(1);
        String name = rs.getString(2);
        String description = rs.getString(3);
        double unitPrice = rs.getDouble(4);
        int unitStock = rs.getInt(5);
        String category = rs.getString(6);
        return new Product(id, name, description, unitPrice, unitStock, category);
    }
    
    return null;
  }

  public static List<Product> getAll() throws SQLException {
    String fetch = "select * from `iotbay-database`.products"; 
    ResultSet rs = st.executeQuery(fetch);
    List<Product> products = new ArrayList<Product>();
    
    while (rs.next()) {
        int id = rs.getInt(1);
        String name = rs.getString(2);
        String description = rs.getString(3);
        double unitPrice = rs.getDouble(4);
        int unitStock = rs.getInt(5);
        String category = rs.getString(6);
        products.add(new Product(id, name, description, unitPrice, unitStock, category));
    }
    
    return products;
  }

  public static List<Product> search(String name) throws SQLException {
    String fetch = "SELECT * FROM `iotbay-database`.products WHERE name LIKE '%" + name + "%'";

    ResultSet rs = st.executeQuery(fetch);
    List<Product> products = new ArrayList<Product>();
    
    while (rs.next()) {
        int id = rs.getInt(1);
        String productName = rs.getString(2);
        String description = rs.getString(3);
        double unitPrice = rs.getDouble(4);
        int unitStock = rs.getInt(5);
        String itemCategory = rs.getString(6);
        products.add(new Product(id, productName, description, unitPrice, unitStock, itemCategory));
    }
    
    return products;
  }

  public static void add(String name, String description, double unitPrice, int unitStock, String category) throws SQLException {
    String fetch = "insert into `iotbay-database`.products (name, description, unitPrice, unitStock, category) values ('" + name + "', '" + description + "', '" + unitPrice + "', '" + unitStock + "', '" + category + "')";
    st.executeUpdate(fetch);
  }

  public static void delete(int productID) throws SQLException {
    String fetch = "delete from `iotbay-database`.products where productID = '" + productID + "'";
    st.executeUpdate(fetch);
  }

  public static void update(int productID, String name, String description, double unitPrice, int unitStock, String category) throws SQLException {
    String fetch = "update `iotbay-database`.products set name = '" + name + "', description = '" + description + "', unitPrice = '" + unitPrice + "', unitStock = '" + unitStock + "', category = '" + category + "' where productID = '" + productID + "'";
    st.executeUpdate(fetch);
  }

  public static List<String> getCategories() throws SQLException {
    String fetch = "SELECT DISTINCT category FROM `iotbay-database`.products";
    ResultSet rs = st.executeQuery(fetch);
    List<String> categories = new ArrayList<String>();
    
    while (rs.next()) {
        String category = rs.getString(1);
        if (category != null && !category.isEmpty()) {
          categories.add(category);
        }
    }

    return categories;
  }
}