/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.listadotareas;

import java.io.EOFException;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import javax.servlet.ServletContext;


public class Serializar {
  public static void escribirArchivo(ListadoTarea listaTareas, ServletContext context) throws FileNotFoundException, IOException {
        // Ruta del archivo de datos serializados
        String rutaRelativa = "/data/trabajos.ser";
        String rutaAbsoluta = context.getRealPath(rutaRelativa);
        File archivo = new File(rutaAbsoluta);

        try (FileOutputStream fos = new FileOutputStream(archivo); ObjectOutputStream oos = new ObjectOutputStream(fos)) {
            // Serializar y escribir la lista enlazada en el archivo
            oos.writeObject(listaTareas);
        } catch (IOException e) {
            System.out.println("Error al escribir.");
        }
    }

    public static ListadoTarea leerTareas(ServletContext context) throws IOException, ClassNotFoundException {
        ListadoTarea listaTareas = null;
        // Ruta relativa y absoluta del archivo de datos serializados
        String rutaRelativa = "/data/trabajos.ser";
        String rutaAbsoluta = context.getRealPath(rutaRelativa);
        File archivo = new File(rutaAbsoluta);

        if (archivo.exists() && archivo.isFile()) {
            try (FileInputStream fis = new FileInputStream(archivo); ObjectInputStream ois = new ObjectInputStream(fis)) {
                // Leer y deserializar la lista enlazada desde el archivo
                listaTareas = (ListadoTarea) ois.readObject();
            } catch (EOFException e) {
                // EOFException indica que el archivo estaba vacío
                System.out.println("El archivo está vacío.");
            } catch (IOException e) {
                System.out.println("Error al leer.");
            }
        } else {
            System.out.println("El archivo no existe.");
        }

        return listaTareas;
    }
}
