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

public class user_register extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            DBConnector connector = new DBConnector();

            Connection conn = connector.openConnection();

            DBManager db = new DBManager(conn);
            

            String email = request.getParameter("email");
            String password = request.getParameter("password");
            String firstName = request.getParameter("firstName");
            String lastName = request.getParameter("lastName");
            String dob = request.getParameter("dob");
            String phoneNumber = request.getParameter("phoneNumber");

            HttpSession session = request.getSession();
            if ( email != null && password != null && firstName != null && lastName != null && dob != null && phoneNumber != null) {

                User user = db.addUser(email, firstName, lastName, password, dob, phoneNumber, "customer");

                
                
               
                response.sendRedirect("checkoutPage.jsp");
                conn.close();
                return;
            }
            request.getRequestDispatcher("registerPage.jsp").forward(request, response);
            conn.close();
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(TestDB.class.getName()).log(Level.SEVERE, null, ex);
            response.sendRedirect("sqlError.html");
        }
    }

}
