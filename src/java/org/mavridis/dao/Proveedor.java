package org.mavridis.dao;

import java.io.Serializable;

public class Proveedor implements Serializable{
    
    private Integer idProveedor;
    private String nomProveedor;
    
    public Proveedor() {
    }

    public Integer getIdProveedor() {
        return idProveedor;
    }

    public void setIdProveedor(Integer idProveedor) {
        this.idProveedor = idProveedor;
    }

    public String getNomProveedor() {
        return nomProveedor;
    }

    public void setNomProveedor(String nomProveedor) {
        this.nomProveedor = nomProveedor;
    }
}