package modelo;

import java.sql.Connection;
import java.sql.DriverManager;


public class conexion {
    Connection con;
   public Connection getConnection(){
       try {
           Class.forName("com.mysql.jdbc.Driver");
           con=DriverManager.getConnection("jdbc:mysql://localhost:3310/kyukeisho","root","");
       } catch (Exception e) {
       }
       return con;
   }
}

