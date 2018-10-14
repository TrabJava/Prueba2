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
import modelo.dto.Equipo;

/**
 *
 * @author duoc
 */
@Stateless
public class EquipoFacade extends AbstractFacade<Equipo> {

    @PersistenceContext(unitName = "Trabajo2PU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public EquipoFacade() {
        super(Equipo.class);
    }
    
    public boolean existeUsuario(String nombreEquipo){
        Query query = em.createQuery("SELECT e FROM Equipo e WHERE e.nombreEquipo = :nombreEquipo");
        query.setParameter("nombreEquipo", nombreEquipo);
        return query.getResultList().size() > 0;
    }
    
}
