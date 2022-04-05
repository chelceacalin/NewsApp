/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entities;

/**
 *
 * @author oracle
 */
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.ResultSet;
import java.sql.Statement;


public class Conexiune
{
    private static String dbUrl = "jdbc:oracle:thin:@//localhost:1521/orcl";
    private static String dbUsername = "cristi";
    private static String dbPassword = "cristi";

    public static Connection getConnection() throws SQLException
    {
        return DriverManager.getConnection(dbUrl, dbUsername, dbPassword);
    }
}