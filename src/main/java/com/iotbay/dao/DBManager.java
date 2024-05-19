package com.iotbay.dao;

import com.iotbay.iotbaydemo.Product;
import com.iotbay.iotbaydemo.User;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import misc.Utils;

public class DBManager {

    private Statement st;

    public DBManager(Connection conn) throws SQLException {
        st = conn.createStatement();
    }

//Find user by email and password in the database   
    public User findUser(String email, String password) throws SQLException {
        String fetch = "select * from `iotbay-database`.users where EMAIL = '" + email + "' and PASSWORD='" + password + "'";
        ResultSet rs = st.executeQuery(fetch);

        while (rs.next()) {
            String userEmail = rs.getString(2);
            String userPassword = rs.getString(5);
            if (userEmail.equals(email) && userPassword.equals(password)) {
                int userId = rs.getInt(1);
                String userFirstName = rs.getString(3);
                String userLastName = rs.getString(4);
                String userDOB = rs.getString(6);
                String userPhoneNumber = rs.getString(7);
                String userRole = rs.getString(8);
                return new User(userId, userEmail, userFirstName, userLastName, userPassword, userDOB, userPhoneNumber, userRole);
            }
        }

        return null;
    }

    public void logInTimestamp(int uid) throws SQLException {
        st.executeUpdate("insert into `iotbay-database`.access_log (userid, log_action, time_operation) values ('" + uid + "','logIn', '" + Utils.getLocalTimestamp() + "')");
    }

    public void logOutTimestamp(int uid) throws SQLException {
        st.executeUpdate("insert into `iotbay-database`.access_log (userid, log_action, time_operation) values ('" + uid + "','logOut', '" + Utils.getLocalTimestamp() + "')");
    }

//Add a user-data into the database   
    public void addUser(String email, String firstName, String lastName, String password, String dob, String phoneNumber, String role) throws SQLException { 
        st.executeUpdate("INSERT INTO `iotbay-database`.users (email, firstName, lastName, password, dob, phoneNumber, userRole) VALUES ('" + email + "', '" + firstName + "', '" + lastName + "', '" + password + "', '" + dob + "', '" + phoneNumber + "', '" + role + "')" );
        ResultSet rs = st.executeQuery("select id from `iotbay-database`.users where EMAIL = '" + email + "'");
        rs.next();
        int uid = rs.getInt(1);
        String q = "insert into `iotbay-database`.access_log (userid, log_action, time_operation) values ('" + uid + "','regUser', '" + Utils.getLocalTimestamp() + "')";
        st.executeUpdate(q);
    }

//update a user details in the database   
    public void updateUser(int id, String email, String firstName, String lastName, String password, String dob, String phoneNumber) throws SQLException {
        //code for update-operation   

    }

//delete a user from the database   
    public void deleteUser(int id) throws SQLException {
        //code for delete-operation   

    }

    public void addDeliveryInfo(String first, String surname, String street, String city, String state, String postcode) throws SQLException {
        st.executeUpdate("INSERT INTO `iotbay-database`.order_history (first_name, last_name, street_address, city_address, state_address, postcode) values ('" + first + "', '" + surname + "', '" + street + "', '" + city + "', '" + state + "', '" + postcode + "')");
    }

    public void retrieveItem(int productId, int quantity) throws SQLException {

        String get = "SELECT * FROM `iotbay-database`.products WHERE productId = " + productId + " AND quantity = " + quantity;

        ResultSet rs = st.executeQuery(get);

    }

    public String createOrder(int uid) throws SQLException {

        String query = "INSERT INTO `iotbay-database`.order_history (customer_id) values (" + uid + ");";
        st.executeUpdate(query, Statement.RETURN_GENERATED_KEYS);

        try (ResultSet generatedKeys = st.getGeneratedKeys()) {

            if (generatedKeys.next()) {

                return String.valueOf(generatedKeys.getInt(1));

            } else {

                throw new SQLException("Creating user failed, no ID obtained.");

            }

        }

    }

    public void createOrderLine(int orderid, int productid) throws SQLException {
        String query = "INSERT INTO `iotbay-database`.order_lines (orderid, productId) values (" + orderid + ", " + productid + ");";
        st.executeUpdate(query);

    }

    public int getOrderId() throws SQLException {
        int orderId = 0; // Initialize orderId to handle the case where no result is found
        ResultSet rs = st.executeQuery("SELECT MAX(orderid) AS max_orderid FROM `iotbay-database`.`order_lines`");
        if (rs.next()) {
            orderId = rs.getInt("max_orderid");
        }
        return orderId;
    }

    public List<Product> orderLines(int uid) throws SQLException {
        String query = "SELECT *  FROM `iotbay-database`.products WHERE productID=(SELECT productID  FROM `iotbay-database`.order_lines  WHERE orderid = "+uid+");";

        List<Product> products = new ArrayList<>();

        ResultSet rs = st.executeQuery(query);
        while (rs.next()) {
            int id = rs.getInt("productID");
            String name = rs.getString("name");
            String description = rs.getString("description");
            double unitPrice = rs.getDouble("unitPrice");
            int stock = rs.getInt("unitStock");
            String category = rs.getString("category");

            products.add(new Product(id, name, description, unitPrice, stock, category));
        }

        return products;
    }
}
