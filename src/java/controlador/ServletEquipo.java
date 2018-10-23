/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import java.io.IOException;
import java.io.PrintWriter;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.dao.EquipoFacade;
import modelo.dto.Equipo;
import modelo.dto.EstadoEquipo;
import modelo.dto.Liga;

/**
 *
 * @author Berni
 */
public class ServletEquipo extends HttpServlet {

    @EJB
    private EquipoFacade equipoFacade;

    
    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        String opcion = request.getParameter("btnAccion");
        //Cual accion se ejecuta
        if (opcion.equals("Agregar")) {
            agregar(request, response);
        }
        if (opcion.equals("Eliminar")) {
            eliminar(request, response);
        }
        if (opcion.equals("Modificar")) {
            modificar(request, response);
        }
    }

    private void agregar(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String equipo = request.getParameter("txtNombreEquipo");
        String archivo = request.getParameter("file");
        int liga =Integer.parseInt(request.getParameter("cboLiga"));
        int estado =1;
        if (equipoFacade.existeUsuario(equipo)) {
            request.getSession().setAttribute("msjAgregarEquipo", "El equipo ya existe");
            response.sendRedirect("Equipo/agregar_equipo.jsp");
        } else {
            Liga liguilla = new Liga(liga);
            EstadoEquipo estadoEQ = new EstadoEquipo(estado);
            Equipo equipillo = new Equipo(equipo, archivo, liguilla, estadoEQ);
            equipoFacade.create(equipillo);
            request.getSession().setAttribute("msjAgregarEquipo", "El equipo se ha creado");
            response.sendRedirect("Equipo/agregar_equipo.jsp");
        }
    }

    private void eliminar(HttpServletRequest request, HttpServletResponse response) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    private void modificar(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String equipo = request.getParameter("txtEquipo");
        int liga =Integer.parseInt(request.getParameter("cboLiga"));
        int id =Integer.parseInt(request.getParameter("txtId"));
        int estado =Integer.parseInt(request.getParameter("cboEstado"));
        String archivo = request.getParameter("file");
        
        if (equipoFacade.existeId(id)) {
            Liga liguilla = new Liga(liga);
            EstadoEquipo estadoEQ = new EstadoEquipo(estado);
            Equipo equipillo = new Equipo(id, equipo, archivo, liguilla, estadoEQ);
            equipoFacade.edit(equipillo);
            request.getSession().setAttribute("msjModificarEquipo", "El equipo se ha modificado");
            response.sendRedirect("Equipo/listar_equipo.jsp");
            
        } else {
            request.getSession().setAttribute("msjModificarEquipo", "El nombre del equipo ya existe");
            response.sendRedirect("Equipo/listar_equipo.jsp");
        }
    }
    
    
    
    
    
    
    

// <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
