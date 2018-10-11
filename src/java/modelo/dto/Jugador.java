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
@Table(name = "jugador")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Jugador.findAll", query = "SELECT j FROM Jugador j"),
    @NamedQuery(name = "Jugador.findById", query = "SELECT j FROM Jugador j WHERE j.id = :id"),
    @NamedQuery(name = "Jugador.findByNombre", query = "SELECT j FROM Jugador j WHERE j.nombre = :nombre"),
    @NamedQuery(name = "Jugador.findByApPaterno", query = "SELECT j FROM Jugador j WHERE j.apPaterno = :apPaterno"),
    @NamedQuery(name = "Jugador.findByRut", query = "SELECT j FROM Jugador j WHERE j.rut = :rut"),
    @NamedQuery(name = "Jugador.findByUser", query = "SELECT j FROM Jugador j WHERE j.user = :user"),
    @NamedQuery(name = "Jugador.findByPass", query = "SELECT j FROM Jugador j WHERE j.pass = :pass")})
public class Jugador implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id")
    private Integer id;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 100)
    @Column(name = "nombre")
    private String nombre;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 100)
    @Column(name = "ap_paterno")
    private String apPaterno;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 100)
    @Column(name = "rut")
    private String rut;
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
    private TipoJugador tipo;
    @JoinColumn(name = "estado", referencedColumnName = "id")
    @ManyToOne(optional = false)
    private EstadoJugador estado;
    @JoinColumn(name = "seleccion", referencedColumnName = "id")
    @ManyToOne(optional = false)
    private SeleccionJugador seleccion;
    @JoinColumn(name = "equipo", referencedColumnName = "id")
    @ManyToOne
    private Equipo equipo;

    public Jugador() {
    }

    public Jugador(Integer id) {
        this.id = id;
    }

    public Jugador(String nombre, String apPaterno, String rut, String user, String pass, TipoJugador tipo, EstadoJugador estado, SeleccionJugador seleccion, Equipo equipo) {
        this.nombre = nombre;
        this.apPaterno = apPaterno;
        this.rut = rut;
        this.user = user;
        this.pass = pass;
        this.tipo = tipo;
        this.estado = estado;
        this.seleccion = seleccion;
        this.equipo = equipo;
    }

    
    public Jugador(Integer id, String nombre, String apPaterno, String rut, String user, String pass) {
        this.id = id;
        this.nombre = nombre;
        this.apPaterno = apPaterno;
        this.rut = rut;
        this.user = user;
        this.pass = pass;
    }

    public Jugador(Integer id, String nombre, String apPaterno, String rut, String user, String pass, TipoJugador tipo, EstadoJugador estado, SeleccionJugador seleccion, Equipo equipo) {
        this.id = id;
        this.nombre = nombre;
        this.apPaterno = apPaterno;
        this.rut = rut;
        this.user = user;
        this.pass = pass;
        this.tipo = tipo;
        this.estado = estado;
        this.seleccion = seleccion;
        this.equipo = equipo;
    }
    
    

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getApPaterno() {
        return apPaterno;
    }

    public void setApPaterno(String apPaterno) {
        this.apPaterno = apPaterno;
    }

    public String getRut() {
        return rut;
    }

    public void setRut(String rut) {
        this.rut = rut;
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

    public TipoJugador getTipo() {
        return tipo;
    }

    public void setTipo(TipoJugador tipo) {
        this.tipo = tipo;
    }

    public EstadoJugador getEstado() {
        return estado;
    }

    public void setEstado(EstadoJugador estado) {
        this.estado = estado;
    }

    public SeleccionJugador getSeleccion() {
        return seleccion;
    }

    public void setSeleccion(SeleccionJugador seleccion) {
        this.seleccion = seleccion;
    }

    public Equipo getEquipo() {
        return equipo;
    }

    public void setEquipo(Equipo equipo) {
        this.equipo = equipo;
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
        if (!(object instanceof Jugador)) {
            return false;
        }
        Jugador other = (Jugador) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "modelo.dto.Jugador[ id=" + id + " ]";
    }
    
}
