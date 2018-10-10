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
@Table(name = "tipo_jugador")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "TipoJugador.findAll", query = "SELECT t FROM TipoJugador t"),
    @NamedQuery(name = "TipoJugador.findById", query = "SELECT t FROM TipoJugador t WHERE t.id = :id"),
    @NamedQuery(name = "TipoJugador.findByDescripcionTipoj", query = "SELECT t FROM TipoJugador t WHERE t.descripcionTipoj = :descripcionTipoj")})
public class TipoJugador implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id")
    private Integer id;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 100)
    @Column(name = "descripcion_tipoj")
    private String descripcionTipoj;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "tipo")
    private List<Jugador> jugadorList;

    public TipoJugador() {
    }

    public TipoJugador(Integer id) {
        this.id = id;
    }

    public TipoJugador(Integer id, String descripcionTipoj) {
        this.id = id;
        this.descripcionTipoj = descripcionTipoj;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getDescripcionTipoj() {
        return descripcionTipoj;
    }

    public void setDescripcionTipoj(String descripcionTipoj) {
        this.descripcionTipoj = descripcionTipoj;
    }

    @XmlTransient
    public List<Jugador> getJugadorList() {
        return jugadorList;
    }

    public void setJugadorList(List<Jugador> jugadorList) {
        this.jugadorList = jugadorList;
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
        if (!(object instanceof TipoJugador)) {
            return false;
        }
        TipoJugador other = (TipoJugador) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "modelo.dto.TipoJugador[ id=" + id + " ]";
    }
    
}
