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
            String dob = request.getParameter("dob");

            System.out.print(email + password + firstName + dob);
            HttpSession session = request.getSession();
            if ( email != null && password != null && firstName != null && dob != null) {

                db.addUser(email, firstName, password, dob);
                User user = new User(email, firstName, password, dob);
                System.out.print(user.getEmail());
                session.setAttribute("user", user);
                response.sendRedirect("welcomePage.jsp");
                conn.close();
                return;
            }
            request.getRequestDispatcher("registerPage.jsp").forward(request, response);
            conn.close();
        } catch (ClassNotFoundException | SQLException ex) {

            Logger.getLogger(TestDB.class.getName()).log(Level.SEVERE, null, ex);

        }
    }

}
