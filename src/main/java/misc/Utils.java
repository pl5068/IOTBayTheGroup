/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package misc;

import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.time.ZonedDateTime;
import java.util.Date;
import java.time.LocalDateTime;  
import java.time.format.DateTimeFormatter;  

/**
 *
 * @author User
 */
public class Utils {
    
    public static Timestamp getLocalTimestamp() {
        //ZoneId aes = ZoneId.systemDefault();
        Timestamp timestamp = new Timestamp(System.currentTimeMillis());  
        return timestamp;
    }
    
    
}
