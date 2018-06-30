<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<nav class="navbar navbar-inverse navbar-fixed-top " style="padding-top: 10px;">
	<a data-original-title="Show/Hide Menu" data-placement="bottom" data-tooltip="tooltip" class="accordion-toggle btn btn-primary btn-sm visible-xs" data-toggle="collapse" href="#menu" id="menu-toggle">
		<i class="icon-align-justify"></i>
	</a>
	
	<!-- LOGO SECTION -->
	<header class="navbar-header">
		<a href="index.html" class="navbar-brand">
	    	<!--<img src="assets/img/logo.png" alt="" />-->
	    	CORRETOR WEB
	    </a>
	</header>
	<!-- END LOGO SECTION -->
		<ul class="nav navbar-top-links navbar-right">
	    	<!--ADMIN SETTINGS SECTIONS -->
		    <li class="dropdown">
	    	    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
	        	    <i class="icon-user "></i>&nbsp; <i class="icon-chevron-down "></i>
	            </a>
	         	<ul class="dropdown-menu dropdown-user">
	            	<li><a href="<c:url value='/perfilUsuario'/>"><i class="icon-user"></i> Perfil </a></li>
	                <li class="divider"></li>
	                <li><a href="<c:url value='/sairAdm'/>"><i class="icon-signout"></i> Sair </a></li>
	            </ul>
	 		</li>
	        <!--END ADMIN SETTINGS -->
	     </ul>
</nav>