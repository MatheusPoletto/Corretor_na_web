<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
	<c:import url="head.jsp" />
</head>

<body>
	<c:import url="menuTopo.jsp" />
		
	<c:import url="menuEsquerdo.jsp" />
		
	<div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">			
		<c:import url="path.jsp" />
		
		
		<!-- <div class="row">
			<div class="col-lg-12">
				<h1 class="page-header">Dashboard</h1>
			</div>
		</div><!--/.row-->
		
		</br>
		
		<div class="row">
				<div class="col-lg-12">
					<legend>Minhas perguntas</legend>
			
						<table class="table table-bordered">
						<thead>
							<tr>
								<th>ID</th>
								<th>Data de criação</th>
								<th>Assunto</th>
								<th>Status</th>
							</tr>
						</thead>
						<!-- TODAS AS LINHAS DA TABELA POSSUEM UM LINK QUE ABREM O PDF (CLICAR EM CIMA DA LINHA) -->
						<tbody id="myTable">
							<c:forEach items="${mensagemview}" var="mensagem">
								<c:choose>
									<c:when test="${empty mensagem.resposta}">
										<tr class="warning">
										
											<td>
												<a href="<c:url value='/abrirMsg/${mensagem.codigo}'/>">${mensagem.codigo}</a>
											</td>
											<td>
												<a href="<c:url value='/abrirMsg/${mensagem.codigo}'/>">${mensagem.dataCriacao}</a>
											</td>
											<td>
												<a href="<c:url value='/abrirMsg/${mensagem.codigo}'/>">${mensagem.titulo}</a>
											</td>
											<td>
												<a href="<c:url value='/abrirMsg/${mensagem.codigo}'/>">Aguardando resposta...</a>
											</td>
											
										</tr>										
									</c:when>
									<c:otherwise>
										<tr class="success">
										
											<td>
												<a href="<c:url value='/abrirMsg/${mensagem.codigo}'/>">${mensagem.codigo}</a>
											</td>
											<td>
												<a href="<c:url value='/abrirMsg/${mensagem.codigo}'/>">${mensagem.dataCriacao}</a>
											</td>
											<td>
												<a href="<c:url value='/abrirMsg/${mensagem.codigo}'/>">${mensagem.titulo}</a>
											</td>
											<td>
												<a href="<c:url value='/abrirMsg/${mensagem.codigo}'/>">Respondida</a>
											</td>
											
										</tr>	
									</c:otherwise>
								</c:choose>
							</c:forEach>
						</tbody>
					</table>
					
     				
					
				</div> <!-- FIM COL AO LADO DO MENU ESQUERDO -->
			</div> <!-- FIM ROW AO LADO DO MENU ESQUERDO -->
		
		
	<c:import url="script.jsp" />
	
</body>


</html>
