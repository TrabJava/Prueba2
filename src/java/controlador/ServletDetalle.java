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
import modelo.dao.DetalleFacade;
import modelo.dto.Detalle;
import modelo.dto.Equipo;
import modelo.dto.TipoClasificatoria;

/**
 *
 * @author Berni
 */
public class ServletDetalle extends HttpServlet {

    @EJB
    private DetalleFacade detalleFacade;

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

        String opcion = request.getParameter("btnAccion");

        if (opcion.equals("Agregar")) {
            agregar(request, response);
        }

    }

    private void agregar(HttpServletRequest request, HttpServletResponse response) throws IOException {

        int equipillo = Integer.parseInt(request.getParameter("txtEquipillo"));;
        int clasificato = Integer.parseInt(request.getParameter("txtClasificatoria"));;
        /*
        if (detalleFacade.existeEquipo(equipillo, clasificato)) {
            request.getSession().setAttribute("mensaje", "El Equipo ya existe en esta liga");
            response.sendRedirect("SuperUsuario/agregar_administrador.jsp");
        }
         */

        Equipo team = new Equipo(equipillo);
        TipoClasificatoria tipoClasif = new TipoClasificatoria(equipillo);
        Detalle detall = new Detalle(team, tipoClasif);
        detalleFacade.create(detall);
        request.getSession().setAttribute("mensaje", "El Equipo se agregó");
        response.sendRedirect("index.jsp");

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
