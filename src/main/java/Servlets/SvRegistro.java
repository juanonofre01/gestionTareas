/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Servlets;

import com.mycompany.listadotareas.Persistencia;
import com.mycompany.listadotareas.Usuario;
import com.mycompany.listadotareas.registroUsuario;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author PC
 */
@WebServlet(name = "SvRegistro", urlPatterns = {"/SvRegistro"})
public class SvRegistro extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet SvRegistro</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SvRegistro at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
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
        
        //Obtener la sesion actual
        HttpSession session = request.getSession();

        //Obtener el contexto del servlet
        ServletContext context = getServletContext();

        ArrayList<Usuario> misUsuarios = new ArrayList<>(); //Array a cargar con el txt

        //Cargar la lista de perros desde un archivo
        Persistencia.leeArchivo(misUsuarios, context);

        //Obtener datos del formulario enviados por POST
        int cedula = Integer.parseInt(request.getParameter("cedula"));

        String nombre = request.getParameter("nombre");

        String contrasenia = request.getParameter("contrasenia");
        
        /**
         * Verificar si el usuario ya existe, en caso de hacerlo no se añade y muestra mensaje.
         */
        
        if(registroUsuario.encontrarUsuariosIg(cedula, context)){
            /**
             * Si el usuario no existe, se añade.
             */ 
            Usuario user = new Usuario(cedula, nombre, contrasenia);//Añadimos un objeto de tipo Usuarios
            
            misUsuarios.add(user); //Lo agregamos al array
            
            Persistencia.escribeArchivo(misUsuarios, context);//Actualizamos el txt
            
            //Enviamos bandera que indica que se añadio exitosamente
            String registrado = "si";
            request.setAttribute("registrado", registrado);
            
        } else if(!registroUsuario.encontrarUsuariosIg(cedula, context)){
            /**
             * Si el usuario existe, no se añade.
             */ 
             
            //Enviamos bandera que indica que NO se añadio exitosamente
            String registrado = "no";
            request.setAttribute("registrado", registrado);
        }

        // Redireccionar a la página de destino internamente en el servidor
        RequestDispatcher dispatcher = request.getRequestDispatcher("index.jsp");
        dispatcher.forward(request, response);
        
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
