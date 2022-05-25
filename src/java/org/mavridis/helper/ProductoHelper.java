/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.mavridis.helper;

import java.io.Serializable;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.mavridis.dao.Marca;
import org.mavridis.dao.Producto;
import org.mavridis.dao.Proveedor;
import org.mavridis.services.MarcaService;
import org.mavridis.services.ProductoService;
import org.mavridis.services.ProveedorService;



/**
 *
 * @author gerdoc
 */
public class ProductoHelper implements Serializable
{
    private List<Producto>list;
    private Producto producto;

    public ProductoHelper() 
    {
    }
    
    public boolean loadList( )
    {
        list = new ProductoService().getProductoList();
        return list != null && list.size() > 0;
    }
    
    public boolean addProducto( HttpServletRequest request )
    {
        Proveedor proveedor = null;
        Marca marca = null;
        producto = new Producto( new Marca(), new Proveedor());
        
        producto.setNomProducto(request.getParameter( "nomProducto" ) );
        if( producto.getNomProducto()== null || producto.getNomProducto().length() == 0 )
        {
            return false;
        }
        producto.setDescProducto(request.getParameter( "descProducto" ) );
        if( producto.getDescProducto()== null || producto.getDescProducto().length() == 0 )
        {
            return false;
        }
        producto.setUrlProducto(request.getParameter( "urlProducto" ) );
        if( producto.getUrlProducto()== null || producto.getUrlProducto().length() == 0 )
        {
            return false;
        }
        producto.setPrecioPubl(getInteger(request.getParameter( "precioPubl" ) ));
        if( producto.getPrecioPubl()== null || producto.getPrecioPubl() == 0 )
        {
            return false;
        }
        producto.setCostoProducto(getInteger(request.getParameter( "costoProducto" )) );
        if( producto.getCostoProducto()== null || producto.getCostoProducto() == 0 )
        {
            return false;
        }
        if( (request.getParameter( "nomMarca" ))== null || (request.getParameter( "nomMarca" )).length() == 0 )
        {
            return false;
        }
        marca = new MarcaService().getMarcaByNom((request.getParameter( "nomMarca" )));
        producto.setMarca(marca);       
        if( (request.getParameter( "nomProveedor" ))== null || (request.getParameter( "nomProveedor" )).length() == 0 )
        {
            return false;
        }     
        proveedor = new ProveedorService().getProveedorByNom((request.getParameter( "nomProveedor" )));
        producto.setProveedor(proveedor);
        
        return new ProductoService().addProducto(producto);
    }
    
    public Integer getInteger( String campo )
    {
        Integer val = 0;
        if( campo == null || campo.length() == 0 )
        {
            return null;
        }
        try
        {
            val = new Integer(campo);
            return val;
        }
        catch(NumberFormatException ex)
        {
            ex.printStackTrace();
        }
        return null;
    }

    public List<Producto> getList()
    {
        if( list == null || list.size( )== 0 )
        {
            if( !loadList( ) )
            {
                return null;
            }
        }
        return list;
    }

        public boolean deleteProducto( HttpServletRequest request )
    {
        producto = new Producto( new Marca(), new Proveedor()); 
        producto.setIdProducto(getInteger( request.getParameter( "id" )) );
        if( producto.getIdProducto() == null )
        {
            return false;
        }
        return new ProductoService().deleteProducto( producto );
    }
    
    public boolean updateProducto( HttpServletRequest request )
    {
        Proveedor proveedor = null;
        Marca marca = null;
        producto = new Producto( new Marca(), new Proveedor());
        
        producto.setIdProducto(getInteger(request.getParameter( "id" )) );
        if( producto.getIdProducto()== null || producto.getIdProducto() == 0 )
        {
            return false;
        }
        producto.setNomProducto(request.getParameter( "nomProducto" ) );
        if( producto.getNomProducto()== null || producto.getNomProducto().length() == 0 )
        {
            return false;
        }
        producto.setDescProducto(request.getParameter( "descProducto" ) );
        if( producto.getDescProducto()== null || producto.getDescProducto().length() == 0 )
        {
            return false;
        }
        producto.setUrlProducto(request.getParameter( "urlProducto" ) );
        if( producto.getUrlProducto()== null || producto.getUrlProducto().length() == 0 )
        {
            return false;
        }
        producto.setPrecioPubl(getInteger(request.getParameter( "precioPubl" ) ));
        if( producto.getPrecioPubl()== null || producto.getPrecioPubl() == 0 )
        {
            return false;
        }
        producto.setCostoProducto(getInteger(request.getParameter( "costoProducto" )) );
        if( producto.getCostoProducto()== null || producto.getCostoProducto() == 0 )
        {
            return false;
        }
        if( (request.getParameter( "nomMarca" ))== null || (request.getParameter( "nomMarca" )).length() == 0 )
        {
            return false;
        }
        marca = new MarcaService().getMarcaByNom((request.getParameter( "nomMarca" )));
        producto.setMarca(marca);       
        if( (request.getParameter( "nomProveedor" ))== null || (request.getParameter( "nomProveedor" )).length() == 0 )
        {
            return false;
        }     
        proveedor = new ProveedorService().getProveedorByNom((request.getParameter( "nomProveedor" )));
        producto.setProveedor(proveedor);
        
        return new ProductoService().updateProducto( producto );
    }
    
    public Producto getProductoById( HttpServletRequest request )
    {
        
        Producto producto = null;
        Integer id = null;
        id = getInteger( request.getParameter( "id" ) );
        
        if( id == null )
        {
            return null;
        }
        return new ProductoService( ).getProductoById( id );
    }

    
    public void setList(List<Producto> list) 
    {
        this.list = list;
    }

    public Producto getProducto() 
    {
        return producto;
    }

    public void setProducto(Producto producto) 
    {
        this.producto = producto;
    }
    
}
