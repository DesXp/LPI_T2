<%-- 
    Document   : registrarPeliculas
    Created on : 13 dic 2025, 8:17:14 p.m.
    Author     : Desiderio
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="entidad.Pelicula"%>
<%@page import="entidad.Categoria"%>

<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <title>Gestión de Películas</title>
        <link href="https://cdn.jsdelivr.net/npm/daisyui@4.7.2/dist/full.min.css" rel="stylesheet" type="text/css" />
        <script src="https://cdn.tailwindcss.com"></script>

        <style>
            body {
                background-image: linear-gradient(to bottom, rgba(0,0,0,0.6), rgba(0,0,0,0.8)),
                    url('https://wallpaperaccess.com/full/250145.jpg');
                background-size: cover;
                background-position: center;
                min-height: 100vh;
                font-family: sans-serif;
                display: flex;
                align-items: center;
                justify-content: center;
                padding: 20px;
            }

            .input-dark {
                @apply bg-[#31343e] text-white border-gray-600 focus:border-blue-500 placeholder-gray-400;
            }
        </style>
    </head>
    <body>

        <%
            Pelicula p = (Pelicula) request.getAttribute("peliculaEditar");
            List<Categoria> cats = (List<Categoria>) request.getAttribute("listaCategorias");

            if (p == null) {
                p = new Pelicula();
                p.setIdPelicula(0);
            }

            boolean esEdicion = (p.getIdPelicula() > 0);
            String titulo = esEdicion ? "Editar Película" : "Nuevo Título";
            String accion = esEdicion ? "actualizar" : "registrar";

            String valTitulo = (p.getTitulo() != null) ? p.getTitulo() : "";
            String valDesc = (p.getDescripcion() != null) ? p.getDescripcion() : "";
            String valImg = (p.getUrlImagen() != null) ? p.getUrlImagen() : "";
            int valAnio = p.getAnioEstreno();
        %>

        <div class="card w-full max-w-lg bg-[#1A1D29]/90 shadow-2xl border border-gray-700 backdrop-blur-sm">
            <div class="card-body rounded-xl">
                <h2 class="text-3xl font-bold mb-6 text-center text-white border-b border-gray-700 pb-4"><%= titulo%></h2>

                <form action="PeliculaServlet" method="post" class="flex flex-col gap-4">

                    <input type="hidden" name="accion" value="<%= accion%>">
                    <input type="hidden" name="txtId" value="<%= p.getIdPelicula()%>">

                    <div>
                        <label class="label"><span class="label-text text-gray-300 font-semibold">Título</span></label>
                        <input type="text" name="txtTitulo" value="<%= valTitulo%>" required 
                               class="input input-bordered w-full bg-[#31343e] text-white placeholder-gray-400 border-gray-600 focus:border-blue-500" 
                               placeholder="Ej. Avengers" />
                    </div>

                    <div>
                        <label class="label"><span class="label-text text-gray-300 font-semibold">Descripción</span></label>
                        <textarea name="txtDescripcion" required class="textarea textarea-bordered w-full bg-[#31343e] text-white placeholder-gray-400 border-gray-600 focus:border-blue-500 h-24" placeholder="Sinopsis..."><%= valDesc%></textarea>
                    </div>

                    <div class="flex gap-4">
                        <div class="w-1/2">
                            <label class="label"><span class="label-text text-gray-300 font-semibold">Año</span></label>
                            <input type="number" name="txtAnio" value="<%= valAnio == 0 ? "" : valAnio%>" required min="1900" max="2099"
                                   class="input input-bordered w-full bg-[#31343e] text-white placeholder-gray-400 border-gray-600 focus:border-blue-500" 
                                   placeholder="2024" />
                        </div>

                        <div class="w-1/2">
                            <label class="label"><span class="label-text text-gray-300 font-semibold">Categoría</span></label>
                            <select name="cboCategoria" required class="select select-bordered w-full bg-[#31343e] text-white border-gray-600 focus:border-blue-500">
                                <% if (cats != null) {
                                        for (Categoria c : cats) {
                                            String selected = (c.getIdCategoria() == p.getIdCategoria()) ? "selected" : "";
                                %>
                                <option value="<%= c.getIdCategoria()%>" <%= selected%> class="text-white bg-[#31343e]">
                                    <%= c.getNombre()%>
                                </option>
                                <%  }
                            } else { %>
                                <option disabled>Error cargando categorías</option>
                                <% }%>
                            </select>
                        </div>
                    </div>

                    <div>
                        <label class="label"><span class="label-text text-gray-300 font-semibold">URL Imagen (No mayor a 255 caracteres)</span></label>
                        <input type="text" name="txtImagen" value="<%= valImg%>" required 
                               class="input input-bordered w-full bg-[#31343e] text-white placeholder-gray-400 border-gray-600 focus:border-blue-500" 
                               placeholder="https://ejemplo.com/imagen.jpg" />
                    </div>

                    <div class="flex gap-3 mt-8">
                        <button type="submit" class="btn bg-blue-600 hover:bg-blue-700 text-white flex-1 border-none font-bold uppercase">
                            Guardar Película
                        </button>
                        <a href="PeliculaServlet?accion=listar" class="btn btn-outline border-gray-500 text-gray-300 hover:bg-white hover:text-black flex-1 font-bold uppercase">
                            Cancelar
                        </a>
                    </div>

                </form>
            </div>
        </div>

    </body>
</html>