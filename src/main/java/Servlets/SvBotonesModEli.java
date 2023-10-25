/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Servlets;

import com.mycompany.listadotareas.ListadoTarea;
import com.mycompany.listadotareas.Serializar;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet(name = "SvBotonesModEli", urlPatterns = {"/SvBotonesModEli"})
public class SvBotonesModEli extends HttpServlet {

    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
    }

    ListadoTarea listaTareas = new ListadoTarea();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);

        //Obtener el contexto del servlet
        ServletContext context = getServletContext();

        
        try {
            listaTareas = Serializar.leerTareas(context);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(SvBotonesModEli.class.getName()).log(Level.SEVERE, null, ex);
        }

        
        String idEliminar = request.getParameter("id"); // se obtiene el id a eliminar

        System.out.println(idEliminar);

        int eliminar = Integer.parseInt(idEliminar);

        listaTareas.eliminarTarea(eliminar);

        Serializar.escribirArchivo(listaTareas, context);

            // Redireccionar a la página de login
            response.sendRedirect("login.jsp");

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
       ServletContext context = getServletContext();
        String nombre = request.getParameter("usuarioI");
        
        try {
            listaTareas = Serializar.leerTareas(context);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(SvBotonesModEli.class.getName()).log(Level.SEVERE, null, ex);
        }
        String edit = request.getParameter("edit");
        int id=Integer.parseInt( request.getParameter("idEd"));
        
        
        switch(edit){
            case"tit":
                String titulo = request.getParameter("tituloNuev"); 
                listaTareas.editarTitulo(id,titulo);              
                break;
            case "des":
                String descripcion = request.getParameter("desNuev"); 
                listaTareas.editarDescripcion(id, descripcion);
                break;
            case "fec":
                String fechaStr = request.getParameter("fecNuev");

                SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                Date fecha = null;
                    
                //excepciones, fecha 
                try {
                    fecha = sdf.parse(fechaStr);
                } catch (ParseException e) {
                    e.printStackTrace(); // si la fecha no es válida
                };
                listaTareas.editarFecha(id, fecha);
                break;
        }
        
        //se modifica
        Serializar.escribirArchivo(listaTareas, context);   
        
        response.sendRedirect("login.jsp?usuarioI="+nombre);

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
