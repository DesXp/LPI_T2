/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import entidad.Categoria;
import entidad.Pelicula;
import interfaces.InterfacePelicula;
import utils.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Desiderio
 */
public class PeliculaDAO implements InterfacePelicula {

    @Override
    public List<Pelicula> listarPeliculas() {

        List<Pelicula> lista = new ArrayList<>();
        Connection cn = null;
        PreparedStatement pstm = null;
        ResultSet rs = null;

        try {
            cn = Conexion.getConexion();
            String sql = "SELECT p.*, c.nombre AS nom_cat FROM tb_pelicula p "
                    + "JOIN tb_categoria c ON p.id_categoria = c.id_categoria";
            pstm = cn.prepareStatement(sql);
            rs = pstm.executeQuery();

            while (rs.next()) {
                Pelicula p = new Pelicula();
                p.setIdPelicula(rs.getInt("id_pelicula"));
                p.setTitulo(rs.getString("titulo"));
                p.setDescripcion(rs.getString("descripcion"));
                p.setAnioEstreno(rs.getInt("anio_estreno"));
                p.setUrlImagen(rs.getString("url_imagen"));
                p.setIdCategoria(rs.getInt("id_categoria"));
                p.setNombreCategoria(rs.getString("nom_cat"));
                lista.add(p);
            }

        } catch (Exception e) {
            System.out.println("Ocurrio un error al listar peliculas: " + e.getMessage());
        }

        return lista;

    }

    @Override
    public int registrarPelicula(Pelicula p) {

        int result = 0;
        Connection cn = null;
        PreparedStatement pstm = null;

        try {

            cn = Conexion.getConexion();
            String sql = "INSERT INTO tb_pelicula (titulo, descripcion, anio_estreno, url_imagen, id_categoria) VALUES (?,?,?,?,?)";
            pstm = cn.prepareStatement(sql);
            pstm.setString(1, p.getTitulo());
            pstm.setString(2, p.getDescripcion());
            pstm.setInt(3, p.getAnioEstreno());
            pstm.setString(4, p.getUrlImagen());
            pstm.setInt(5, p.getIdCategoria());
            result = pstm.executeUpdate();

        } catch (Exception e) {
            System.out.println("Ocurrio un error al registrar pelicula: " + e.getMessage());
        }

        return result;

    }

    @Override
    public int actualizarPelicula(Pelicula p) {

        int result = 0;
        Connection cn = null;
        PreparedStatement pstm = null;
        try {

            cn = Conexion.getConexion();
            String sql = "UPDATE tb_pelicula SET titulo=?, descripcion=?, anio_estreno=?, url_imagen=?, id_categoria=? WHERE id_pelicula=?";
            pstm = cn.prepareStatement(sql);
            pstm.setString(1, p.getTitulo());
            pstm.setString(2, p.getDescripcion());
            pstm.setInt(3, p.getAnioEstreno());
            pstm.setString(4, p.getUrlImagen());
            pstm.setInt(5, p.getIdCategoria());
            pstm.setInt(6, p.getIdPelicula());
            result = pstm.executeUpdate();

        } catch (Exception e) {
            System.out.println("Ocurrio un error al actulizar pelicula: " + e.getMessage());
        }

        return result;

    }

    @Override
    public int eliminarPelicula(int id) {

        int result = 0;
        Connection cn = null;
        PreparedStatement pstm = null;

        try {
            cn = Conexion.getConexion();
            String sql = "DELETE FROM tb_pelicula WHERE id_pelicula=?";
            pstm = cn.prepareStatement(sql);
            pstm.setInt(1, id);
            result = pstm.executeUpdate();

        } catch (Exception e) {
            System.out.println("Ocurrio un error al eliminar pelicula: " + e.getMessage());
        }

        return result;

    }

    @Override
    public Pelicula obtenerPelicula(int id) {

        Pelicula p = null;
        Connection cn = null;
        PreparedStatement pstm = null;
        ResultSet rs = null;

        try {
            cn = Conexion.getConexion();
            String sql = "SELECT * FROM tb_pelicula WHERE id_pelicula=?";
            pstm = cn.prepareStatement(sql);
            pstm.setInt(1, id);
            rs = pstm.executeQuery();

            if (rs.next()) {
                p = new Pelicula();
                p.setIdPelicula(rs.getInt("id_pelicula"));
                p.setTitulo(rs.getString("titulo"));
                p.setDescripcion(rs.getString("descripcion"));
                p.setAnioEstreno(rs.getInt("anio_estreno"));
                p.setUrlImagen(rs.getString("url_imagen"));
                p.setIdCategoria(rs.getInt("id_categoria"));
            }

        } catch (Exception e) {
            System.out.println("Ocurrio un error al obtener datos de pelicula: " + e.getMessage());
        }

        return p;

    }

    @Override
    public List<Categoria> listarCategorias() {
        List<Categoria> lista = new ArrayList<>();
        Connection cn = null;
        PreparedStatement pstm = null;
        ResultSet rs = null;
        try {
            cn = Conexion.getConexion();
            String sql = "SELECT * FROM tb_categoria";
            pstm = cn.prepareStatement(sql);
            rs = pstm.executeQuery();
            while (rs.next()) {
                Categoria c = new Categoria();
                c.setIdCategoria(rs.getInt("id_categoria"));
                c.setNombre(rs.getString("nombre"));
                lista.add(c);
            }
        }
        
        catch (Exception e) {
            System.out.println("Ocurrio un error al agregar: " + e.getMessage());
        }

        return lista;

    }

}
