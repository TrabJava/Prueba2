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
@Table(name = "tipo_clasificatoria")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "TipoClasificatoria.findAll", query = "SELECT t FROM TipoClasificatoria t"),
    @NamedQuery(name = "TipoClasificatoria.findById", query = "SELECT t FROM TipoClasificatoria t WHERE t.id = :id"),
    @NamedQuery(name = "TipoClasificatoria.findByDescripcionTipoclas", query = "SELECT t FROM TipoClasificatoria t WHERE t.descripcionTipoclas = :descripcionTipoclas")})
public class TipoClasificatoria implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id")
    private Integer id;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 100)
    @Column(name = "descripcion_tipoclas")
    private String descripcionTipoclas;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "clasificatoria")
    private List<Detalle> detalleList;

    public TipoClasificatoria() {
    }

    public TipoClasificatoria(Integer id) {
        this.id = id;
    }

    public TipoClasificatoria(Integer id, String descripcionTipoclas) {
        this.id = id;
        this.descripcionTipoclas = descripcionTipoclas;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getDescripcionTipoclas() {
        return descripcionTipoclas;
    }

    public void setDescripcionTipoclas(String descripcionTipoclas) {
        this.descripcionTipoclas = descripcionTipoclas;
    }

    @XmlTransient
    public List<Detalle> getDetalleList() {
        return detalleList;
    }

    public void setDetalleList(List<Detalle> detalleList) {
        this.detalleList = detalleList;
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
        if (!(object instanceof TipoClasificatoria)) {
            return false;
        }
        TipoClasificatoria other = (TipoClasificatoria) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "modelo.dto.TipoClasificatoria[ id=" + id + " ]";
    }
    
}
