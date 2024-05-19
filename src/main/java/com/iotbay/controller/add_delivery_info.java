package com.iotbay.controller;

import com.iotbay.dao.DBConnector;
import com.iotbay.dao.DBManager;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class add_delivery_info extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            DBConnector connector = new DBConnector();
            Connection conn = connector.openConnection();
            DBManager db = new DBManager(conn);

            String first = request.getParameter("first");
            String surname = request.getParameter("surname");
            String street = request.getParameter("street");
            String city = request.getParameter("city");
            String state = request.getParameter("state");
            String postcode = request.getParameter("postcode");
            
            if (first != null && surname != null && street != null && city != null && state != null && postcode != null) {
                db.addDeliveryInfo(first, surname, street, city, state, postcode);
            }
            
            request.getRequestDispatcher("checkoutPage.jsp").forward(request, response);
            conn.close();
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(add_delivery_info.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
