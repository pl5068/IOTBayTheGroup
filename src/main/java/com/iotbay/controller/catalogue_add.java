package com.iotbay.controller;

import com.iotbay.dao.DBConnector;
import com.iotbay.dao.Products;
import com.iotbay.iotbaydemo.Product;

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

public class catalogue_add extends HttpServlet {
  @Override
  public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    try {
      DBConnector connector = new DBConnector();
      Connection conn = connector.openConnection();
      Products db = new Products(conn);

      String name = request.getParameter("name");
      String description = request.getParameter("description");
      String unitPrice = request.getParameter("price");
      String unitStock = request.getParameter("stock");
      String category = request.getParameter("category");

      InputValidator validator = new InputValidator();

      validator.isPriceValid(unitPrice)
        .isProductNameValid(name)
        .isStockValid(unitStock);

      if (validator.isValid()) {
        db.add(name, description, Double.parseDouble(unitPrice), Integer.parseInt(unitStock), category);
      } else {
        // this is immediately cleaned up in catalogue.jsp
        HttpSession session = request.getSession();
        session.setAttribute("errorMessage", validator.getErrorMessage());
      }
    } catch (ClassNotFoundException | SQLException ex) {
      Logger.getLogger(TestDB.class.getName()).log(Level.SEVERE, null, ex);
    } finally {
      response.sendRedirect("catalogue_view");
    }
  }
}