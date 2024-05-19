package com.iotbay.controller;

import com.iotbay.dao.DBConnector;
import com.iotbay.dao.DBManager;
import com.iotbay.iotbaydemo.User;
import com.iotbay.iotbaydemo.UserLogs;

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
import java.util.List;

public class user_logs_view extends HttpServlet {

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<UserLogs> logEntries;
        try {
            DBConnector connector = new DBConnector();
            Connection conn = connector.openConnection();
            DBManager db = new DBManager(conn);
            HttpSession session = request.getSession();
            int uid = ((User) session.getAttribute("user")).getId();
            
            logEntries = db.getLogs(uid);
            
            System.out.println(((UserLogs) logEntries.get(0)).getLogAction());
            
            request.setAttribute("logEntries", logEntries);
        } catch (ClassNotFoundException | SQLException ex) {
            
            Logger.getLogger(TestDB.class.getName()).log(Level.SEVERE, null, ex);
            response.sendRedirect("sqlError.html");
        } finally {
            request.getRequestDispatcher("/logsPage.jsp").forward(request, response);
        }
    }
}
