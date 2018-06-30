<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
	<div class="container-fluid">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#sidebar-collapse">
						<span class="sr-only">Toggle navigation</span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
					</button>
					<!-- <a class="navbar-brand" href="<c:url value="/homeUsuario"/>"/><span>CORRETOR NA WEB</span></a> -->
					<a class="navbar-brand" href="<c:url value="/homeUsuario"/>"/>CORRETOR WEB</a>
					<ul class="user-menu">
						<li class="dropdown pull-right">
							<a href="#" class="dropdown-toggle" data-toggle="dropdown"><svg class="glyph stroked male-user"><use xlink:href="#stroked-male-user"></use></svg> Conta <span class="caret"></span></a>
							<ul class="dropdown-menu" role="menu">
								<li><a href="<c:url value='/perfilUsuario'/>"><svg class="glyph stroked male-user"><use xlink:href="#stroked-male-user"></use></svg> Perfil</a></li>
								<li><a href="<c:url value='/sair'/>"><svg class="glyph stroked cancel"><use xlink:href="#stroked-cancel"></use></svg> Sair</a></li>
							</ul>
						</li>
					</ul>
				</div>
								
	</div><!-- /.container-fluid -->
</nav>