<%-- 
    Document   : inicio
    Created on : 13 dic 2025, 8:16:35 p.m.
    Author     : Desiderio
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="entidad.Pelicula"%>
<%@page import="java.util.List"%>

<!DOCTYPE html>
<html lang="es">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Catálogo - Disney+ Clone</title>

        <script src="https://cdn.tailwindcss.com"></script>
        <link href="https://cdn.jsdelivr.net/npm/daisyui@4.7.2/dist/full.min.css" rel="stylesheet" type="text/css" />

        <style>
            body {
                background-image: linear-gradient(to bottom, rgba(26, 29, 41, 0.6), #1A1D29),
                    url('https://wallpaperaccess.com/full/250145.jpg');

                background-size: cover;
                background-position: center;
                background-attachment: fixed;
                min-height: 100vh;
                font-family: sans-serif;
                color: white;
            }

            .movie-card {
                transition: all 0.3s cubic-bezier(0.25, 0.46, 0.45, 0.94);
                border: 3px solid transparent;
            }

            .movie-card:hover {
                transform: scale(1.05);
                border-color: rgba(255, 255, 255, 0.8);
                z-index: 10;
                box-shadow: 0 20px 25px -5px rgba(0, 0, 0, 0.5), 0 10px 10px -5px rgba(0, 0, 0, 0.4);
            }

            .movie-actions {
                opacity: 0;
                transition: opacity 0.3s ease;
            }
            .movie-card:hover .movie-actions {
                opacity: 1;
            }
        </style>
    </head>
    <body>

        <nav class="navbar fixed top-0 z-50 bg-[#1A1D29]/80 backdrop-blur-md px-6 md:px-12 h-[72px] border-b border-gray-700/30">
            <div class="flex-1 items-center gap-6">
                <a href="index.jsp" class="text-3xl font-bold tracking-widest uppercase cursor-pointer text-white drop-shadow-md">
                    DISN@Y+
                </a>

                <div class="hidden md:flex space-x-6 text-sm font-bold text-gray-300 tracking-widest mt-1">
                    <a href="#" class="hover:text-white transition border-b-2 border-transparent hover:border-white pb-1">INICIO</a>
                    <a href="#" class="hover:text-white transition border-b-2 border-transparent hover:border-white pb-1">BÚSQUEDA</a>
                    <a href="#" class="hover:text-white transition border-b-2 border-transparent hover:border-white pb-1">MI LISTA</a>
                </div>
            </div>

            <div class="flex-none gap-4">
                <a href="PeliculaServlet?accion=cargar&id=0" class="btn bg-[#0063e5] hover:bg-[#0483ee] text-white border-none font-bold uppercase tracking-wide btn-sm h-10 px-6">
                    + Nuevo Título
                </a>

                <div class="dropdown dropdown-end">
                    <div tabindex="0" role="button" class="btn btn-ghost btn-circle avatar border border-gray-500">
                        <div class="w-10 rounded-full">
                            <img alt="User" src="https://img.freepik.com/psd-gratis/ilustracion-3d-avatar-o-perfil-humano_23-2150671142.jpg?semt=ais_hybrid&w=740&q=80" />
                        </div>
                    </div>
                    <ul tabindex="0" class="mt-3 z-[1] p-2 shadow menu menu-sm dropdown-content bg-[#1A1D29] border border-gray-700 rounded-box w-52">
                        <li><a class="text-gray-300 hover:text-white">Perfil</a></li>
                        <li><a href="login.jsp" class="text-red-400 hover:text-red-300">Cerrar Sesión</a></li>
                    </ul>
                </div>
            </div>
        </nav>

        <div class="container mx-auto px-6 md:px-12 pt-28 pb-12">

            <h2 class="text-xl font-bold text-gray-200 mb-6 flex items-center gap-2">
                <span class="w-1 h-6 bg-[#0063e5] rounded-full"></span>
                Mi Colección
            </h2>

            <div class="grid grid-cols-2 sm:grid-cols-3 md:grid-cols-4 lg:grid-cols-5 gap-6">

                <%
                    List<Pelicula> lista = (List<Pelicula>) request.getAttribute("listaPeliculas");

                    if (lista != null && !lista.isEmpty()) {
                        for (Pelicula p : lista) {
                %>

                <div class="movie-card relative rounded-lg overflow-hidden bg-[#1e232e] aspect-[2/3] group cursor-pointer shadow-lg">

                    <img src="<%= p.getUrlImagen()%>" 
                         alt="<%= p.getTitulo()%>" 
                         class="w-full h-full object-cover transition duration-300 opacity-90 group-hover:opacity-40"
                         onerror="this.src='https://via.placeholder.com/300x450?text=Sin+Imagen'">

                    <div class="movie-actions absolute inset-0 flex flex-col justify-end p-4 bg-gradient-to-t from-black via-black/90 to-transparent">

                        <h3 class="font-bold text-lg leading-tight mb-1 drop-shadow-lg text-white"><%= p.getTitulo()%></h3>

                        <div class="text-xs text-gray-300 font-medium mb-3 flex items-center gap-2 flex-wrap">
                            <span class="bg-gray-700 px-1 rounded text-[10px] text-white">HD</span>
                            <span><%= p.getAnioEstreno()%></span>
                            <span>•</span>
                            <span class="text-blue-400"><%= p.getNombreCategoria()%></span>
                        </div>

                        <div class="flex gap-2 mt-1">
                            <a href="PeliculaServlet?accion=cargar&id=<%= p.getIdPelicula()%>" 
                               class="flex-1 btn btn-sm bg-white hover:bg-gray-200 text-black border-none font-bold text-xs uppercase tracking-wider">
                                Editar
                            </a>

                            <a href="PeliculaServlet?accion=eliminar&id=<%= p.getIdPelicula()%>" 
                               onclick="return confirm('¿Seguro que deseas eliminar <%= p.getTitulo()%>?');"
                               class="btn btn-sm btn-square btn-outline border-gray-500 text-gray-400 hover:bg-red-600 hover:border-red-600 hover:text-white">
                                <svg xmlns="http://www.w3.org/2000/svg" class="h-4 w-4" fill="none" viewBox="0 0 24 24" stroke="currentColor"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 7l-.867 12.142A2 2 0 0116.138 21H7.862a2 2 0 01-1.995-1.858L5 7m5 4v6m4-6v6m1-10V4a1 1 0 00-1-1h-4a1 1 0 00-1 1v3M4 7h16" /></svg>
                            </a>
                        </div>
                    </div>
                </div>

                <%      }
                } else {
                %>
                <div class="col-span-full flex flex-col items-center justify-center py-20 opacity-60 text-center">
                    <div class="bg-gray-800 p-6 rounded-full mb-4">
                        <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-12 h-12 text-gray-400">
                        <path stroke-linecap="round" stroke-linejoin="round" d="M12 9v6m3-3H9m12 0a9 9 0 11-18 0 9 9 0 0118 0z" />
                        </svg>
                    </div>
                    <p class="text-xl font-medium text-white">Tu colección está vacía</p>
                    <p class="text-sm text-gray-400 mt-2">¡Agrega tu primera película arriba!</p>
                </div>
                <% }%>

            </div>
        </div>

    </body>
</html>