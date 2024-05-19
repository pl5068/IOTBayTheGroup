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

public class order_add extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            DBConnector connector = new DBConnector();
            Connection conn = connector.openConnection();
            DBManager db = new DBManager(conn);

            HttpSession session = request.getSession();
            User user = (User) session.getAttribute("user");

            int uid = user.getId();
            String orderNumberString = (String) session.getAttribute("orderNumber");
            String productIdString = request.getParameter("productId"); 

            if (orderNumberString == null) {
                orderNumberString = db.createOrder(uid);
                session.setAttribute("orderNumber", orderNumberString);
            }

            int orderNumber = Integer.parseInt(orderNumberString);
            int productId = Integer.parseInt(productIdString);

            db.createOrderLine(orderNumber, productId);

            // Redirect to a success page or back to the product page
            
            
            
            
            response.sendRedirect("catalogue_view");

        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(order_add.class.getName()).log(Level.SEVERE, null, ex);
            throw new ServletException(ex);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Optional: Implement doGet method if needed, otherwise it can be removed.
    }

   
}