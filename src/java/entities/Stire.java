/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entities;
import java.util.ArrayList;
import java.util.Date;
/**
 *
 * @author oracle
 */
public class Stire {
    
    
    private int id;
    private String nume_stire;
    private Date data;
    private int id_categorie;
    
    
    public Stire(int id, String nume_stire, Date data, int id_categorie)
    {
        this.id = id;
        this.nume_stire = nume_stire;
        this.data = data;
        this.id_categorie = id_categorie;
        
    }
      
    
    public int getID()
    {
        return this.id;
    }
    
    public String getNume()
    {
        return this.nume_stire;
    }
    
    
    public Date getDate()
    {
        return this.data;
    }
    
    public int getIDCategorie()
    {
        return this.id_categorie;
    }
    
    
    
    
    
    
}
