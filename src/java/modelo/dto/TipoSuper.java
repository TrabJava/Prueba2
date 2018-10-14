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
 * @author Berni
 */
@Entity
@Table(name = "tipo_super")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "TipoSuper.findAll", query = "SELECT t FROM TipoSuper t")
    , @NamedQuery(name = "TipoSuper.findById", query = "SELECT t FROM TipoSuper t WHERE t.id = :id")
    , @NamedQuery(name = "TipoSuper.findByDescripcionTiposu", query = "SELECT t FROM TipoSuper t WHERE t.descripcionTiposu = :descripcionTiposu")})
public class TipoSuper implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id")
    private Integer id;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 100)
    @Column(name = "descripcion_tiposu")
    private String descripcionTiposu;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "tipo")
    private List<SuperUsuario> superUsuarioList;

    public TipoSuper() {
    }

    public TipoSuper(Integer id) {
        this.id = id;
    }

    public TipoSuper(Integer id, String descripcionTiposu) {
        this.id = id;
        this.descripcionTiposu = descripcionTiposu;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getDescripcionTiposu() {
        return descripcionTiposu;
    }

    public void setDescripcionTiposu(String descripcionTiposu) {
        this.descripcionTiposu = descripcionTiposu;
    }

    @XmlTransient
    public List<SuperUsuario> getSuperUsuarioList() {
        return superUsuarioList;
    }

    public void setSuperUsuarioList(List<SuperUsuario> superUsuarioList) {
        this.superUsuarioList = superUsuarioList;
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
        if (!(object instanceof TipoSuper)) {
            return false;
        }
        TipoSuper other = (TipoSuper) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "modelo.dto.TipoSuper[ id=" + id + " ]";
    }
    
}
