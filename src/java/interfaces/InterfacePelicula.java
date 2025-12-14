/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package interfaces;
import entidad.Categoria;
import entidad.Pelicula;
import java.util.List;


/**
 *
 * @author Desiderio
 */
public interface InterfacePelicula {
    
    public List<Pelicula> listarPeliculas();
    public int registrarPelicula(Pelicula p);
    public int actualizarPelicula(Pelicula p);
    public int eliminarPelicula(int id);
    public Pelicula obtenerPelicula(int id);
    
    public List<Categoria> listarCategorias();
    
}
