package com.iotbay.iotbaydemo;

public class Product {
    private int id;
    private String name;
    private String description;
    private double unitPrice;
    private int unitStock;
    private String category;

    public Product(String name, String description, double unitPrice, int unitStock, String category) {
        this.name = name;
        this.description = description;
        this.unitPrice = unitPrice;
        this.unitStock = unitStock;
        this.category = category;
    }

    public Product(int id, String name, String description, double unitPrice, int unitStock, String category) {
        this.id = id;
        this.name = name;
        this.description = description;
        this.unitPrice = unitPrice;
        this.unitStock = unitStock;
        this.category = category;
    }
    
    public int getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public double getUnitPrice() {
        return unitPrice;
    }

    public int getDollars() {
        return (int) unitPrice;
    }

    public int getCents() {
        return (int) Math.round((unitPrice - (int) unitPrice) * 100);
    }

    public void setUnitPrice(double unitPrice) {
        this.unitPrice = unitPrice;
    }

    public int getUnitStock() {
        return unitStock;
    }

    public void setUnitStock(int unitStock) {
        this.unitStock = unitStock;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }
}

