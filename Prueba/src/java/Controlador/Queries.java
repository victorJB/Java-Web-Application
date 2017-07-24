/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import static java.util.Collections.list;
import java.util.List;
import static jdk.nashorn.internal.runtime.Debug.id;

/**
 *
 * @author Victor
 */
public class Queries extends Conexion{
    
    public void mostrarDatos(String clave,String nombre){
        System.out.println("Clave = "+clave+"   Nombre producto = "+nombre);
    }
    
    public ResultSet getTipoProducto() throws SQLException{
        
        PreparedStatement ps = null;
        ResultSet rs = null;
        String consulta = "CALL obtenerTipoProducto()";
        ps = this.getConexion().prepareStatement(consulta);
        rs = ps.executeQuery();
         
        return rs;
    }
    
    public ResultSet getTipoProductoId(String tipo) throws SQLException{
        
        PreparedStatement ps = null;
        ResultSet rs = null;
        String consulta = "CALL obtenerTipoProductoId(?)";
        ps = this.getConexion().prepareStatement(consulta);
        ps.setString(1, tipo);
        rs = ps.executeQuery();
        
        return rs;
    }
    
    public ResultSet getProveedores() throws SQLException{
        
        PreparedStatement ps = null;
        ResultSet rs = null;
        String consulta = "CALL obtenerProveedores()";
        ps = this.getConexion().prepareStatement(consulta);
        rs = ps.executeQuery();
         
        return rs;
    }
    
    public ResultSet getTablaProveedores() throws SQLException{
        
        PreparedStatement ps = null;
        ResultSet rs = null;
        String consulta = "CALL obtenerRegistrosTemporales()";
        ps = this.getConexion().prepareStatement(consulta);
        rs = ps.executeQuery();
         
        return rs;
    }
    
    public boolean InsertarProveedor(String Proveedor,String clave,float costo) throws SQLException{
        PreparedStatement ps = null;
        ResultSet rs = null;
        String queryString = "CALL InsertarProveedor(?,?,?)";
        ps = this.getConexion().prepareStatement(queryString);
        ps.setString(1, Proveedor);
        ps.setString(2, clave);
        ps.setFloat(3, costo);
        int i = ps.executeUpdate();
        
        if(i>0)
            return true;
        else
            return false;
        
        
        
    }
    
    public void guardarProducto(String clave,String nombre,int tipo,String check) throws SQLException{
        PreparedStatement ps = null;
        ResultSet rs = null;
        
        Queries query = new Queries();
        ResultSet resultset = query.getTablaProveedores();
        String queryString = "";
        while(resultset.next()){
            queryString = "CALL GuardarProducto(?,?,?,?,?,?)";
        ps = this.getConexion().prepareStatement(queryString);
        ps.setString(1, clave);
        ps.setString(2, nombre);
        ps.setInt(3, tipo);
        
        Queries consulta = new Queries();
        ResultSet alterno = consulta.getProveedorId(resultset.getString(2));
        int proveedorId = 1;
        
        while(alterno.next()){
            proveedorId = alterno.getInt(1);
        }
        
        ps.setInt(4, proveedorId);
        
        ps.setFloat(5, resultset.getFloat(4));
        
        if(check != null){
            ps.setInt(6, 1);
        }
        
        else{
            ps.setInt(6, 0);
        }
        
        int i = ps.executeUpdate();
        
        }
    }
    
    public boolean eliminarProveedor(String id) throws SQLException{
        
        int idProveedor = 0;
        
        if(id != null){
            idProveedor = Integer.parseInt(id);
            
            PreparedStatement ps = null;
            ResultSet rs = null;
            String queryString = "CALL EliminarProveedorTemporal(?)";
            ps = this.getConexion().prepareStatement(queryString);
            ps.setInt(1, idProveedor);
            int i = ps.executeUpdate();
            
            if(i>0)
            return true;
            
            else
            return false;
        }
    
        return false;
    }
    
    
    public boolean editarProveedor(String id,String proveedor,String clave,String costo) throws SQLException{
         System.out.println("idProveedor="+id+" proveedor="+proveedor+"clave="+clave+"costo="+costo);
        
        int idProveedor = 0;
        float cost = Float.parseFloat(costo);
        
        if(id != null){
            idProveedor = Integer.parseInt(id);
            
            PreparedStatement ps = null;
            ResultSet rs = null;
            String queryString = "UPDATE registrosTemporales SET proveedor = ?,clave = ?,costo = ? WHERE id= ? ";
            ps = this.getConexion().prepareStatement(queryString);
            ps.setString(1, proveedor);
            ps.setString(2, clave);
            ps.setFloat(3, cost);
            ps.setInt(4,idProveedor);
            int i = ps.executeUpdate();
            
            if(i>0)
            return true;
            
            else
            return false;
        }
    
        return false;
    }
    
     public ResultSet getProveedorId(String proveedor) throws SQLException{
        
        PreparedStatement ps = null;
        ResultSet rs = null;
        String consulta = "select * from Proveedores WHERE nombre = ?";
        ps = this.getConexion().prepareStatement(consulta);
        ps.setString(1, proveedor);
        rs = ps.executeQuery();
         
        return rs;
    }
    
}
