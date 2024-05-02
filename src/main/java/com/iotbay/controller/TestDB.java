package com.iotbay.controller;

import com.iotbay.dao.DBConnector;
import com.iotbay.dao.DBManager;
import java.sql.*;

import java.util.*;

import java.util.logging.*;

public class TestDB {

    private static Scanner in = new Scanner(System.in);

    public static void main(String[] args) {
        try {

            DBConnector connector = new DBConnector();

            Connection conn = connector.openConnection();

            DBManager db = new DBManager(conn);

            System.out.print("User email: ");

            String email = in.nextLine();

            System.out.print("User name: ");

            String firstName = in.nextLine();

            System.out.print("User password: ");

            String password = in.nextLine();

            System.out.print("User DOB: ");

            String dob = in.nextLine();

            //db.addUser(id, email, firstName, password, dob);

            System.out.println("User is added to the database.");

            connector.closeConnection();

        } catch (ClassNotFoundException | SQLException ex) {

            Logger.getLogger(TestDB.class.getName()).log(Level.SEVERE, null, ex);

        }

    }

}
