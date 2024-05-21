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

public class user_edit_admin extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            DBConnector connector = new DBConnector();
            Connection conn = connector.openConnection();
            DBManager db = new DBManager(conn);

            int id = Integer.parseInt(request.getParameter("id"));
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            String firstName = request.getParameter("firstName");
            String lastName = request.getParameter("lastName");
            String dob = request.getParameter("dob");
            String userRole = request.getParameter("userRole");
            String phoneNumber = request.getParameter("phoneNumber");

            db.editContactsNew(id, email, firstName, lastName, dob, phoneNumber, password, userRole);

            HttpSession session = request.getSession();
            User sessionUser = (User) session.getAttribute("user");

            if (sessionUser != null && sessionUser.getId() == id) {
                sessionUser.setEmail(email);
                sessionUser.setPassword(password);
                sessionUser.setFirstName(firstName);
                sessionUser.setLastName(lastName);
                sessionUser.setDob(dob);
                sessionUser.setPhoneNumber(phoneNumber);
                sessionUser.setUserRole(userRole);
                session.setAttribute("user", sessionUser);
            }

            conn.close();
            response.sendRedirect("user_list_admin");
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(user_edit_admin.class.getName()).log(Level.SEVERE, null, ex);
            response.sendRedirect("sqlError.html");
        }
    }
}