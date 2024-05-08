package com.iotbay.dao;

import java.sql.Connection;

public abstract class DB {   

protected String URL="jdbc:mysql://iotbay-dev.mysql.database.azure.com:3306/mysql?useSSL=false";
protected String db = "iotbay-database";
protected String dbuser = "iotadmin";
protected String dbpass = "@'t'wJY8xAnzv.H";
protected String driver = "com.mysql.jdbc.Driver";   
protected Connection conn;

}