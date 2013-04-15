<!DOCTYPE html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html lang="en" class="no-js"><!--<![endif]-->
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<title><g:layoutTitle default="Grails"/></title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link rel="stylesheet" href="${resource(dir: 'css/metro/public/css', file: 'site.css')}" type="text/css">
		<link rel="stylesheet" href="${resource(dir: 'css/metro/public/css', file: 'modern.css')}" type="text/css">
		<link rel="stylesheet" href="${resource(dir: 'css/metro/public/css', file: 'modern-responsive.css')}" type="text/css">
		<g:javascript src="metro/dropdown.js" />
		<g:javascript type="text/javascript">
				    function getWindowsSize(){
				        $("#sizeX").html('W: '+$(window).width());
				        $("#sizeY").html('H: '+$(window).height());
				    }
				    $(function(){
				        getWindowsSize();
				        $(window).resize(function(){
				            getWindowsSize()
				        });
				    })
		</g:javascript>
		<g:layoutHead/>
		<r:layoutResources />
		
		<style type="text/css" media="screen">
			#status {
				background-color: #eee;
				border: .2em solid #fff;
				margin: 2em 2em 1em;
				padding: 1em;
				width: 12em;
				float: left;
				-moz-box-shadow: 0px 0px 1.25em #ccc;
				-webkit-box-shadow: 0px 0px 1.25em #ccc;
				box-shadow: 0px 0px 1.25em #ccc;
				-moz-border-radius: 0.6em;
				-webkit-border-radius: 0.6em;
				border-radius: 0.6em;
			}

			.ie6 #status {
				display: inline; /* float double margin fix http://www.positioniseverything.net/explorer/doubled-margin.html */
			}

			#status ul {
				font-size: 0.9em;
				list-style-type: none;
				margin-bottom: 0.6em;
				padding: 0;
			}

			#status li {
				line-height: 1.3;
			}

			#status h1 {
				text-transform: uppercase;
				font-size: 1.1em;
				margin: 0 0 0.3em;
			}

			#page-body {
				margin: 2em 1em 1.25em 18em;
			}

			h2 {
				margin-top: 1em;
				margin-bottom: 0.3em;
				font-size: 1em;
			}

			p {
				line-height: 1.5;
				margin: 0.25em 0;
			}

			#controller-list ul {
				list-style-position: inside;
			}

			#controller-list li {
				line-height: 1.3;
				list-style-position: inside;
				margin: 0.25em 0;
			}

			@media screen and (max-width: 480px) {
				#status {
					display: none;
				}

				#page-body {
					margin: 0 1em 1em;
				}

				#page-body h1 {
					margin-top: 0;
				}
			}
		</style>
	</head>
	<body>
		
				
				<div style="display: none; position: fixed; height: 100px; width: 100px; padding: 10px; z-index: 10000;" class="bottom-right bg-color-darken fg-color-white">
				    Screen size:
				    <div id="sizeX">0</div>
				    <div id="sizeY">0</div>
				</div>
				
				<div class="bg-color-red fg-color-white text-center">
				    !!! Project is looking for a Sponsor !!!
				</div>
				
				<div class="navigation-bar">
				    <div class="navigation-bar-inner">
				        <span class="menu-pull"></span>
				
				        <div class="brand">
				            <a href="/"><span class="metro-ui-logo place-left"></span></a>
				            <a href="/"><span class="name">Metro UI CSS <sup class="fg-color-yellow tertiary-info-secondary-text"> v 0.1.5</sup></span></a>
				        </div>
				
				        <ul>
				            <li><a href="/">Home</a></li>
				
				            <li data-role="dropdown" class="sub-menu">
				                <a href="#">Scaffolding</a>
				                <ul class="dropdown-menu">
				                    <li><a href="global.php">Global styles</a></li>
				                    <li><a href="layout.php">Layouts and templates</a></li>
				                    <li><a href="grid.php">Grid system</a></li>
				                    <li class="divider"></li>
				                    <li><a href="responsive.php">Responsive design</a></li>
				                </ul>
				            </li>
				
				            <li data-role="dropdown" class="sub-menu">
				                <a href="#">Base CSS</a>
				                <ul class="dropdown-menu">
				                    <li><a href="typography.php">Typography</a></li>
				                    <li><a href="tables.php">Tables</a></li>
				                    <li><a href="forms.php">Forms</a></li>
				                    <li><a href="buttons.php">Buttons</a></li>
				                    <li><a href="images.php">Images</a></li>
				                    <li class="divider"></li>
				                    <li><a href="icons.php">Icons by Metro Studio</a></li>
				                </ul>
				            </li>
				
				            <li data-role="dropdown" class="sub-menu">
				                <a href="#">Components</a>
				                <ul class="dropdown-menu">
				                    <li><a href="tiles.php">Tiles</a></li>
				                    <li><a href="menus.php">Menu and Navigation</a></li>
				                    <li><a href="sidebar.php">Sidebar</a></li>
				                    <li><a href="pagecontrol.php">Page control</a></li>
				                    <li><a href="accordion.php">Accordion</a></li>
				                    <li><a href="buttons-set.php">Buttons set</a></li>
				                    <li><a href="rating.php">Rating</a></li>
				                    <li><a href="progress.php">Progress bars</a></li>
				                    <li class="divider"></li>
				                    <li><a href="notices.php">Notices and Replies</a></li>
				                    <li class="divider"></li>
				                    <li><a href="cards.php">Bonus - Deck of Cards</a></li>
				                </ul>
				            </li>
				
				            <!--<li><a href="javascript.php">Javascript</a></li>-->
				            <li><a href="https://github.com/olton/Metro-UI-CSS">Get source</a></li>
				        </ul>
				
				    </div>
				</div>
				
				
				
				
		<div id="grailsLogo" role="banner"><a href="http://grails.org"><img src="${resource(dir: 'images', file: 'grails_logo.png')}" alt="Grails"/></a></div>
		<g:layoutBody/>
		<div class="footer" role="contentinfo"></div>
		<div id="spinner" class="spinner" style="display:none;"><g:message code="spinner.alt" default="Loading&hellip;"/></div>
		<g:javascript library="application"/>
		<r:layoutResources />
	</body>
</html>
