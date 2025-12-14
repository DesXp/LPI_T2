<%-- 
    Document   : index.jsp
    Created on : 14 dic 2025, 10:57:49 a.m.
    Author     : Desiderio
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Disney+ Clone</title>

        <script src="https://cdn.tailwindcss.com"></script>

        <script>
            tailwind.config = {
                theme: {
                    extend: {
                        colors: {
                            'disney-bg': '#1A1D29',
                            'disney-blue': '#0063e5', 
                            'disney-hover': '#0483ee',
                            'tile-bg': '#2f3345'
                        }
                    }
                }
            }
        </script>

        <style>
 
            body {
                background-color: #1A1D29;
                background-image:
                    linear-gradient(to bottom, rgba(26, 29, 41, 0.5), rgba(26, 29, 41, 0.5)),
                    url('https://images.hdqwalls.com/wallpapers/marvel-disney-plus-7c.jpg');

                background-size: cover; 
                background-position: center;
                background-attachment: fixed;
                font-family: sans-serif;
                overflow-x: hidden;
            }

      
            .brand-card {
                background: linear-gradient(rgba(58, 60, 74, 0.8), rgba(36, 38, 50, 0.8));
                box-shadow: rgb(0 0 0 / 69%) 0px 26px 30px -10px, rgb(0 0 0 / 73%) 0px 16px 10px -10px;
                border: 3px solid rgba(249, 249, 249, 0.1);
                transition: all 250ms cubic-bezier(0.25, 0.46, 0.45, 0.94) 0s;
                backdrop-filter: blur(10px);
            }

            .brand-card:hover {
                transform: scale(1.05);
                border-color: rgba(249, 249, 249, 0.8);
                box-shadow: rgb(0 0 0 / 80%) 0px 40px 58px -16px, rgb(0 0 0 / 72%) 0px 30px 22px -10px;
                background: linear-gradient(rgba(58, 60, 74, 1), rgba(36, 38, 50, 1));
            }

            .hero-gradient {
                background-image: linear-gradient(to bottom, rgba(26,29,41,0) 0%, rgba(26,29,41,0.8) 100%);
            }
        </style>
    </head>
    <body class="text-white min-h-screen flex flex-col">

        <nav class="fixed top-0 w-full h-[70px] z-50 flex items-center justify-between px-9 bg-transparent transition-all duration-500 ease-in-out">
            <div class="flex items-center gap-4">
                <h1 class="text-3xl font-bold tracking-wider">DISNEY+</h1>
            </div>

            <a href="login.jsp" class="uppercase tracking-wider border border-white/60 bg-black/60 px-6 py-2 rounded text-sm hover:bg-white hover:text-black transition duration-300 font-medium backdrop-blur-sm">
                Iniciar Sesión
            </a>
        </nav>

        <div class="relative w-full min-h-[70vh] flex items-center">
            <div class="absolute inset-0 z-0">
                <img src="https://image.tmdb.org/t/p/original/9ijMGlJKqcslswhVkE9w2Vfq9Pk.jpg" alt="Background" class="w-full h-full object-cover object-top opacity-80">
            </div>

            <div class="absolute inset-0 bg-gradient-to-r from-[#1A1D29] via-[#1A1D29]/40 to-transparent z-10"></div>
            <div class="absolute bottom-0 w-full h-40 hero-gradient z-10"></div>

            <div class="relative z-20 container mx-auto px-8 md:px-12 pt-20">
                <h2 class="text-5xl md:text-7xl font-bold mb-4 drop-shadow-xl max-w-2xl leading-tight">
                    Historias que esperas,<br> + historias que no imaginas.
                </h2>
                <p class="text-xl text-gray-300 mb-8 max-w-lg font-medium drop-shadow-md">
                    Disfruta de las mejores series, películas y documentales del mundo.
                </p>
                <a href="login.jsp" class="bg-disney-blue hover:bg-disney-hover text-white font-bold py-4 px-12 rounded uppercase tracking-widest text-lg transition shadow-lg inline-block">
                    Suscríbete Ahora
                </a>
            </div>
        </div>

        <div class="container mx-auto px-4 md:px-12 -mt-10 relative z-30 mb-12">
            <div class="grid grid-cols-2 md:grid-cols-5 gap-5">

                <div class="brand-card rounded-lg aspect-video flex items-center justify-center cursor-pointer relative overflow-hidden group">
                    <img src="https://upload.wikimedia.org/wikipedia/commons/3/3e/Disney%2B_logo.svg" alt="Disney" class="w-24 z-10 drop-shadow-lg">
                    <div class="absolute inset-0 bg-blue-900/40 opacity-0 group-hover:opacity-100 transition duration-300"></div>
                </div>

                <div class="brand-card rounded-lg aspect-video flex items-center justify-center cursor-pointer relative overflow-hidden group">
                    <span class="font-bold text-2xl tracking-widest z-10">PIXAR</span>
                    <div class="absolute inset-0 bg-gray-500/20 opacity-0 group-hover:opacity-100 transition duration-300"></div>
                </div>

                <div class="brand-card rounded-lg aspect-video flex items-center justify-center cursor-pointer relative overflow-hidden group">
                    <span class="font-black text-2xl tracking-tighter bg-red-600 text-white px-1 z-10">MARVEL</span>
                    <div class="absolute inset-0 bg-red-900/30 opacity-0 group-hover:opacity-100 transition duration-300"></div>
                </div>

                <div class="brand-card rounded-lg aspect-video flex items-center justify-center cursor-pointer relative overflow-hidden group">
                    <span class="font-bold text-xl tracking-widest z-10 text-center text-gray-200">STAR<br>WARS</span>
                    <div class="absolute inset-0 bg-yellow-600/10 opacity-0 group-hover:opacity-100 transition duration-300"></div>
                </div>

                <div class="brand-card rounded-lg aspect-video flex items-center justify-center cursor-pointer relative overflow-hidden group">
                    <span class="font-bold text-sm tracking-widest z-10 text-center border-2 border-yellow-400 pl-2 pr-2 py-1">NATIONAL<br>GEOGRAPHIC</span>
                    <div class="absolute inset-0 bg-yellow-500/10 opacity-0 group-hover:opacity-100 transition duration-300"></div>
                </div>

            </div>
        </div>

        <div class="container mx-auto px-4 md:px-12 pb-20">
            <h4 class="text-gray-300 font-semibold mb-4 text-lg">Recomendaciones para ti</h4>

            <div class="grid grid-cols-2 sm:grid-cols-3 md:grid-cols-4 lg:grid-cols-5 gap-4">

                <div class="rounded-lg overflow-hidden shadow-lg hover:scale-105 hover:ring-4 hover:ring-white transition duration-300 cursor-pointer bg-[#2f3345]">
                    <img src="https://whatsondisneyplus.com/wp-content/uploads/2019/11/CA7B0C0F-06BA-4120-AA3E-D478BEEEF02D.jpeg" class="w-full h-full object-cover">
                </div>

                <div class="rounded-lg overflow-hidden shadow-lg hover:scale-105 hover:ring-4 hover:ring-white transition duration-300 cursor-pointer bg-[#2f3345]">
                    <img src="https://image.tmdb.org/t/p/w500/1g0dhYtq4irTY1GPXvft6k4YLjm.jpg" class="w-full h-full object-cover">
                </div>

                <div class="rounded-lg overflow-hidden shadow-lg hover:scale-105 hover:ring-4 hover:ring-white transition duration-300 cursor-pointer bg-[#2f3345]">
                    <img src="https://es.web.img3.acsta.net/pictures/17/03/27/17/40/153012.jpg" class="w-full h-full object-cover">
                </div>

                <div class="rounded-lg overflow-hidden shadow-lg hover:scale-105 hover:ring-4 hover:ring-white transition duration-300 cursor-pointer bg-[#2f3345]">
                    <img src="https://image.tmdb.org/t/p/w500/wKiOkZTN9lUUUNZLmtnwubZYONg.jpg" class="w-full h-full object-cover">
                </div>

                <div class="rounded-lg overflow-hidden shadow-lg hover:scale-105 hover:ring-4 hover:ring-white transition duration-300 cursor-pointer bg-[#2f3345]">
                    <img src="https://lumiere-a.akamaihd.net/v1/images/image_bf8739ba.jpeg" class="w-full h-full object-cover">
                </div>

            </div>
        </div>

        <footer class="text-center py-8 text-xs text-gray-400 bg-[#0e1016]">
            <img src="https://upload.wikimedia.org/wikipedia/commons/3/3e/Disney%2B_logo.svg" alt="Logo Footer" class="w-20 mx-auto mb-4 opacity-50">
            <p>© 2025 Disney y su familia de compañías vinculadas. Todos los derechos reservados.</p>
            <p class="mt-2">Examen T2 - Desarrollo Web</p>
        </footer>

    </body>
</html>