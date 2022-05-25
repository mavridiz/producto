package org.mavridis.dao;

import java.io.Serializable;

public class Marca implements Serializable{
    
    private Integer idMarca;
    private String nomMarca;

    public Marca() {
    }

    public Integer getIdMarca() {
        return idMarca;
    }

    public void setIdMarca(Integer idMarca) {
        this.idMarca = idMarca;
    }

    public String getNomMarca() {
        return nomMarca;
    }

    public void setNomMarca(String nomMarca) {
        this.nomMarca = nomMarca;
    }
}