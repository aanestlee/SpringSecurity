package com.example.springsecurity.exp;

import javax.persistence.*;
import javax.persistence.Entity;



@Entity
public class Br {
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Id
    @Column(name = "id_br")
    private int idBr;
    @Basic
    @Column(name = "name_br")
    private String nameBr;

    public int getIdBr() {
        return idBr;
    }

    public void setIdBr(int idBr) {
        this.idBr = idBr;
    }

    public String getNameBr() {
        return nameBr;
    }

    public void setNameBr(String nameBr) {
        this.nameBr = nameBr;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Br br = (Br) o;

        if (idBr != br.idBr) return false;
        if (nameBr != null ? !nameBr.equals(br.nameBr) : br.nameBr != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = idBr;
        result = 31 * result + (nameBr != null ? nameBr.hashCode() : 0);
        return result;
    }
}
