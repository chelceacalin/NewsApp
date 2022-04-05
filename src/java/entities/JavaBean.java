/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entities;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
    
/**
 *
 * @author oracle
 */
public class JavaBean extends Conexiune{
    
    
  
    
    public ArrayList<Stire> getStiri() throws SQLException{
        
            Connection conn = Conexiune.getConnection(); 
        
            String sql = "SELECT id_stire, nume_stire, data_postarii, id_categorie FROM stiri ORDER BY id_stire";
            PreparedStatement getStiri = conn.prepareStatement(sql);
            ResultSet getStiriRESULT = getStiri.executeQuery();
            
           
            ArrayList<Stire> stiri = new ArrayList<Stire>();
            
            
            
            while(getStiriRESULT.next()){
               
               stiri.add(new Stire(getStiriRESULT.getInt("id_stire"), getStiriRESULT.getString("nume_stire"), getStiriRESULT.getDate("data_postarii"), getStiriRESULT.getInt("id_categorie") ));
               
   
           }
            
            return stiri;
        }
    
}
