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
 * @author Berni
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
     
     public boolean ingresar1(String user, String pass,int tipo){
        Query query = em.createQuery("SELECT s.user, s.pass, t.id FROM SuperUsuario s JOIN s.tipo t WHERE s.user = :user AND s.pass = :pass AND s.tipo.id=:tipo");
     
        query.setParameter("user", user);
        query.setParameter("pass", pass);
        query.setParameter("tipo", tipo);
        return query.getResultList().size() > 0;
    }
}
