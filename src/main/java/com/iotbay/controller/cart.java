/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

package com.iotbay.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

import java.util.HashMap;
import java.util.Map;

public class cart {

    private Map<Integer, Integer> items; // Map of product ID to quantity

    public cart() {
        this.items = new HashMap<>();
    }

    // Add an item to the cart with a specified quantity
    public void addItem(int productId, int quantity) {
        if (items.containsKey(productId)) {
            int existingQuantity = items.get(productId);
            items.put(productId, existingQuantity + quantity);
        } else {
            items.put(productId, quantity);
        }
    }

    // Remove an item from the cart
    public void removeItem(int productId) {
        items.remove(productId);
    }

    // Update the quantity of an item in the cart
    public void updateQuantity(int productId, int quantity) {
        if (quantity <= 0) {
            removeItem(productId);
        } else {
            items.put(productId, quantity);
        }
    }

    // Get the total number of items in the cart
    public int getTotalItems() {
        int total = 0;
        for (int quantity : items.values()) {
            total += quantity;
        }
        return total;
    }

    // Get the total price of all items in the cart
    // You would typically need a separate method to calculate the total price based on product prices
    // This method only returns the total quantity of items in the cart
    public double getTotalPrice() {
        // Assuming each product has a unit price and we need to calculate the total price based on the quantity of each item
        double totalPrice = 0;
        // Iterate through items and calculate total price
        // totalPrice += (quantity * unitPrice) for each item
        return totalPrice;
    }

    // Get the map of items in the cart (Product ID -> Quantity)
    public Map<Integer, Integer> getItems() {
        return items;
    }
}