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
					<div class="panel-heading"><svg class="glyph stroked email"><use xlink:href="#stroked-email"></use></svg> Enviar nova mensagem</div>
					
					<div class="panel-body">
						<form class="form-horizontal" action="<c:url value="/enviarMensagem"/>" method="post" id="formularioMensagem" role="form">
							<fieldset>
							<div class="form-group col-md-12">
									<p>Envie aqui suas dúvidas e sugestões para a administração do sistema. A resposta ficará disponível na página de <a href="<c:url value='/ajPeMinhas'/>">Minhas Perguntas</a>.</p>
							</div>
							
								<!-- Name input-->
								<div class="form-group">
									<label class="col-md-3 control-label" for="name">Assunto</label>
									<div class="col-md-9">
									<input name="mensagem.titulo" value="${mensagem.titulo}" type="text" placeholder="Assunto que descreve a mensagem" class="form-control">
									</div>
								</div>
							
								<!-- Message body -->
								<div class="form-group">
									<label class="col-md-3 control-label" for="message">Mensagem</label>
									<div class="col-md-9">
										<textarea name="mensagem.texto" value="${mensagem.texto}" class="form-control" placeholder="Sua mensagem aqui..." rows="5"></textarea>
									</div>
								</div>
								
								<!-- Form actions -->
								<div class="form-group">
									<div class="col-md-12 widget-right">
										<button type="submit" class="btn btn-default btn-md pull-right">Enviar</button>
									</div>
								</div>
							</fieldset>
						</form>
					</div>
				</div>
			
			
			
		</div><!--/.row-->
		
	<c:import url="script.jsp" />
	
</body>

</html>
