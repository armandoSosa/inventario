<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="metro"/>
		<title>Bienvenido a Inventarios</title>
	</head>
	<body class="modern-ui">
		<br><br>
	    <div class="page-region">
               <div class="page-region-content">
               		<div id="status" role="complementary">
						<div id="controller-list" role="navigation">
							<h2>Entidades</h2>
							<ul>
								<g:each var="c" in="${grailsApplication.controllerClasses.sort { it.fullName } }">
									<li class="controller"><g:link controller="${c.logicalPropertyName}">${c.name}</g:link></li>
								</g:each>
							</ul>
						</div>
						
					</div>
					
					<div id="page-body" role="main">
						<h1>Bienvenido a Inventarios</h1>
						
						
						<div class="span8">
                            <div class="hero-unit">
                                <!--<img src="images/windows-8-metro.jpg" class="place-right" style="width: 210px;"/>-->
                                 <div style="">
                                    <h1 class="fg-color-blueLight">Metro UI CSS</h1>

                                    <h2>Create site in Windows 8 style now!</h2>

                                    <br />
                                    <p>Metro UI CSS allows to create a Web site in the style of
                                        Windows 8 quickly and without distractions
                                        on routine tasks.</p>
                                    <h3>To start: include modern.css</h3>
                                    <p class="tertiary-info-text">
                                        &lt;link href="modern.css" rel="stylesheet"&gt;
                                    </p>
                                </div>
                            </div>
                        </div>
                        
                        
                        
                        <div class="span4">
                            <div class="span4 bg-color-red padding30 text-center place-left" style="height: auto;">
                                <h2 class="fg-color-white">Sponsor ?</h2>
                                <p class="fg-color-white">1000+ users every day</p>
                            </div>
                        </div>
                        
					</div>
               </div>
        </div>
        <script language="javascript">
			window.onload = function() {
				location.href="/inventarios3/persona/inicio";
			}
		</script>
		
	</body>
</html>
