package com.iotbay.dao;

import com.iotbay.iotbaydemo.User;
import java.sql.*;
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
 
    public void makeOrder(int customer_id, int product_id, double price, String street_address, String city_address, String state, String postcode
    ) throws SQLException {
        // Convert LocalDateTime to string representation
        String timestamp = Utils.getLocalTimestamp().toString();

        // Insert order into order history directly using the provided SQL statement
    st.executeUpdate("INSERT INTO `iotbay-database`.order_history (customer_id, product_id, price, ordertime, first_name,"
            + " last_name, street_address, city_address, state, postcode) " +
        "VALUES (" + customer_id + ", " + product_id + ", (SELECT unitPrice FROM `iotbay-database`.products WHERE productId ="
                + " " + product_id + "), '" + timestamp + "', (SELECT firstName FROM `iotbay-database`.users WHERE id = "
            + "" + customer_id + "), (SELECT lastName FROM `iotbay-database`.users WHERE id = "
            + "" + customer_id + "), '" + street_address + "', '" + city_address + "', '" + state + "', '" + postcode + "')");
    }
    
    
    
        }




      


