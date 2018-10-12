/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo.dto;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author duoc
 */
@Entity
@Table(name = "super_usuario")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "SuperUsuario.findAll", query = "SELECT s FROM SuperUsuario s"),
    @NamedQuery(name = "SuperUsuario.findById", query = "SELECT s FROM SuperUsuario s WHERE s.id = :id"),
    @NamedQuery(name = "SuperUsuario.findByUser", query = "SELECT s FROM SuperUsuario s WHERE s.user = :user"),
    @NamedQuery(name = "SuperUsuario.findByPass", query = "SELECT s FROM SuperUsuario s WHERE s.pass = :pass")})
public class SuperUsuario implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id")
    private Integer id;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 100)
    @Column(name = "user")
    private String user;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 100)
    @Column(name = "pass")
    private String pass;
    @JoinColumn(name = "tipo", referencedColumnName = "id")
    @ManyToOne(optional = false)
    private TipoSuper tipo;
    @JoinColumn(name = "estado", referencedColumnName = "id")
    @ManyToOne(optional = false)
    private EstadoSuper estado;

    public SuperUsuario() {
    }

    public SuperUsuario(Integer id, EstadoSuper estado) {
        this.id = id;
        this.estado = estado;
    }

    
    
    public SuperUsuario(String user, String pass, TipoSuper tipo, EstadoSuper estado) {
        this.user = user;
        this.pass = pass;
        this.tipo = tipo;
        this.estado = estado;
    }

    public SuperUsuario(Integer id, String user, String pass, TipoSuper tipo, EstadoSuper estado) {
        this.id = id;
        this.user = user;
        this.pass = pass;
        this.tipo = tipo;
        this.estado = estado;
    }
    
    

    
    public SuperUsuario(Integer id) {
        this.id = id;
    }

    public SuperUsuario(String user, String pass) {
        this.user = user;
        this.pass = pass;
    }

    
    public SuperUsuario(Integer id, String user, String pass) {
        this.id = id;
        this.user = user;
        this.pass = pass;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getUser() {
        return user;
    }

    public void setUser(String user) {
        this.user = user;
    }

    public String getPass() {
        return pass;
    }

    public void setPass(String pass) {
        this.pass = pass;
    }

    public TipoSuper getTipo() {
        return tipo;
    }

    public void setTipo(TipoSuper tipo) {
        this.tipo = tipo;
    }

    public EstadoSuper getEstado() {
        return estado;
    }

    public void setEstado(EstadoSuper estado) {
        this.estado = estado;
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
        if (!(object instanceof SuperUsuario)) {
            return false;
        }
        SuperUsuario other = (SuperUsuario) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "modelo.dto.SuperUsuario[ id=" + id + " ]";
    }
    
}
