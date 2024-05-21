package com.iotbay.controller;

import com.iotbay.dao.DBConnector;
import com.iotbay.dao.DBManager;
import com.iotbay.iotbaydemo.Product;
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
import java.util.ArrayList;
import java.util.List;

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
                session.setAttribute("cartItems", new ArrayList<Product>());
                session.setAttribute("cartItems", null);
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
