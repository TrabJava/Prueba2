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
import modelo.dao.LigaFacade;
import modelo.dto.Liga;

/**
 *
 * @author Artiko1
 */
public class ServletLiga extends HttpServlet {

    @EJB
    private LigaFacade ligaFacade;
   
    
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
        if (opcion.equals("Modificar")) {
            modificar(request, response);
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

    private void agregar(HttpServletRequest request, HttpServletResponse response) throws IOException {
        try {
            String nombre = request.getParameter("txtNombreLiga");
        if (ligaFacade.existeLiga(nombre)) {
            request.getSession().setAttribute("mensaje", "La liga ya existe");
            response.sendRedirect("Liga/agregar_liga.jsp");
        } else {
            ligaFacade.create(new Liga(nombre));
            request.getSession().setAttribute("mensaje", "La Liga se ha creado");
            response.sendRedirect("Liga/agregar_liga.jsp");
        }
        } catch (Exception e) {
          response.sendRedirect("Liga/agregar_liga.jsp");
        }
          
    }

    private void modificar(HttpServletRequest request, HttpServletResponse response) throws IOException {
     try {
            int id = Integer.parseInt(request.getParameter("txtId"));
            String nombre = request.getParameter("txtNombreLiga");
            if (ligaFacade.existeLiga(nombre)) {
                request.getSession().setAttribute("mensaje", "La liga no se ha Modificado");
                response.sendRedirect("Liga/listar_Liga.jsp");
            } else {
                ligaFacade.edit(new Liga(id, nombre));
                request.getSession().setAttribute("mensaje", "La liga se ha Modificado");
                response.sendRedirect("Liga/listar_Liga.jsp");
            }
        } catch (Exception e) {
          response.sendRedirect("Liga/listar_Liga.jsp");
        }
    }

}
