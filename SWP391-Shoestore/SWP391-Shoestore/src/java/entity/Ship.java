/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entity;

public class Ship {
    int id ;
    String cityName ; 
    int shipPrice ;

    public Ship() {
    }

    public Ship(int id, String cityName, int shipPrice) {
        this.id = id;
        this.cityName = cityName;
        this.shipPrice = shipPrice;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getCityName() {
        return cityName;
    }

    public void setCityName(String cityName) {
        this.cityName = cityName;
    }

    public int getShipPrice() {
        return shipPrice;
    }

    public void setShipPrice(int shipPrice) {
        this.shipPrice = shipPrice;
    }
}
