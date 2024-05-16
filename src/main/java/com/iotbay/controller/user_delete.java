package com.iotbay.controller;

import com.iotbay.dao.DBConnector;
import com.iotbay.dao.DBManager;
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
import java.util.HashSet;

public class user_delete extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            System.out.print("call post");
           
            DBConnector connector = new DBConnector();

            Connection conn = connector.openConnection();

            DBManager db = new DBManager(conn);

            String confirmed = request.getParameter("confirmed");

            if (confirmed.equals("no")) {               
                request.getRequestDispatcher("homePage.jsp").forward(request, response);
                return;
            }

            int id = Integer.parseInt(request.getParameter("id"));

            db.deleteUser(id);

            HttpSession session = request.getSession();
            // db.deleteTimestamp(user.getId());
            session.invalidate();
            response.sendRedirect("index.html");

            conn.close();

        } catch (ClassNotFoundException | SQLException ex) {

            Logger.getLogger(TestDB.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
