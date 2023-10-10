/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Servlets;

import com.mycompany.listadotareas.registroUsuario;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet(name = "SvLogin", urlPatterns = {"/SvLogin"})
public class SvLogin extends HttpServlet {

    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet SvLogin</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SvLogin at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        
        int cedula=Integer.parseInt(request.getParameter("cedula"));
        String contrasenia=request.getParameter("contrasenia");
        
        
        // Contexto de servlet para obtener la PATH
        ServletContext context=getServletContext();
        
        
        //Llamamos al metodo para verificar si coincide la cedula y contraseña con los usuarios guardados
        String user=registroUsuario.verificarUsuario(cedula,contrasenia, context); 
        
        
        // Verifica para saber si ingresa o no 
        if (user.equals("No encontrado")){
            
            request.getRequestDispatcher("index.jsp?valido="+"false").forward(request, response);// Redirigimos al index con la variable no valida para mostrar mensaje al usuario.
            
        } else if(!user.equals("No encontrado")){
            
            request.getRequestDispatcher("login.jsp?usuarioI="+user).forward(request, response);// Redirigimos al login con el nombre de usuario para mostrar el mensaje personalizado.
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    } // </editor-fold>

}
