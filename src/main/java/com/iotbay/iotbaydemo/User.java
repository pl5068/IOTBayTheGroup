
package com.iotbay.iotbaydemo;


public class User {
    private String email;
    private String firstName;
    private String password;
    private String dob;
    
    public User(String email, String firstName, String password, String dob) {
        this.email = email;
        this.firstName = firstName;
        this.password = password;
        this.dob = dob;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getDob() {
        return dob;
    }

    public void setDob(String dob) {
        this.dob = dob;
    }
    
    
}

