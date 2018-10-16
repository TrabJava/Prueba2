/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo.dao;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import modelo.dto.Jugador;


/**
 *
 * @author Berni
 */
@Stateless
public class JugadorFacade extends AbstractFacade<Jugador> {

    @PersistenceContext(unitName = "Trabajo2PU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public JugadorFacade() {
        super(Jugador.class);
    }

    public boolean existeUsuario(String user) {
        Query query = em.createQuery("SELECT j FROM Jugador j WHERE j.user = :user");
        query.setParameter("user", user);
        return query.getResultList().size() > 0;
    }

    public boolean existeId(int id) {
        Query query = em.createQuery("SELECT j FROM Jugador j WHERE j.id = :id");
        query.setParameter("id", id);
        return query.getResultList().size() > 0;
    }
    
     public boolean ingresar(String user, String pass, int tipo, int estado){
        Query query = em.createQuery("SELECT j.user, j.pass, t.id FROM Jugador j JOIN j.tipo t JOIN j.estado e WHERE j.user = :user AND j.pass = :pass AND j.tipo.id=:tipo AND j.estado.id=:estado");
        query.setParameter("user", user);
        query.setParameter("pass", pass);
        query.setParameter("tipo", tipo);
        query.setParameter("estado", estado);
        return query.getResultList().size() > 0;
    }

}
