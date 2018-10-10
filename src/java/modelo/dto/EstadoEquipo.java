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
@Table(name = "estado_equipo")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "EstadoEquipo.findAll", query = "SELECT e FROM EstadoEquipo e"),
    @NamedQuery(name = "EstadoEquipo.findById", query = "SELECT e FROM EstadoEquipo e WHERE e.id = :id"),
    @NamedQuery(name = "EstadoEquipo.findByDescripcionEstadoe", query = "SELECT e FROM EstadoEquipo e WHERE e.descripcionEstadoe = :descripcionEstadoe")})
public class EstadoEquipo implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id")
    private Integer id;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 100)
    @Column(name = "descripcion_estadoe")
    private String descripcionEstadoe;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "estado")
    private List<Equipo> equipoList;

    public EstadoEquipo() {
    }

    public EstadoEquipo(Integer id) {
        this.id = id;
    }

    public EstadoEquipo(Integer id, String descripcionEstadoe) {
        this.id = id;
        this.descripcionEstadoe = descripcionEstadoe;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getDescripcionEstadoe() {
        return descripcionEstadoe;
    }

    public void setDescripcionEstadoe(String descripcionEstadoe) {
        this.descripcionEstadoe = descripcionEstadoe;
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
        if (!(object instanceof EstadoEquipo)) {
            return false;
        }
        EstadoEquipo other = (EstadoEquipo) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "modelo.dto.EstadoEquipo[ id=" + id + " ]";
    }
    
}
