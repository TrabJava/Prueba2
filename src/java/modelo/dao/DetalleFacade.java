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
import modelo.dto.Detalle;

/**
 *
 * @author Berni
 */
@Stateless
public class DetalleFacade extends AbstractFacade<Detalle> {

    @PersistenceContext(unitName = "Trabajo2PU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public DetalleFacade() {
        super(Detalle.class);
    }
    
    public boolean existeEquipo(int equipo,int clasificatoria){
        Query query = em.createQuery("SELECT d FROM Detalle d WHERE d.equipo=:equipo AND d.clasificatoria=:clasificatoria");
        query.setParameter("equipo", equipo);
        query.setParameter("clasificatoria", clasificatoria);
        return query.getResultList().size() > 0;
    }
    
    
}
