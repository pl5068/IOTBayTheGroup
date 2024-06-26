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

public class catalogue_view extends HttpServlet {
  @Override
  public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    List<Product> products;
    try {
      DBConnector connector = new DBConnector();
      Connection conn = connector.openConnection();
      Products db = new Products(conn);

      String search = request.getParameter("search");
      String sort = request.getParameter("sort");
      String category = request.getParameter("category");
      Boolean inStock = request.getParameter("inStock") != null;

      if (search != null && !search.isEmpty()) {
        products = db.search(search);
      } else {
        products = db.getAll();
      }

      if (category != null && !category.isEmpty() && !category.equals("all")) {
        products.removeIf(product -> product.getCategory() == null || !product.getCategory().equals(category));
      }

      if (inStock) {
        products.removeIf(product -> product.getUnitStock() <= 0);
      }

      if (sort != null && !sort.isEmpty()) {
        switch (sort) {
          case "name":
            products.sort((a, b) -> a.getName().compareTo(b.getName()));
            break;
          case "price":
            products.sort((a, b) -> Double.compare(a.getUnitPrice(), b.getUnitPrice()));
            break;
          case "price_desc":
            products.sort((a, b) -> Double.compare(b.getUnitPrice(), a.getUnitPrice()));
            break;
        }
      }

      request.setAttribute("products", products);
      request.setAttribute("categories", db.getCategories());
      request.setAttribute("search", search);
      request.setAttribute("sort", sort);
      request.setAttribute("category", category);
      request.setAttribute("inStock", inStock);
    } catch (ClassNotFoundException | SQLException ex) {
      Logger.getLogger(TestDB.class.getName()).log(Level.SEVERE, null, ex);
    } finally {
      request.getRequestDispatcher("/catalogue.jsp").forward(request, response);
    }
  }
}