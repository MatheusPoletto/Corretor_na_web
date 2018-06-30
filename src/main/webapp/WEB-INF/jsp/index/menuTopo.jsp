<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<ul class="nav navbar-nav">
	<c:if test="${li_active == 'index'}">
		<li><a class="is-active" href="<c:url value="/"/>">HOME</a></li>
		<li><a href="<c:url value="/sobre"/>">SOBRE</a></li>
		<li><a href="<c:url value="/registro"/>">REGISTRO</a></li>
		<li><a href="<c:url value="/entrar"/>">ENTRAR</a></li>
	</c:if>
	<c:if test="${li_active == 'sobre'}">
		<li><a href="<c:url value="/"/>">HOME</a></li>
		<li><a class="is-active" href="<c:url value="/sobre"/>">SOBRE</a></li>
		<li><a href="<c:url value="/registro"/>">REGISTRO</a></li>
		<li><a href="<c:url value="/entrar"/>">ENTRAR</a></li>
	</c:if>
	<c:if test="${li_active == 'registro'}">
		<li><a href="<c:url value="/"/>">HOME</a></li>
		<li><a href="<c:url value="/sobre"/>">SOBRE</a></li>
		<li><a class="is-active" href="<c:url value="/registro"/>">REGISTRO</a></li>
		<li><a href="<c:url value="/entrar"/>">ENTRAR</a></li>
	</c:if>
	<c:if test="${li_active == 'entrar'}">
		<li><a href="<c:url value="/"/>">HOME</a></li>
		<li><a href="<c:url value="/sobre"/>">SOBRE</a></li>
		<li><a href="<c:url value="/registro"/>">REGISTRO</a></li>
		<li><a class="is-active" href="<c:url value="/entrar"/>">ENTRAR</a></li>
	</c:if>
	<c:if test="${li_active == 'semActive'}">
		<li><a href="<c:url value="/"/>">HOME</a></li>
		<li><a href="<c:url value="/sobre"/>">SOBRE</a></li>
		<li><a href="<c:url value="/registro"/>">REGISTRO</a></li>
		<li><a href="<c:url value="/entrar"/>">ENTRAR</a></li>
	</c:if>


</ul>