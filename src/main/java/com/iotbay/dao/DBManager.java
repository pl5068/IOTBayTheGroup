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
        String fetch = "select * from ISDUSER.users where EMAIL = '" + email + "' and PASSWORD='" + password + "'"; 
        ResultSet rs = st.executeQuery(fetch);
        
        while (rs.next()) {
            String userEmail = rs.getString(1);
            String userPassword = rs.getString(3);
            if (userEmail.equals(email) && userPassword.equals(password)) {
                String userFirstName = rs.getString(2);
                String userDOB = rs.getString(4);
                return new User(userEmail, userFirstName, userPassword, userDOB);
            }
        }
        
        return null;
    }

//Add a user-data into the database   
    public void addUser(String email, String firstName, String password, String dob) throws SQLException { 
        st.executeUpdate("INSERT INTO ISDUSER.users VALUES ('" + email + "', '" + firstName + "', '" + password + "', '" + dob + "');");
    }

//update a user details in the database   
    public void updateUser(String email, String firstName, String password, String dob) throws SQLException {
        //code for update-operation   

    }

//delete a user from the database   
    public void deleteUser(String email) throws SQLException {
        //code for delete-operation   

    }

}
