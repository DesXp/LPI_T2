/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import entidad.Usuario;
import interfaces.InterfaceUsuario;
import utils.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author Desiderio
 */
public class UsuarioDAO implements InterfaceUsuario {

    @Override
    public Usuario validarUsuario(String usuario, String password) {
        Usuario u = null;
        Connection cn = null;
        PreparedStatement pstm = null;
        ResultSet rs = null;

        try {
            cn = Conexion.getConexion();
            String sql = "SELECT * FROM tb_usuario WHERE usuario = ? AND password = ?";
            pstm = cn.prepareStatement(sql);
            pstm.setString(1, usuario);
            pstm.setString(2, password);

            rs = pstm.executeQuery();

            if (rs.next()) {

                u = new Usuario();
                u.setIdUsuario(rs.getInt("id_usuario"));
                u.setUsuario(rs.getString("usuario"));
                u.setEmail(rs.getString("email"));
                u.setNombres(rs.getString("nombres"));

            }
        } catch (Exception e) {
            System.out.println("Ocurrio un error al validar: " + e.getMessage());
        }
        return u;

    }

}
