/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.listadotareas;

import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletContext;

/**
 *
 * @author PC
 */
public class registroUsuario {
    
    public static String verificarUsuario(int cedulaV, String contraseñaV, ServletContext context) throws IOException{
       
        //Creamos array que se llena con el archivo de texto
        ArrayList<Usuario> misUsuarios = new ArrayList<>(); 
        
        //Llenamos el array con el archivo
        Persistencia.leeArchivo(misUsuarios, context);
        
        
        for (Usuario u: misUsuarios){ 
            
            //En caso de cedula y contraseña se parecen en un mismo objeto
            if (u.getCedula()==cedulaV && u.getContrasena().equals(contraseñaV)){
                return u.getNombre();
            }
        }
        //Si no se encontró
        return "No encontrado"; 
    }
    
    
    public static boolean encontrarUsuariosIg(int cedulaV, ServletContext context) throws IOException{
        
        ArrayList<Usuario> misUsuarios = new ArrayList<>(); 
        
        Persistencia.leeArchivo(misUsuarios, context); 
        
        for (Usuario u: misUsuarios){ 
            
             //En caso de una cedula igual
            if (u.getCedula()==cedulaV){
                //Se devuelve falso
                return false; 
            }
        }
        
        return true; 
    }
    
}
