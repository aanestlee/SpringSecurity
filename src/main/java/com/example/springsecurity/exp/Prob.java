package com.example.springsecurity.exp;

import javax.persistence.*;

@Entity
public class Prob {
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Id
    @Column(name = "id_prob")
    private int idProb;
    @Basic
    @Column(name = "name_prob")
    private String nameProb;
    @Basic
    @Column(name = "nomer")
    private String nomer;
    @Basic
    @Column(name = "id_br")
    private Integer idBr;

    public int getIdProb() {
        return idProb;
    }

    public void setIdProb(int idProb) {
        this.idProb = idProb;
    }

    public String getNameProb() {
        return nameProb;
    }

    public void setNameProb(String nameProb) {
        this.nameProb = nameProb;
    }

    public String getNomer() {
        return nomer;
    }

    public void setNomer(String nomer) {
        this.nomer = nomer;
    }

    public Integer getIdBr() {
        return idBr;
    }

    public void setIdBr(Integer idBr) {
        this.idBr = idBr;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Prob prob = (Prob) o;

        if (idProb != prob.idProb) return false;
        if (nameProb != null ? !nameProb.equals(prob.nameProb) : prob.nameProb != null) return false;
        if (nomer != null ? !nomer.equals(prob.nomer) : prob.nomer != null) return false;
        if (idBr != null ? !idBr.equals(prob.idBr) : prob.idBr != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = idProb;
        result = 31 * result + (nameProb != null ? nameProb.hashCode() : 0);
        result = 31 * result + (nomer != null ? nomer.hashCode() : 0);
        result = 31 * result + (idBr != null ? idBr.hashCode() : 0);
        return result;
    }
}
