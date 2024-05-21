package com.iotbay.controller;

import java.util.ArrayList;
import java.util.List;

public class InputValidator {
  private boolean valid = true;
  private final List<String> errors;

  public InputValidator() {
      this.errors = new ArrayList<>();
  }

  public boolean isValid() {
    return valid;
  }

  public List<String> getErrors() {
    return errors;
  }

  public String getErrorMessage() {
    return String.join("\n", errors);
  }

  public InputValidator isPriceValid(String number) {
    try {
      double price = Double.parseDouble(number);

      if (price <= 0) {
        valid = false;
        errors.add("Price must be positive.");
      }
    } catch (NumberFormatException e) {
      valid = false;
      errors.add("Price must be a number.");
    }

    return this;
  }

  public InputValidator isStockValid(String number) {
    try {
      Integer stock = Integer.parseInt(number);

      if (stock < 0) {
        valid = false;
        errors.add("Stock must be non-negative.");
      }
    } catch (NumberFormatException e) {
      valid = false;
      errors.add("Stock must be a number.");
    }

    return this;
  }

  public InputValidator isProductNameValid(String name) {
    if (name == null || name.length() == 0) {
      valid = false;
      errors.add("Product name cannot be empty.");
    }

    return this;
  }
}