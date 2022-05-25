/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.mavridis.services;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import org.mavridis.dao.Marca;
import org.mavridis.dao.Producto;
import org.mavridis.dao.Proveedor;


/**
 *
 * @author gerdoc
 */
public class ProductoService 
{
    
    public List<Producto> getProductoList( )
    {
        List<Producto>productoList = null;
        Connection connection = null;
        Statement statement = null;
        ResultSet resultSet = null;
        Producto producto = null;
        String sql = "select idProducto,nomProducto, descProducto, urlProducto, precioPubl, costoProducto, nomMarca, nomProveedor from "
                + "tbl_producto inner join tbl_proveedor on tbl_producto.idProveedor = tbl_proveedor.idProveedor "
                + "inner join tbl_marca on tbl_producto.idMarca = tbl_Marca.idMarca;";
        
        try 
        {
            connection = MySqlConnection.getConnection( );
            if( connection == null )
            {
                return null;
            }
            statement = connection.createStatement( );
            if( statement == null )
            {
                return null;
            }
            resultSet = statement.executeQuery( sql );
            if( resultSet == null )
            {
                return null;
            }
            productoList = new ArrayList<>();
            while( resultSet.next() )
            {
                producto = new Producto( new Marca(), new Proveedor());
                
                producto.setIdProducto(resultSet.getInt(1));
                producto.setNomProducto(resultSet.getString(2) );
                producto.setDescProducto(resultSet.getString(3) );
                producto.setUrlProducto(resultSet.getString(4));
                producto.setPrecioPubl(resultSet.getInt(5) );
                producto.setCostoProducto(resultSet.getInt(6) );
                producto.getMarca().setNomMarca(resultSet.getString(7) );
                producto.getProveedor().setNomProveedor(resultSet.getString(8) );
                
                productoList.add(producto);
            }
            resultSet.close();
            MySqlConnection.closeConnection(connection);
            return productoList;
        } 
        catch (SQLException ex) 
        {
            ex.printStackTrace();
        }
        return null;
    }
    
    public boolean addProducto( Producto producto )
    {

        Connection connection = null;
        PreparedStatement preparedStatement = null;
        String sql = "insert into tbl_producto (nomProducto, descProducto, urlProducto, precioPubl, costoProducto, idProveedor, idMarca) values (?,?,?,?,?,?,?);";
        int row = 0;
        try 
        {
            connection = MySqlConnection.getConnection( );
            if( connection == null )
            {
                return false;
            }
            preparedStatement = connection.prepareStatement(sql);
            if( preparedStatement == null )
            {
                return false;
            }
            
            preparedStatement.setString(1, producto.getNomProducto());
            preparedStatement.setString(2, producto.getDescProducto());
            preparedStatement.setString(3, producto.getUrlProducto());
            preparedStatement.setInt(4, producto.getPrecioPubl());
            preparedStatement.setInt(5, producto.getCostoProducto());
            
            preparedStatement.setInt(6, producto.getProveedor().getIdProveedor());
            
            preparedStatement.setInt(7, producto.getMarca().getIdMarca());
            row = preparedStatement.executeUpdate();
            MySqlConnection.closeConnection(connection);
            return row == 1;
        } 
        catch (SQLException ex) 
        {
            ex.printStackTrace();
        }
        return false;
    }
    
    public boolean deleteProducto( Producto producto )
    {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        String sql = "DELETE FROM TBL_PRODUCTO WHERE IDPRODUCTO = ?";
        int row = 0;
        try 
        {
            connection = MySqlConnection.getConnection( );
            if( connection == null )
            {
                return false;
            }
            preparedStatement = connection.prepareStatement(sql);
            if( preparedStatement == null )
            {
                return false;
            }
            preparedStatement.setInt(1, producto.getIdProducto());
            row = preparedStatement.executeUpdate();
            MySqlConnection.closeConnection(connection);
            return row == 1;
        } 
        catch (SQLException ex) 
        {
            ex.printStackTrace();
        }
        return false;
    }
    
    public Producto getProductoById( Integer id )
    {
        Proveedor proveedor = null;
        Marca marca = null;
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        String sql = "SELECT * FROM TBL_PRODUCTO WHERE IDPRODUCTO = ?";
        Producto producto = null;
        try 
        {
            connection = MySqlConnection.getConnection( );
            if( connection == null )
            {
                return null;
            }
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1, id );
            resultSet = preparedStatement.executeQuery( );
            if( resultSet == null )
            {
                return null;
            }
            while( resultSet.next() )
            {
                producto = new Producto( new Marca(), new Proveedor());
                producto.setIdProducto(resultSet.getInt(1) );
                producto.setNomProducto(resultSet.getString(2) );
                producto.setDescProducto(resultSet.getString(3) );
                producto.setUrlProducto(resultSet.getString(4) );
                producto.setPrecioPubl(resultSet.getInt(5) );
                producto.setCostoProducto(resultSet.getInt(6) );
                marca = new MarcaService( ).getMarcaById( resultSet.getInt(8) );
                producto.setMarca(marca);
                producto.getMarca().setIdMarca(producto.getMarca().getIdMarca());
                proveedor = new ProveedorService().getProveedorById(resultSet.getInt(7));
                producto.setProveedor(proveedor);
                producto.getProveedor().setIdProveedor(producto.getProveedor().getIdProveedor());
           
            }
            resultSet.close();
            MySqlConnection.closeConnection(connection);
            return producto;
        } 
        catch (SQLException ex) 
        {
            ex.printStackTrace();
        }
        return null;
    }
    
    public boolean updateProducto( Producto producto )
    {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        String sql = "update TBL_PRODUCTO SET NOMPRODUCTO = ?, DESCPRODUCTO = ?, URLPRODUCTO = ?,PRECIOPUBL = ?, COSTOPRODUCTO = ?,"
                + "IDMARCA = ?, IDPROVEEDOR = ? WHERE IDPRODUCTO = ?";
        int row = 0;
        try 
        {
            connection = MySqlConnection.getConnection( );
            if( connection == null )
            {
                return false;
            }
            preparedStatement = connection.prepareStatement(sql);
            if( preparedStatement == null )
            {
                return false;
            }
            
            preparedStatement.setString(1, producto.getNomProducto());
            preparedStatement.setString(2, producto.getDescProducto());
            preparedStatement.setString(3, producto.getUrlProducto());
            preparedStatement.setInt(4, producto.getPrecioPubl());
            preparedStatement.setInt(5, producto.getCostoProducto());
            preparedStatement.setInt(6, producto.getMarca().getIdMarca());
            preparedStatement.setInt(7, producto.getProveedor().getIdProveedor());
            preparedStatement.setInt(8, producto.getIdProducto());
            
            row = preparedStatement.executeUpdate();
            MySqlConnection.closeConnection(connection);
            return row == 1;
        } 
        catch (SQLException ex) 
        {
            ex.printStackTrace();
        }
        return false;
    }
}