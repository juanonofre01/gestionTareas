/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.listadotareas;

import java.io.BufferedReader;
import java.io.EOFException;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletContext;


public class Persistencia {
    
    public static void escribeArchivo(ArrayList<Usuario> misUsuarios, ServletContext context) throws FileNotFoundException {


        
        String rutaRelativa = "/data/usuariosReg.txt";
        String rutaAbsoluta = context.getRealPath(rutaRelativa);
        File archivo = new File(rutaAbsoluta);

        try (PrintWriter pluma = new PrintWriter(archivo)) {
            for (Usuario usuario : misUsuarios) {
                // inicializa los datos en una línea y escribe en el archivo
                String linea = usuario.getCedula() + "," + usuario.getNombre() + ","
                        + usuario.getContrasena();
                pluma.println(linea);
            }

        } catch (FileNotFoundException e) {
            System.out.println("No se pudo encontrar el archivo de datos.");
        }
    }

    public static void leeArchivo(ArrayList<Usuario> misUsuarios, ServletContext context) throws FileNotFoundException, IOException {

        
        String rutaRelativa = "/data/usuariosReg.txt";
        String rutaAbsoluta = context.getRealPath(rutaRelativa);
        File archivo = new File(rutaAbsoluta);

        try (FileReader fr = new FileReader(archivo); BufferedReader lector = new BufferedReader(fr)) {

            String linea;
            // Leer cada línea

            while ((linea = lector.readLine()) != null) {
                
                String[] datos = linea.split(",");

                String cedula = datos[0].trim();
                String nombre = datos[1].trim();
                String contrasenia = datos[2].trim();

                
                Usuario usuario = new Usuario(Integer.parseInt(cedula), nombre, contrasenia);
                misUsuarios.add(usuario);
            }

        } catch (FileNotFoundException e) {
            System.out.println("No se pudo encontrar el archivo de datos.");
        } catch (IOException e) {
            System.out.println("Error durante la lectura del archivo.");
        }
    }
    
}