package com.iotbay.dao;

import com.iotbay.iotbaydemo.User;
import java.sql.*;

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
            String userPassword = rs.getString(4);
            if (userEmail.equals(email) && userPassword.equals(password)) {
                int userId = rs.getInt(1);
                String userFirstName = rs.getString(3);
                String userDOB = rs.getString(5);
                return new User(userId, userEmail, userFirstName, userPassword, userDOB);
            }
        }
        
        return null;
    }

//Add a user-data into the database   
    public void addUser(String email, String firstName, String password, String dob) throws SQLException { 
        st.executeUpdate("INSERT INTO `iotbay-database`.users (email, firstName, password, dob) VALUES ('" + email + "', '" + firstName + "', '" + password + "', '" + dob + "')");
    }

//update a user details in the database   
    public void updateUser(int id, String email, String firstName, String password, String dob) throws SQLException {
        //code for update-operation   

    }

//delete a user from the database   
    public void deleteUser(int id) throws SQLException {
        //code for delete-operation   

    }

}
