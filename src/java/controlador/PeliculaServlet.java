/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controlador;

import dao.PeliculaDAO;
import entidad.Pelicula;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;

/**
 *
 * @author Desiderio
 */
@WebServlet(name = "PeliculaServlet", urlPatterns = {"/PeliculaServlet"})
public class PeliculaServlet extends HttpServlet {

    PeliculaDAO dao = new PeliculaDAO();

    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String accion = request.getParameter("accion");
        if (accion == null) {
            accion = "listar"; // Por defecto listamos
        }
        switch (accion) {
            case "listar":
                listar(request, response);
                break;
            case "registrar":
                registrar(request, response);
                break;
            case "cargar":
                cargar(request, response);
                break;
            case "actualizar":
                actualizar(request, response);
                break;
            case "eliminar":
                eliminar(request, response);
                break;
            default:
                listar(request, response);
        }
    }

    private void listar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Pelicula> lista = dao.listarPeliculas();
        request.setAttribute("listaPeliculas", lista);
        request.getRequestDispatcher("inicio.jsp").forward(request, response);
    }

    private void registrar(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String titulo = request.getParameter("txtTitulo");
        String descripcion = request.getParameter("txtDescripcion");
        int anio = Integer.parseInt(request.getParameter("txtAnio"));
        String imagen = request.getParameter("txtImagen");
        int idCategoria = Integer.parseInt(request.getParameter("cboCategoria"));

        Pelicula p = new Pelicula();
        p.setTitulo(titulo);
        p.setDescripcion(descripcion);
        p.setAnioEstreno(anio);
        p.setUrlImagen(imagen);
        p.setIdCategoria(idCategoria);

        dao.registrarPelicula(p);

        response.sendRedirect("PeliculaServlet?accion=listar");
    }

    private void cargar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Pelicula p = dao.obtenerPelicula(id);

        request.setAttribute("peliculaEditar", p);
        request.setAttribute("listaCategorias", dao.listarCategorias());
        request.getRequestDispatcher("registraPeliculas.jsp").forward(request, response);
    }

    private void actualizar(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int id = Integer.parseInt(request.getParameter("txtId"));
        String titulo = request.getParameter("txtTitulo");
        String descripcion = request.getParameter("txtDescripcion");
        int anio = Integer.parseInt(request.getParameter("txtAnio"));
        String imagen = request.getParameter("txtImagen");
        int idCategoria = Integer.parseInt(request.getParameter("cboCategoria"));

        Pelicula p = new Pelicula();
        p.setIdPelicula(id);
        p.setTitulo(titulo);
        p.setDescripcion(descripcion);
        p.setAnioEstreno(anio);
        p.setUrlImagen(imagen);
        p.setIdCategoria(idCategoria);

        dao.actualizarPelicula(p);
        response.sendRedirect("PeliculaServlet?accion=listar");
    }

    private void eliminar(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        dao.eliminarPelicula(id);
        response.sendRedirect("PeliculaServlet?accion=listar");
    }

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
            out.println("<title>Servlet PeliculaServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet PeliculaServlet at " + request.getContextPath() + "</h1>");
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
        processRequest(request, response);
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
