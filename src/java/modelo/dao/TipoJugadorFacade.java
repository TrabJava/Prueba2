/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo.dao;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import modelo.dto.TipoJugador;

/**
 *
 * @author duoc
 */
@Stateless
public class TipoJugadorFacade extends AbstractFacade<TipoJugador> {

    @PersistenceContext(unitName = "Trabajo2PU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public TipoJugadorFacade() {
        super(TipoJugador.class);
    }
    
}
