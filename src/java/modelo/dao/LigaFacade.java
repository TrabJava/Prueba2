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
import modelo.dto.Liga;

/**
 *
 * @author Berni
 */
@Stateless
public class LigaFacade extends AbstractFacade<Liga> {

    @PersistenceContext(unitName = "Trabajo2PU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public LigaFacade() {
        super(Liga.class);
    }
    
    public boolean existeLiga(String liga) {
        Query query = em.createQuery("SELECT l FROM Liga l WHERE l.descripcionLiga = :liga");
        query.setParameter("liga", liga);
        return query.getResultList().size() > 0;
    }
    
}
