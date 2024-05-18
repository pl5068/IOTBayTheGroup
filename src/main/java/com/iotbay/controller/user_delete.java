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

public class user_delete extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
           
            DBConnector connector = new DBConnector();

            Connection conn = connector.openConnection();

            DBManager db = new DBManager(conn);

            String delete = request.getParameter("delete");

            if (!delete.equals("confirm")) {               
                request.getRequestDispatcher("profilePage.jsp").forward(request, response);
                return;
            }

            int id = Integer.parseInt(request.getParameter("id"));

            db.deleteUser(id);

            HttpSession session = request.getSession();
            // db.deleteTimestamp(user.getId());
            session.invalidate();
            
            response.sendRedirect("accountDeletedPage.html");

            conn.close();

        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(TestDB.class.getName()).log(Level.SEVERE, null, ex);
            response.sendRedirect("sqlError.html");
        }
    }
}
