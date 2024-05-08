/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.iotbay.controller;



import java.io.IOException;
import javax.servlet.ServletException;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class AddToCartServlett extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Display the cart page
        // You may want to forward the request to a JSP page to display the cart
        // Example: request.getRequestDispatcher("cart.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            // Get product ID and quantity from request parameters
            int productId = Integer.parseInt(request.getParameter("productId"));
            int quantity = Integer.parseInt(request.getParameter("quantity"));

            // Retrieve the cart from session or create a new one if it doesn't exist
            HttpSession session = request.getSession();
            cart Cart = (cart) session.getAttribute("cart");
            if (Cart == null) {
                Cart = new cart();
                session.setAttribute("cart", Cart);
            }

            // Add the specified quantity of the specified product to the cart
            Cart.addItem(productId, quantity);

            // Redirect back to the product listing page or cart page
            response.sendRedirect("products.jsp");
        } catch (NumberFormatException ex) {
            // Handle invalid input
            response.sendError(HttpServletResponse.SC_BAD_REQUEST);
        }
    }

    @Override
    public String getServletInfo() {
        return "Cart Servlet";
    }
}