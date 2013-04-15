<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <link href="css/modern.css" rel="stylesheet">
    <link href="css/theme-dark.css" rel="stylesheet">

    <script src="js/jquery-1.8.2.min.js"></script>
    <script src="js/google-analytics.js"></script>
    <script src="js/jquery.mousewheel.min.js"></script>
    <script src="js/github.info.js"></script>
    <script src="js/tile-slider.js"></script>
    
    

    <title>Ingeniería de Software y Sistemas UI Windows 8</title>

    <style>
        body {
            background: #039;
        }
    </style>

    <script>
        function Resize(){
            var tiles_area = 0;
            $(".tile-group").each(function(){
                tiles_area += $(this).outerWidth() + 80;

            });

            $(".tiles").css("width", 120 + tiles_area + 20);

            $(".page").css({
                height: $(document).height() - 20,
                width: $(document).width()
            });
        }

        function AddMouseWheel(){
            $("body").mousewheel(function(event, delta){
                var scroll_value = delta * 50;
                if (!jQuery.browser.chrome) {
                    document.documentElement.scrollLeft -= scroll_value;
                } else {
                    this.scrollLeft -= scroll_value;
                }
                return false;
            });
        }

        $(function(){

            Resize();
            AddMouseWheel();

        })


    </script>
</head>
<body class="modern-ui" onresize="Resize()">
<div class="page secondary fixed-header">
    <div class="page-header ">
        <div class="page-header-content">
            <div class="user-login">
                <a href="#">
                    <div class="name">
                        <span class="first-name">Ingeniería en Software</span>
                        <span class="last-name">y Sistemas Computacionales</span>
                    </div>
                    <div class="avatar">
                        <img src="images/soft.jpg"/>
                    </div>
                </a>
            </div>

            <h1>ULSA</h1>
        </div>
    </div>

    <div class="page-region">
        <div class="page-region-content tiles">
            <div class="tile-group">
                <div class="tile image">
                    <div class="tile-content">
                        <img src="images/mct.jpg" alt="">
                    </div>
                </div>

                <div class="tile icon">
                    <div class="tile-content">
                        <img src="images/Mail128.png"/>
                    </div>
                    <div class="brand">
                        <div class="badge"></div>
                        <div class="name">Correos</div>
                    </div>
                </div>

                <div class="tile bg-color-orangeDark icon">
                    <b class="check"></b>
                    <div class="tile-content">
                        <img src="images/Video128.png" alt="" />
                    </div>
                    <div class="brand">
                        <span class="name">Videos</span>
                    </div>
                </div>

                <div class="tile double image">
                    <div class="tile-content">
                        <img src="images/alumnos.png" alt="" />
                    </div>
                    <div class="brand">
                        <span class="name">Imagenes</span>
                        <div class="badge bg-color-orange">5</div>
                    </div>
                </div>

                <div class="tile bg-color-green icon">
                    <div class="tile-content">
                        <img src="images/Market128.png"/>
                    </div>
                    <div class="brand">
                        <span class="name">Tienda ULSA</span>
                        <span class="badge"></span>
                    </div>
                </div>

                <div class="tile bg-color-red icon">
                    <div class="tile-content">
                        <img src="images/Music128.png" alt="" />
                    </div>
                    <div class="brand">
                        <span class="name">Audios</span>
                    </div>
                </div>

                <div class="tile double bg-color-blueDark" data-role="slider" data-param-period="6000" data-param-direction="right" >
                    <div class="tile-content">
                        <h3 style="margin-bottom: 5px;">Soluciones de Tecnología y Comunicaciones</h3><br/>
                        <p>
                            Visitanos, somos los ingenieros en Software y Sistemas de la Universidad La Salle Oaxaca.<br/>
                            
                        </p>                        
                        <h5></h5>
                    </div>
                    <div class="tile-content">
                        <h3 style="margin-bottom: 5px;">Campo de Trabajo</h3><br/>
                        <p>
                            Los ingernieros de Software podemos insertarnos laboralmente en empresas de cualquier tipo o rama industrial o de servicios, públicas o privadas, que busquen competitividad mediante inversiones en Tecnologías de la Información y Comunicación.
                        </p>                        
                        <h5></h5>
                    </div>
                    
                    
                                        <div class="tile-content">
                        <h3 style="margin-bottom: 5px;">Beneficios</h3><br/>
                        <p>
                            Programa Becas
                            Actividades culturales, deportivas y de servicio a la comunidad.
                            Sistema de transporte escolar subsidiado.
                            Laboratorio de Idiomas con la tecnología Tell Me More para el aprendizaje intensivo de inglés.
                        </p>                        
                        <h5></h5>
                    </div>
                    
                                                            <div class="tile-content">
                        <h3 style="margin-bottom: 5px;">Beneficios</h3><br/>
                        <p>
Acceso a base de datos electrónicas (EBSCO), auditorios, biblioteca, cámara de Gesell, centros de cómputo e internet inalámbrico.
Áreas verdes, cafetería, instalaciones deportivas, estacionamientos, gimnasio, danza.
                        </p>                        
                        <h5></h5>
                    </div>
                    
                    
                    
                    <div class="brand">
                        <span class="name"></span>
                    </div>
                </div>

                <div class="tile bg-color-darken icon">
                    <div class="tile-content">
                        <img src="images/YouTube128.png" alt="" />
                    </div>
                    <div class="brand">
                        <span class="name">YouTube</span>
                    </div>
                </div>

                <div class="tile double bg-color-green" data-role="slider" data-param-period="3000">
                    <div class="tile-content">
                        <h2>Descripción</h2>
                        <h5> </h5><br/>
                        <p>El profesional en Ingeniería de Software y Sistemas Computacionales realiza procesos de ingeniería para el desarrollo de software utilizando metodologías apropiadas y actuales.
                        </p>
                    </div>
                    <div class="tile-content">
                        <h2>Objetivo</h2>
                        <h5></h5><br/>
                        <p>
                            Formar profesionales creativos e innovadores capaces de analizar, diseñar, desarrollar, implementar, evaluar y mantener productos de software y redes de datos.
                        </p>
                    </div>
                </div>
                <div class="tile double image-slider" data-role="slider" data-param-period="5000" data-param-direction="left">
                    <div class="tile-content">
                        <img src="images/uno.png" alt="">
                    </div>
                    <div class="tile-content">
                        <img src="images/dos.png" alt="">
                    </div>
                    <div class="tile-content">
                        <img src="images/tres.png" alt="">
                    </div>
                    <div class="tile-content">
                        <img src="images/cuatro.png" alt="">
                    </div>
                    <div class="tile-content">
                        <img src="images/cinco.png" alt="">
                    </div>
                </div>

            </div>

            <div class="tile-group" style="width: 322px;">
                <div class="tile bg-color-blue icon">
                    <div class="tile-content">
                        <img src="images/InternetExplorer128.png"/>
                    </div>
                    <div class="brand">
                        <span class="name">Internet Explorer</span>
                    </div>
                </div>

                <div class="tile icon">
                    <div class="tile-content">
                        <img src="images/excel2013icon.png"/>
                    </div>
                    <div class="brand">
                        <span class="name">Excel 2013</span>
                    </div>
                </div>

                <div class="tile icon">
                    <div class="tile-content">
                        <img src="images/word2013icon.png"/>
                    </div>
                    <div class="brand">
                        <span class="name">Word 2013</span>
                    </div>
                </div>

                <div class="tile icon">
                    <div class="tile-content">
                        <img src="images/onenote2013icon.png"/>
                    </div>
                    <div class="brand">
                        <span class="name">OneNote 2013</span>
                    </div>
                </div>
                <div class="tile double image-set">
                    <div class="tile-content">
                        <img src="images/1.jpg" alt="">
                    </div>
                    <div class="tile-content">
                        <img src="images/2.jpg" alt="">
                    </div>
                    <div class="tile-content">
                        <img src="images/3.jpg" alt="">
                    </div>
                    <div class="tile-content">
                        <img src="images/4.jpg" alt="">
                    </div>
                    <div class="tile-content">
                        <img src="images/5.jpg" alt="">
                    </div>
                    <div class="brand">
                        <span class="name">Photos</span>
                    </div>
                </div>
            </div>

            <div class="tile-group" style="width: 322px;">
                <div class="tile double image">
                    <div class="tile-content">
                        <img src="images/4.jpg" alt="" />
                    </div>
                    <div class="brand bg-color-orange">
                        <img class="icon" src="images/Rss128.png"/>
                        <p class="text">This is a desert eagle. He is very hungry and angry bird.</p>
                        <div class="badge">10</div>
                    </div>
                </div>

                <div class="tile bg-color-blue icon">
                    <div class="tile-content">
                        <img src="images/InternetExplorer128.png"/>
                    </div>
                    <div class="brand">
                        <span class="name">Internet Explorer</span>
                    </div>
                </div>

                <div class="tile icon">
                    <div class="tile-content">
                        <img src="images/excel2013icon.png"/>
                    </div>
                    <div class="brand">
                        <span class="name">Excel 2013</span>
                    </div>
                </div>

                <div class="tile icon">
                    <div class="tile-content">
                        <img src="images/word2013icon.png"/>
                    </div>
                    <div class="brand">
                        <span class="name">Word 2013</span>
                    </div>
                </div>

                <div class="tile icon">
                    <div class="tile-content">
                        <img src="images/onenote2013icon.png"/>
                    </div>
                    <div class="brand">
                        <span class="name">OneNote 2013</span>
                    </div>
                </div>
            </div>

            <div class="tile-group" style="width: 322px;">
                <div class="tile double image">
                    <div class="tile-content">
                        <img src="images/4.jpg" alt="" />
                    </div>
                    <div class="brand bg-color-orange">
                        <img class="icon" src="images/Rss128.png"/>
                        <p class="text">This is a desert eagle. He is very hungry and angry bird.</p>
                        <div class="badge">10</div>
                    </div>
                </div>

                <div class="tile bg-color-blue icon">
                    <div class="tile-content">
                        <img src="images/InternetExplorer128.png"/>
                    </div>
                    <div class="brand">
                        <span class="name">Internet Explorer</span>
                    </div>
                </div>

                <div class="tile icon">
                    <div class="tile-content">
                        <img src="images/excel2013icon.png"/>
                    </div>
                    <div class="brand">
                        <span class="name">Excel 2013</span>
                    </div>
                </div>

                <div class="tile icon">
                    <div class="tile-content">
                        <img src="images/word2013icon.png"/>
                    </div>
                    <div class="brand">
                        <span class="name">Word 2013</span>
                    </div>
                </div>

                <div class="tile icon">
                    <div class="tile-content">
                        <img src="images/onenote2013icon.png"/>
                    </div>
                    <div class="brand">
                        <span class="name">OneNote 2013</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

</body>
</html>