<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div id="sidebar-collapse" class="col-sm-3 col-lg-2 sidebar">
		
		<ul class="nav menu">
			<c:if test="${li_active == 'home'}">
				<li class="active"><a href="<c:url value='/homeUsuario'/>"><span class="glyphicon glyphicon-home"></span> Home</a></li>
				<li><a href="<c:url value='/novoEnvio'/>"><span class="glyphicon glyphicon-open"></span> Analisar novo arquivo</a></li>
				<li><a href="<c:url value='/minhasAnalises'/>"><span class="glyphicon glyphicon-folder-close"></span> Minhas análises</a></li>
				<li><a href="<c:url value='/perfilUsuario'/>"><span class="glyphicon glyphicon-user"></span> Meu perfil</a></li>
			</c:if>
			<c:if test="${li_active == 'novoEnvio'}">
				<li><a href="<c:url value='/homeUsuario'/>"><span class="glyphicon glyphicon-home"></span> Home</a></li>
				<li class="active"><a href="<c:url value='/novoEnvio'/>"><span class="glyphicon glyphicon-open"></span> Analisar novo arquivo</a></li>
				<li><a href="<c:url value='/minhasAnalises'/>"><span class="glyphicon glyphicon-folder-close"></span> Minhas análises</a></li>
				<li><a href="<c:url value='/perfilUsuario'/>"><span class="glyphicon glyphicon-user"></span> Meu perfil</a></li>
			</c:if>
			<c:if test="${li_active == 'minhasAnalises'}">
				<li><a href="<c:url value='/homeUsuario'/>"><span class="glyphicon glyphicon-home"></span> Home</a></li>
				<li><a href="<c:url value='/novoEnvio'/>"><span class="glyphicon glyphicon-open"></span> Analisar novo arquivo</a></li>
				<li class="active"><a href="<c:url value='/minhasAnalises'/>"><span class="glyphicon glyphicon-folder-close"></span> Minhas análises</a></li>
				<li><a href="<c:url value='/perfilUsuario'/>"><span class="glyphicon glyphicon-user"></span> Meu perfil</a></li>
			</c:if>
			<c:if test="${li_active == 'perfilUsuario'}">
				<li><a href="<c:url value='/homeUsuario'/>"><span class="glyphicon glyphicon-home"></span> Home</a></li>
				<li><a href="<c:url value='/novoEnvio'/>"><span class="glyphicon glyphicon-open"></span> Analisar novo arquivo</a></li>
				<li><a href="<c:url value='/minhasAnalises'/>"><span class="glyphicon glyphicon-folder-close"></span> Minhas análises</a></li>
				<li class="active"><a href="<c:url value='/perfilUsuario'/>"><span class="glyphicon glyphicon-user"></span> Meu perfil</a></li>
			</c:if>
			<c:if test="${li_desative == 'sim'}">
				<li><a href="<c:url value='/homeUsuario'/>"><span class="glyphicon glyphicon-home"></span> Home</a></li>
				<li><a href="<c:url value='/novoEnvio'/>"><span class="glyphicon glyphicon-open"></span> Analisar novo arquivo</a></li>
				<li><a href="<c:url value='/minhasAnalises'/>"><span class="glyphicon glyphicon-folder-close"></span> Minhas análises</a></li>
				<li><a href="<c:url value='/perfilUsuario'/>"><span class="glyphicon glyphicon-user"></span> Meu perfil</a></li>
			</c:if>
			<li role="presentation" class="divider"></li>
			
			<c:choose>
				<c:when test="${li_active == 'ajuda'}">
					<li class="active"><a href="<c:url value='/ajuda'/>"><span class="glyphicon glyphicon-question-sign"></span> Ajuda</a></li>
				
				</c:when>
				<c:otherwise>
		     		<li><a href="<c:url value='/ajuda'/>"><span class="glyphicon glyphicon-question-sign"></span> Ajuda</a></li>				
				</c:otherwise>
				</c:choose>
		   									
			<li><a href="<c:url value='/sair'/>"><svg class="glyph stroked male-user"><use xlink:href="#stroked-male-user"></use></svg> Sair</a></li>
		</ul>

	</div><!--/.sidebar-->