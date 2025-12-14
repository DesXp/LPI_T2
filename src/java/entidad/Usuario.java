/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entidad;

/**
 *
 * @author Desiderio
 */
public class Usuario {
    
    private int idUsuario;
    private String usuario;
    private String password;
    private String email;
    private String nombres;
    
    public Usuario() {}

    public Usuario(int idUsuario, String usuario, String password, String email, String nombres) {
        this.idUsuario = idUsuario;
        this.usuario = usuario;
        this.password = password;
        this.email = email;
        this.nombres = nombres;
    }
    

    public int getIdUsuario() {
        return idUsuario;
    }

    public void setIdUsuario(int idUsuario) {
        this.idUsuario = idUsuario;
    }

    public String getUsuario() {
        return usuario;
    }

    public void setUsuario(String usuario) {
        this.usuario = usuario;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getNombres() {
        return nombres;
    }

    public void setNombres(String nombres) {
        this.nombres = nombres;
    }

    
    
    
}
