package com.iotbay.controller;

import com.iotbay.dao.DBConnector;
import com.iotbay.dao.DBManager;
import com.iotbay.iotbaydemo.User;

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

public class Cart extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        
        
        System.out.print("Hello");
        // Retrieve form data
        int productId = Integer.parseInt(request.getParameter("productId"));
        double price = Double.parseDouble(request.getParameter("price"));

        request.setCharacterEncoding("UTF-8");

        HttpSession session = request.getSession();

        User user = (User) session.getAttribute("user");

        int customerId = user.getId();

        // Retrieve form data
        String street = request.getParameter("street");
        String city = request.getParameter("city");
        String state = request.getParameter("state");
        String postcode = request.getParameter("postcode");

        try {
            DBConnector connector = new DBConnector();

            Connection conn = connector.openConnection();

            DBManager db = new DBManager(conn);

            // Get customer id from session
            db.makeOrder(customerId, productId, price, street, city, state, postcode);

            request.getRequestDispatcher("checkoutPage.jsp").forward(request, response);
            conn.close();

        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(Cart.class.getName()).log(Level.SEVERE, null, ex);
        }

    }
}
