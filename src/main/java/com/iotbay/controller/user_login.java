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

public class user_login extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            
            DBConnector connector = new DBConnector();

            Connection conn = connector.openConnection();

            DBManager db = new DBManager(conn);

            String email = request.getParameter("email");
            String password = request.getParameter("password");
            
            
            
            User user = db.findUser(email, password);
            HttpSession session = request.getSession();

            if (user != null) {
                session.setAttribute("user", user);
                db.logInTimestamp(user.getId());
                response.sendRedirect("catalogue_view");
                conn.close();
                return;
            }
            request.getRequestDispatcher("logInPage.jsp").forward(request,response);
            
            conn.close();
        } catch (ClassNotFoundException | SQLException ex) {

            Logger.getLogger(TestDB.class.getName()).log(Level.SEVERE, null, ex);
            response.sendRedirect("sqlError.html");
        }
    }


}
