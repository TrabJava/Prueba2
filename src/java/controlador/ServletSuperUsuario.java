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
import modelo.dao.SuperUsuarioFacade;
import modelo.dto.EstadoSuper;
import modelo.dto.SuperUsuario;
import modelo.dto.TipoSuper;

/**
 *
 * @author Berni
 */
public class ServletSuperUsuario extends HttpServlet {

    @EJB
    private SuperUsuarioFacade superUsuarioFacade;

   

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
        if (opcion.equals("Eliminar")) {
            eliminar(request, response);
        }
        if (opcion.equals("Modificar")) {
            modificar(request, response);
        }
        if (opcion.equals("Listar")) {
            listar(request, response);
        }
        if (opcion.equals("Buscar")) {
            buscar(request, response);
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

        String user = request.getParameter("txtUser");
        String pass = request.getParameter("txtPass");
        int tipo = Integer.parseInt(request.getParameter("cboTipo")) ;
        int estado = Integer.parseInt(request.getParameter("cboEstado")) ;

        if (superUsuarioFacade.existeUsuario(user)) {
            request.getSession().setAttribute("mensaje", "El usuario ya existe");
            response.sendRedirect("Vistas/agregar_administrador.jsp");
        } else {
            TipoSuper tipoSuper = new TipoSuper(tipo);
            EstadoSuper estadoSu = new EstadoSuper(estado);
            SuperUsuario superU = new SuperUsuario(tipo, user, pass, tipoSuper, estadoSu);
            superUsuarioFacade.create(superU);
            request.getSession().setAttribute("mensaje", "El usuaro se ha creado");
            response.sendRedirect("Vistas/agregar_administrador.jsp");
        }

    }

    private void eliminar(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String user = request.getParameter("txtUser");
        String pass = request.getParameter("txtPass");
        int tipo = Integer.parseInt(request.getParameter("cboTipo"));
        int estado = Integer.parseInt(request.getParameter("cboTipo"));
        int id = Integer.parseInt(request.getParameter("cboUsuarios"));

        if (superUsuarioFacade.existeId(id)) {
            TipoSuper tipoSuper = new TipoSuper(tipo);
            EstadoSuper estadoSu = new EstadoSuper(estado);
            SuperUsuario su = new SuperUsuario(id, user, pass, tipoSuper, estadoSu);
            superUsuarioFacade.remove(su);
            request.getSession().setAttribute("mensaje", "El Usuario se Eliminó");
            response.sendRedirect("Vistas/listar_admin.jsp");

        } else {
            request.getSession().setAttribute("mensaje", "El usuario no existe");
            response.sendRedirect("Vistas/index_super.jsp");
        }

    }

    private void modificar(HttpServletRequest request, HttpServletResponse response) throws IOException {

        String user = request.getParameter("txtUser");
        String pass = request.getParameter("txtPass");
        int tipo = Integer.parseInt(request.getParameter("cboTipo"));
        int estado = Integer.parseInt(request.getParameter("cboTipo"));
        int id = Integer.parseInt(request.getParameter("txtId"));

        if (superUsuarioFacade.existeId(id)) {
            TipoSuper tipoSuper = new TipoSuper(tipo);
            EstadoSuper estadoSu = new EstadoSuper(estado);
            SuperUsuario su = new SuperUsuario(id, user, pass, tipoSuper, estadoSu);
            superUsuarioFacade.remove(su);
            superUsuarioFacade.create(su);
            request.getSession().setAttribute("mensaje", "El Usuario se Modificó");
            response.sendRedirect("Vistas/listar_admin.jsp");

        } else {
            request.getSession().setAttribute("mensaje", "El usuario no existe");
            response.sendRedirect("Vistas/index_super.jsp");
        }

    }

    private void listar(HttpServletRequest request, HttpServletResponse response) throws IOException {

        request.getSession().setAttribute("lista", superUsuarioFacade.findAll());
        response.sendRedirect("Vistas/listar_admin.jsp");
    }

    private void buscar(HttpServletRequest request, HttpServletResponse response) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

   

}
