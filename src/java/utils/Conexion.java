/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package utils;

import java.sql.Connection;
import java.sql.DriverManager;

/**
 *
 * @author Desiderio
 */
public class Conexion {

    private static final String URL = "jdbc:mysql://interchange.proxy.rlwy.net:49783/railway";
    private static final String USER = "root";
    private static final String PASSWORD = "IqPBIZtESSMvphDLXPxwsfpieNysWYWI";


    public static Connection getConexion() {
        Connection con = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection(URL, USER, PASSWORD);
            System.out.println("Conexión Exitosa a Railway");
        } catch (Exception e) {
            System.out.println("Error de conexion: " + e.getMessage());
        }
        return con;
    }
}