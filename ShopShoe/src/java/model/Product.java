/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**
 *
 * @author chi
 */
public class Product {
    private int id;
    private String name;
    private String description;
    private double price;
    private int CategoryID;
    private int StockQuantity;
    private String image;
    

    public Product() {
    }

    public Product(int id, String name, String description, double price, int CategoryID, int StockQuantity, String image) {
        this.id = id;
        this.name = name;
        this.description = description;
        this.price = price;
        this.CategoryID = CategoryID;
        this.StockQuantity = StockQuantity;
        this.image = image;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
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

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getCategoryID() {
        return CategoryID;
    }

    public void setCategoryID(int CategoryID) {
        this.CategoryID = CategoryID;
    }

    public int getStockQuantity() {
        return StockQuantity;
    }

    public void setStockQuantity(int StockQuantity) {
        this.StockQuantity = StockQuantity;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    

    
    
    
}
