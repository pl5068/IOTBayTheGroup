package com.iotbay.dao;

import com.iotbay.iotbaydemo.Product;
import com.iotbay.iotbaydemo.User;
import com.iotbay.iotbaydemo.UserLogs;
import java.sql.*;
import java.sql.Timestamp;
import java.util.Date;
import misc.Utils;
import java.util.ArrayList;
import java.util.List;

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
        st.executeUpdate("insert into `iotbay-database`.access_log (userid, log_action, time_operation) values ('" + uid + "','logIn', CURRENT_TIMESTAMP()) ;");
    }

    public void logOutTimestamp(int uid) throws SQLException {
        st.executeUpdate("insert into `iotbay-database`.access_log (userid, log_action, time_operation) values ('" + uid + "','logOut', NOW());");
    }

//Add a user-data into the database   
    public User addUser(String email, String firstName, String lastName, String password, String dob, String phoneNumber, String role) throws SQLException {
        st.executeUpdate("INSERT INTO `iotbay-database`.users (email, firstName, lastName, password, dob, phoneNumber, userRole) VALUES ('" + email + "', '" + firstName + "', '" + lastName + "', '" + password + "', '" + dob + "', '" + phoneNumber + "', '" + role + "')", Statement.RETURN_GENERATED_KEYS);
        ResultSet rs = st.executeQuery("select id from `iotbay-database`.users where EMAIL = '" + email + "'");
        rs.next();
        int uid = rs.getInt(1);
        String q = "insert into `iotbay-database`.access_log (userid, log_action, time_operation) values ('" + uid + "','regUser', NOW()) ;";
        st.executeUpdate(q);
        return findUser(email, password);
    }

//update a user details in the database   
    public void updateUser(int id, String email, String firstName, String lastName, String password, String dob, String phoneNumber) throws SQLException {
        //code for update-operation   

    }

//delete a user from the database   
    public void deleteUser(int id) throws SQLException {
        st.executeUpdate("insert into `iotbay-database`.access_log (userid, log_action, time_operation) values ('" + id + "','deleteUser', CURRENT_TIMESTAMP()) ;");
        st.executeUpdate("SET foreign_key_checks = 0;");
        st.executeUpdate(" DELETE FROM `iotbay-database`.users WHERE id=" + id + "; ");
        st.executeUpdate("SET foreign_key_checks = 1;");
    }

    public void editContacts(int id, String email, String ph) throws SQLException {
        st.executeUpdate("update `iotbay-database`.users set email='" + email + "', phoneNumber='" + ph + "' where id = " + id + ";");
    }

    public void editContactsNew(int id, String email, String firstName, String lastName, String dob, String phoneNumber, String password, String userRole) throws SQLException {
        String query = "UPDATE `iotbay-database`.users SET email=?, firstName=?, lastName=?, dob=?, phoneNumber=?, password=?, userRole=? WHERE id=?";
        try (PreparedStatement ps = st.getConnection().prepareStatement(query)) {
            ps.setString(1, email);
            ps.setString(2, firstName);
            ps.setString(3, lastName);
            ps.setString(4, dob);
            ps.setString(5, phoneNumber);
            ps.setString(6, password);
            ps.setString(7, userRole);
            ps.setInt(8, id);
            ps.executeUpdate();
        }
    }

    public List<UserLogs> getLogs(int uid) throws SQLException {
        ResultSet rs = st.executeQuery("select * from `iotbay-database`.access_log where userid = " + uid + " order by time_operation desc;");
        List<UserLogs> logs = new ArrayList<UserLogs>();

        while (rs.next()) {
            int logId = rs.getInt(1);
            int userId = rs.getInt(2);
            String logAction = rs.getString(3);
            Timestamp timeOperation = rs.getTimestamp(4);
            logs.add(new UserLogs(logId, userId, logAction, timeOperation.toString()));
        }

        return logs;
    }

    public List<User> getAllUsers() throws SQLException {
        List<User> users = new ArrayList<>();
        String query = "SELECT * FROM `iotbay-database`.users";
        ResultSet rs = st.executeQuery(query);
        while (rs.next()) {
            int id = rs.getInt("id");
            String email = rs.getString("email");
            String firstName = rs.getString("firstName");
            String lastName = rs.getString("lastName");
            String password = rs.getString("password");
            String dob = rs.getString("dob");
            String phoneNumber = rs.getString("phoneNumber");
            String userRole = rs.getString("userRole");
            users.add(new User(id, email, firstName, lastName, password, dob, phoneNumber, userRole));
        }
        return users;
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
        String query = "SELECT *  FROM `iotbay-database`.products WHERE productID=(SELECT productID  FROM `iotbay-database`.order_lines  WHERE orderid = " + uid + ");";

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
