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
import modelo.dao.JugadorFacade;
import modelo.dao.SuperUsuarioFacade;
import modelo.dto.SuperUsuario;

/**
 *
 * @author Berni
 */
public class ServletAcceso extends HttpServlet {

    @EJB
    private JugadorFacade jugadorFacade;

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

        if (opcion.equals("Ingresar")) {
            ingresar(request, response);
        }
        if (opcion.equals("Entrar")) {
            entrar(request, response);
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

    private void ingresar(HttpServletRequest request, HttpServletResponse response) throws IOException {

        try {
            String user = request.getParameter("txtNombreUsuario");
            String pass = request.getParameter("txtPassword");
            int tipo = Integer.parseInt(request.getParameter("cboTipo"));
            int estado = 1;
            if (superUsuarioFacade.ingresar1(user, pass, tipo, estado)) {
                if (tipo==1) {
                    response.sendRedirect("SuperUsuario/index_super.jsp"); 
                }else if(tipo==2){
                   response.sendRedirect("SuperUsuario/index_admin.jsp"); 
                }
            }  else {
                request.getSession().setAttribute("mensaje", "Credenciales incorrectas");
                response.sendRedirect("login1.jsp");  
            }
        }
         catch (Exception e) {
            response.sendRedirect("login1.jsp");
        }

    }

    private void entrar(HttpServletRequest request, HttpServletResponse response) throws IOException {
       try {
            String user = request.getParameter("txtNombreUsuario");
            String pass = request.getParameter("txtPassword");
            int tipo = Integer.parseInt(request.getParameter("cboTipo"));
            int estado = 1;
            if (jugadorFacade.ingresar(user, pass, tipo, estado)){
                if (tipo==1) {
                    response.sendRedirect("SuperUsuario/index_super.jsp"); 
                }else if(tipo==2){
                   response.sendRedirect("Equipo/index_equipo.jsp"); 
                }
            }  else {
                request.getSession().setAttribute("mensaje", "Credenciales incorrectas");
                response.sendRedirect("login1.jsp");  
            }
        }
         catch (Exception e) {
            response.sendRedirect("login1.jsp");
        } 
    }

    

}
