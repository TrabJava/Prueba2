/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo.dao;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import modelo.dto.EstadoEquipo;

/**
 *
 * @author duoc
 */
@Stateless
public class EstadoEquipoFacade extends AbstractFacade<EstadoEquipo> {

    @PersistenceContext(unitName = "Trabajo2PU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public EstadoEquipoFacade() {
        super(EstadoEquipo.class);
    }
    
}
