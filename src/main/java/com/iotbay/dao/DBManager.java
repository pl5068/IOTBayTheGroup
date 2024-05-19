package com.iotbay.dao;

import com.iotbay.iotbaydemo.User;
import com.iotbay.iotbaydemo.UserLogs;
import java.sql.*;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
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
    public User addUser(String email, String firstName, String lastName, String password, String dob, String phoneNumber, String role) throws SQLException { 
        st.executeUpdate("INSERT INTO `iotbay-database`.users (email, firstName, lastName, password, dob, phoneNumber, userRole) VALUES ('" + email + "', '" + firstName + "', '" + lastName + "', '" + password + "', '" + dob + "', '" + phoneNumber + "', '" + role + "')" );
        ResultSet rs = st.executeQuery("select id from `iotbay-database`.users where EMAIL = '" + email + "'");
        rs.next();
        int uid = rs.getInt(1);
        String q = "insert into `iotbay-database`.access_log (userid, log_action, time_operation) values ('" + uid + "','regUser', '" + Utils.getLocalTimestamp() + "')";
        st.executeUpdate(q);
        return findUser(email, password);
    }

//update a user details in the database   
    public void updateUser(int id, String email, String firstName, String lastName, String password, String dob, String phoneNumber) throws SQLException {
        //code for update-operation   

    }

//delete a user from the database   
    public void deleteUser(int id) throws SQLException {
        st.executeUpdate("insert into `iotbay-database`.access_log (userid, log_action, time_operation) values ('" + id + "','deleteUser', '" + Utils.getLocalTimestamp() + "');");
        st.executeUpdate("SET foreign_key_checks = 0;");
        st.executeUpdate(" DELETE FROM `iotbay-database`.users WHERE id=" + id + "; ");
        st.executeUpdate("SET foreign_key_checks = 1;");
    }

    public void editContacts(int id, String email, String ph) throws SQLException {
        st.executeUpdate("update `iotbay-database`.users set email='" + email + "', phoneNumber='" + ph + "' where id = " + id + ";");
    }
    
    public List<UserLogs> getLogs(int uid) throws SQLException {
        ResultSet rs = st.executeQuery("select * from `iotbay-database`.access_log where userid = " +  uid + " order by time_operation desc;");
        List<UserLogs> logs = new ArrayList<UserLogs>();
        
        while (rs.next()) {
            int logId = rs.getInt(1);
            int userId = rs.getInt(2);
            String logAction = rs.getString(3);
            Timestamp timeOperation = rs.getTimestamp(4);
            logs.add(new UserLogs(logId, userId, logAction, timeOperation));
        }
        
        return logs;
    }

}
