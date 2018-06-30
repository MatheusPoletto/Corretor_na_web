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
			<div class="col-md-12">
				<div class="panel panel-default">
					<div class="panel-heading"><svg class="glyph stroked email"><use xlink:href="#stroked-email"></use></svg> ${mensagem.titulo}</div>
					
					<div class="panel-body">
						<form class="form-horizontal" action="<c:url value="/enviarMensagem"/>" method="post" id="formularioMensagem" role="form">
							<fieldset>
							
							
							
								<!-- Name input-->
								<div class="form-group">
									<label class="col-md-3 control-label" for="name">Data de criação</label>
									<div class="col-md-9">
									<input name="mensagem.titulo" value="${mensagem.dataCriacao}" type="text" class="form-control" disabled>
									</div>
								</div>
							
								<!-- Message body -->
								<div class="form-group">
									<label class="col-md-3 control-label" for="message">Mensagem</label>
									<div class="col-md-9">
										<textarea name="mensagem.texto" class="form-control" rows="5" disabled>${mensagem.texto}</textarea>
									</div>
								</div>
								
								<c:choose>
									<c:when test="${empty mensagem.resposta}">
									<!-- Name input-->
										<div class="form-group">
											<label class="col-md-3 control-label" for="name">Status</label>
											<div class="col-md-9">
											<input type="text" placeholder="Aguardando resposta" class="form-control" disabled>
											</div>
										</div>
									</c:when>
									<c:otherwise>
									<!-- Name input-->
										<div class="form-group">
											<label class="col-md-3 control-label" for="name">Status</label>
											<div class="col-md-9">
											<input type="text" placeholder="Respondido" class="form-control" disabled>
											</div>
										</div>
									</c:otherwise>	
								</c:choose>
									
									
								
								<c:choose>
									<c:when test="${not empty mensagem.resposta}">
								
										<!-- Name input-->
										<div class="form-group">
											<label class="col-md-3 control-label" for="name">Data da resposta</label>
											<div class="col-md-9">
											<input name="mensagem.titulo" value="${mensagem.dataResposta}" type="text" class="form-control" disabled>
											</div>
										</div>
									
										<!-- Message body -->
										<div class="form-group">
											<label class="col-md-3 control-label" for="message">Resposta</label>
											<div class="col-md-9">
												<textarea name="mensagem.resposta" class="form-control" disabled rows="6">${mensagem.resposta}</textarea>
											</div>
										</div>
									</c:when>
								</c:choose>
								
							</fieldset>
						</form>
					</div>
				</div>
			
			
			
		</div><!--/.row-->
		
	<c:import url="script.jsp" />
	
</body>

</html>
