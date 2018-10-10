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
import modelo.dto.Equipo;
import modelo.dto.EstadoJugador;
import modelo.dto.Jugador;
import modelo.dto.SeleccionJugador;
import modelo.dto.TipoJugador;

/**
 *
 * @author Berni
 */
public class ServletJugador extends HttpServlet {

    @EJB
    private JugadorFacade jugadorFacade;

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
        //Recibimos el boton del formulario
        String opcion = request.getParameter("btnAccion");
        //Cual accion se ejecuta
        if (opcion.equals("Agregar")) {
            agregar(request, response);
        }
        if (opcion.equals("Eliminar")) {
            eliminar(request, response);
        }
        if (opcion.equals("Listar")) {
            listar(request, response);
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
        String nombre = request.getParameter("txtNombre");
        String apellido = request.getParameter("txtApellido");
        String rut = request.getParameter("txtRut");
        String user = request.getParameter("txtUser");
        String pass = request.getParameter("txtPass");
        int tipo = Integer.parseInt(request.getParameter("cboTipo"));
        int estado = Integer.parseInt(request.getParameter("cboEstado"));
        int seleccion = Integer.parseInt(request.getParameter("cboSeleccion"));
        int equipo = Integer.parseInt(request.getParameter("cboEquipo"));

        if (jugadorFacade.existeUsuario(user, rut)) {
            request.getSession().setAttribute("mensaje", "El jugador ya existe");
            response.sendRedirect("index.jsp");
        } else {
            TipoJugador tipoJug = new TipoJugador(tipo);
            EstadoJugador estadoJug = new EstadoJugador(estado);
            SeleccionJugador seleccionJug = new SeleccionJugador(seleccion);
            Equipo equipJug = new Equipo(equipo);
            Jugador jugador = new Jugador(nombre, apellido, rut, user, pass, tipoJug, estadoJug, seleccionJug, equipJug);
            jugadorFacade.create(jugador);
            request.getSession().setAttribute("mensaje", "El jugador se ha creado");
            response.sendRedirect("index.jsp");
        }

    }

    private void eliminar(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String nombre = request.getParameter("txtNombre");
        String apellido = request.getParameter("txtApellido");
        String rut = request.getParameter("txtRut");
        String user = request.getParameter("txtUser");
        String pass = request.getParameter("txtPass");
        int tipo = Integer.parseInt(request.getParameter("cboTipo"));
        int estado = Integer.parseInt(request.getParameter("cboEstado"));
        int seleccion = Integer.parseInt(request.getParameter("cboSeleccion"));
        int equipo = Integer.parseInt(request.getParameter("cboEquipo"));

        if (jugadorFacade.existeUsuario(user, rut)) {
            TipoJugador tipoJug = new TipoJugador(tipo);
            EstadoJugador estadoJug = new EstadoJugador(estado);
            SeleccionJugador seleccionJug = new SeleccionJugador(seleccion);
            Equipo equipJug = new Equipo(equipo);
            Jugador jugador = new Jugador(nombre, apellido, rut, user, pass, tipoJug, estadoJug, seleccionJug, equipJug);
            jugadorFacade.create(jugador);
            request.getSession().setAttribute("mensaje", "El jugador se ha creado");
            response.sendRedirect("index.jsp");

        } else {
            request.getSession().setAttribute("mensaje", "El jugador ya existe");
            response.sendRedirect("index.jsp");
        }
    }

    private void listar(HttpServletRequest request, HttpServletResponse response) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    private void modificar(HttpServletRequest request, HttpServletResponse response) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

}
