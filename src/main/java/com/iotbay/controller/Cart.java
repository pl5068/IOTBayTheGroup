package com.iotbay.controller;

import com.iotbay.dao.DBConnector;
import com.iotbay.dao.DBManager;
import com.iotbay.dao.Products;
import com.iotbay.iotbaydemo.Product;
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
import java.util.ArrayList;
import java.util.List;

public class Cart extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        System.out.print("Hello");
        // Retrieve form data

        request.setCharacterEncoding("UTF-8");

        HttpSession session = request.getSession();

        try {
            DBConnector connector = new DBConnector();

            Connection conn = connector.openConnection();

            DBManager db = new DBManager(conn);
            Products product = new Products(conn);
            int orderId = db.getOrderId();
            
           
           List<Product> products;
                    
                   
               
            products = db.orderLines(orderId) ;
            
             request.setAttribute("cartItems", products);
         /*
            request.setAttribute("attributeName", attributeObject);   */
            request.getRequestDispatcher("cart.jsp").forward(request, response);
            conn.close();
            // Get customer id from session
            /*  db.makeOrder(customerId, productId, price, street, city, state, postcode);*/

        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(Cart.class.getName()).log(Level.SEVERE, null, ex);
        }

    }
}
