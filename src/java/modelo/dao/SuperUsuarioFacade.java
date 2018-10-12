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
import modelo.dto.SuperUsuario;

/**
 *
 * @author duoc
 */
@Stateless
public class SuperUsuarioFacade extends AbstractFacade<SuperUsuario> {

    @PersistenceContext(unitName = "Trabajo2PU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public SuperUsuarioFacade() {
        super(SuperUsuario.class);
    }
    public boolean existeUsuario(String user){
        Query query = em.createQuery("SELECT s FROM SuperUsuario s WHERE s.user = :user");
        query.setParameter("user", user);
        return query.getResultList().size() > 0;
    }
     public boolean existeId(int id){
        Query query = em.createQuery("SELECT s FROM SuperUsuario s WHERE s.id = :id");
        query.setParameter("id", id);
        return query.getResultList().size() > 0;
    }
     
     public boolean ingresar(String user, String pass){
        Query query = em.createQuery("SELECT s FROM SuperUsuario s WHERE s.user = :user OR s.pass = :pass");
        query.setParameter("user", user);
        query.setParameter("pass", pass);
        return query.getResultList().size() > 0;
    }
    public boolean actualizarEstado(int id,int estado){
        Query query = em.createQuery("UPDATE s SuperUsuario set s.estado=:estado  SuperUsuario s WHERE s.id = :id");
        query.setParameter("id", id);
        query.setParameter("estado", estado);
        return query.getResultList().size() > 0;
    }

    
}