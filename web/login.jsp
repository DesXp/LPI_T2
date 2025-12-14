<%-- 
    Document   : login
    Created on : 13 dic 2025, 8:15:43 p.m.
    Author     : Desiderio
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Iniciar Sesión</title>

        <script src="https://cdn.tailwindcss.com"></script>
        <link href="https://cdn.jsdelivr.net/npm/daisyui@4.7.2/dist/full.min.css" rel="stylesheet" type="text/css" />

        <script>
            tailwind.config = {
                theme: {
                    extend: {
                        colors: {
                            'disney-bg': '#1A1D29',
                            'disney-blue': '#0063e5',
                            'disney-hover': '#0483ee',
                            'input-bg': '#31343e'
                        }
                    }
                }
            }
        </script>

        <style>
            body {
                background-image: linear-gradient(to bottom, rgba(26, 29, 41, 0.5), rgba(26, 29, 41, 0.9)),
                    url('https://wallpapers.com/images/featured/disney-has6vy47k75d0bzs.jpg');
                background-size: cover;
                background-position: center;
                height: 100vh;
            }
        </style>
    </head>
    <body class="flex items-center justify-center">

        <nav class="fixed top-0 left-0 p-6 z-50">
            <a href="index.jsp" class="text-3xl font-bold text-white tracking-widest uppercase cursor-pointer drop-shadow-lg hover:opacity-80 transition">
                DISN@Y+
            </a>
        </nav>

        <div class="card w-full max-w-md bg-[#1A1D29] shadow-2xl rounded-2xl p-8 z-10 border border-gray-700/50">

            <h2 class="text-white text-2xl font-bold mb-2">Iniciar Sesión</h2>
            <p class="text-gray-400 text-sm mb-6">Usa tu correo y contraseña para continuar.</p>

            <% if (request.getAttribute("mensaje") != null) {%>
            <div role="alert" class="alert alert-error mb-5 py-2 rounded-lg border-none bg-red-900/50 text-red-100">
                <svg xmlns="http://www.w3.org/2000/svg" class="stroke-current shrink-0 h-6 w-6" fill="none" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M10 14l2-2m0 0l2-2m-2 2l-2-2m2 2l2 2m7-2a9 9 0 11-18 0 9 9 0 0118 0z" /></svg>
                <span class="text-sm"><%= request.getAttribute("mensaje")%></span>
            </div>
            <% }%>

            <form action="LoginServlet" method="post" class="flex flex-col gap-5">

                <div class="form-control w-full">
                    <input type="text" name="txtUsuario" placeholder="Usuario" required 
                           class="input input-bordered w-full bg-[#31343e] text-white border-transparent focus:border-gray-400 focus:bg-[#3d404a] transition-all h-12" />
                </div>

                <div class="form-control w-full">
                    <input type="password" name="txtClave" placeholder="Contraseña" required 
                           class="input input-bordered w-full bg-[#31343e] text-white border-transparent focus:border-gray-400 focus:bg-[#3d404a] transition-all h-12" />
                </div>

                <button class="btn bg-[#0063e5] hover:bg-[#0483ee] text-white border-none w-full h-12 text-base font-bold uppercase tracking-wider mt-2">
                    Continuar
                </button>

            </form>



        </div>

    </body>
</html>