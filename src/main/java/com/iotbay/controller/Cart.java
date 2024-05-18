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


public class Cart extends HttpServlet {
    @Override
   protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
       
  
            
           // Retrieve form data
        int productId = Integer.parseInt(request.getParameter("productId"));
        double price = Double.parseDouble(request.getParameter("price"));
        int unitStock = Integer.parseInt(request.getParameter("unitStock"));
       
           request.setCharacterEncoding("UTF-8");
            String email = request.getParameter("email");
            String password = request.getParameter("password");
         
           
            String dob = request.getParameter("dob");
            String phoneNumber = request.getParameter("phoneNumber");
          

              HttpSession session = request.getSession();
              
            User user = (User) session.getAttribute("user") ;
            
            int customerId = user.getId() ;
            String firstName = user.getFirstName();
                   
            String lastName = user.getLastName(); 
            
      
    

          
    
        // Retrieve form data
   
        String street = request.getParameter("street");
        String city = request.getParameter("city");
        String state = request.getParameter("state");
        String postcode = request.getParameter("postcode");
        
        
         
       
         
      
     

       
       try {
              DBConnector connector = new DBConnector();

            Connection conn = connector.openConnection();

            DBManager db = new DBManager(conn);
       

 
        
       
        
     
        int quantity = Integer.parseInt(request.getParameter("quantity"));

        // Get customer id from session
 
         

       

        if(unitStock < 1 ){
           System.out.print("No stock available");
        } else {
           db.retrieveItem(productId, quantity);
           // Add item to the cart
           db.makeOrder(customerId, productId, price , street, city, state, postcode);
        }

     request.getRequestDispatcher("checkoutPage.jsp").forward(request, response);
               conn.close();
               
    } catch (ClassNotFoundException | SQLException ex) {
        Logger.getLogger(Cart.class.getName()).log(Level.SEVERE, null, ex);
    }
       
       
}
}