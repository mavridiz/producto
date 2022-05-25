package org.mavridis.dao;

import java.io.Serializable;

public class Producto implements Serializable{
    
    private Integer idProducto;
    private String nomProducto;
    private String descProducto;
    private String urlProducto;
    private Integer precioPubl;
    private Integer costoProducto;
    private Marca marca;
    private Proveedor proveedor;

    public Producto(Marca marca, Proveedor proveedor) {
        this.marca = marca;
        this.proveedor = proveedor;
    }

    public Integer getIdProducto() {
        return idProducto;
    }

    public void setIdProducto(Integer idProducto) {
        this.idProducto = idProducto;
    }

    public String getNomProducto() {
        return nomProducto;
    }

    public void setNomProducto(String nomProducto) {
        this.nomProducto = nomProducto;
    }

    public String getDescProducto() {
        return descProducto;
    }

    public void setDescProducto(String descProducto) {
        this.descProducto = descProducto;
    }

    public String getUrlProducto() {
        return urlProducto;
    }

    public void setUrlProducto(String urlProducto) {
        this.urlProducto = urlProducto;
    }

    public Integer getPrecioPubl() {
        return precioPubl;
    }

    public void setPrecioPubl(Integer precioPubl) {
        this.precioPubl = precioPubl;
    }

    public Integer getCostoProducto() {
        return costoProducto;
    }

    public void setCostoProducto(Integer costoProducto) {
        this.costoProducto = costoProducto;
    }

    public Marca getMarca() {
        return marca;
    }

    public void setMarca(Marca marca) {
        this.marca = marca;
    }

    public Proveedor getProveedor() {
        return proveedor;
    }

    public void setProveedor(Proveedor proveedor) {
        this.proveedor = proveedor;
    }    
}