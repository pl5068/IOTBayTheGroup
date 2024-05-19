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

public class user_edit extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
           
            DBConnector connector = new DBConnector();

            Connection conn = connector.openConnection();

            DBManager db = new DBManager(conn);

            int id = Integer.parseInt(request.getParameter("id"));
            String email = request.getParameter("email");
            String phoneNumber = request.getParameter("phoneNumber");

            db.editContacts(id, email, phoneNumber);
            
            HttpSession session = request.getSession();
            User user = (User) session.getAttribute("user");
            user.setEmail(email);
            user.setPhoneNumber(phoneNumber);
            session.setAttribute("user", user);
                        
            response.sendRedirect("profilePage.jsp");

            conn.close();

        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(TestDB.class.getName()).log(Level.SEVERE, null, ex);
            response.sendRedirect("sqlError.html");
        }
    }
}
