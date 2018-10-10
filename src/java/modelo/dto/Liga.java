/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo.dto;

import java.io.Serializable;
import java.util.List;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author duoc
 */
@Entity
@Table(name = "liga")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Liga.findAll", query = "SELECT l FROM Liga l"),
    @NamedQuery(name = "Liga.findById", query = "SELECT l FROM Liga l WHERE l.id = :id"),
    @NamedQuery(name = "Liga.findByDescripcionLiga", query = "SELECT l FROM Liga l WHERE l.descripcionLiga = :descripcionLiga")})
public class Liga implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id")
    private Integer id;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 100)
    @Column(name = "descripcion_liga")
    private String descripcionLiga;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "liga")
    private List<Equipo> equipoList;

    public Liga() {
    }

    public Liga(Integer id) {
        this.id = id;
    }

    public Liga(Integer id, String descripcionLiga) {
        this.id = id;
        this.descripcionLiga = descripcionLiga;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getDescripcionLiga() {
        return descripcionLiga;
    }

    public void setDescripcionLiga(String descripcionLiga) {
        this.descripcionLiga = descripcionLiga;
    }

    @XmlTransient
    public List<Equipo> getEquipoList() {
        return equipoList;
    }

    public void setEquipoList(List<Equipo> equipoList) {
        this.equipoList = equipoList;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (id != null ? id.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Liga)) {
            return false;
        }
        Liga other = (Liga) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "modelo.dto.Liga[ id=" + id + " ]";
    }
    
}
